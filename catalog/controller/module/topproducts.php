<?php
class ControllerModuleTopproducts extends Controller {
	public function index($setting) {
		$this->load->language('module/topproducts');
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

        $products = $this->model_catalog_product->getTopProduct($cat_id);

        $data['top_products'] = array();

        foreach ($products as $product_id) {
            $related_info = $this->model_catalog_product->getProduct($product_id);
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($related_info['price'], $related_info['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }
            if ($related_info) {
                $data['top_products'][] = array(
                    'product_id' => $related_info['product_id'],
                    'price' => $price,
                    'name'       => $this->url->link('product/product', 'product_id=' . $related_info['product_id']),
                    'href'       => $related_info['name']
                );
            }
        }

        $category = $this->model_catalog_category->getCategory($cat_id);

        $data['heading_title'] = sprintf($this->language->get('heading_title'),$category['name']);
        $data['text_price'] = $this->language->get('text_price');
        $data['text_name'] = $this->language->get('text_name');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/topproducts.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/topproducts.tpl', $data);
        } else {
            return $this->load->view('default/template/module/faq.tpl', $data);
        }
	}
}