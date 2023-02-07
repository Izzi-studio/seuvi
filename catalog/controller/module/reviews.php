<?php
class ControllerModuleReviews extends Controller {
	public function index($setting) {
		$this->load->language('module/reviews');
		$this->load->model('catalog/review');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');


        $data['reviews'] = array();
        $cat_id = false;
        $data['path'] = "";
        if(isset($this->request->get['path'])) {
            $data['path'] = $this->request->get['path'];
            $parts = explode('_', (string)$this->request->get['path']);
            $cat_id = array_pop($parts);
        }

        $productIds = $this->model_catalog_product->getProducts(['start'=>0,'limit'=>5,'order'=>'rating','order'=>'DESC','filter_category_id'=>$cat_id]);
        foreach ($productIds as $product) {
            $results = $this->model_catalog_review->getReviewsByProductId($product['product_id'],0,1);
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }
            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
            } else {
                $image = false;
            }
            if(!empty($results)) {
                foreach ($results as $result) {
                    $data['reviews'][] = array(
                        'product_image' => $image,
                        'product_name' => $product['name'],
                        'product_price' => $price,
                        'product_link' => $this->url->link('product/product','product_id=' . $product['product_id'],'','SSL' ),
                        'author' => $result['author'],
                        'text' => nl2br($result['text']),
                        'rating' => (int)$result['rating'],
                        'date_added' => date(
                            $this->language->get('date_format_short'),
                            strtotime($result['date_added'])
                        )
                    );
                }
            }
        }


        $category = $this->model_catalog_category->getCategory($cat_id);

        $data['heading_title'] = sprintf($this->language->get('heading_title'),$category['name']);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/reviews.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/reviews.tpl', $data);
        } else {
            return $this->load->view('default/template/module/faq.tpl', $data);
        }
	}
}