<?php
class ControllerModuleFeaturedcategory extends Controller {
	public function index($setting) {

		$this->load->language('module/featuredcategory');

        if(isset($setting['descriptions']['title'])){
            $data['heading_title'] = $setting['descriptions']['title'];
        }else {
            $data['heading_title'] = $this->language->get('heading_title');
        }

		$data['text_tax'] = $this->language->get('text_tax');
		$data['btn_text'] = $this->language->get('btn_text');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/manufacturer');

		$this->load->model('tool/image');

		$data['category'] = array();



		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}
		
	    
		

		if (!empty($setting['category'])) {
			//$category = array_slice($setting['category'], 0, (int)$setting['limit']);
			foreach ($setting['category'] as $c) {
				//$category_info = $this->model_catalog_category->getCategory($c);
                $filter_data = array(
                    'filter_category_id' => $c,
                    'limit' => $setting['limit'],
                    'start' => 0
                );
                $results = $this->model_catalog_product->getProducts($filter_data);

                foreach ($results as $product_info) {

                    if ($product_info) {
                        if ($product_info['image']) {
                            $image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
                        } else {
                            $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                        }

                        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                            $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                        } else {
                            $price = false;
                        }

                        if ((float)$product_info['special']) {
                            $percentSale = (((int)$product_info['price'] - (int)$product_info['special']) / (int)$product_info['price']) * 100  ;

                            $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                        } else {
                            $special = false;
                            $percentSale = false;
                        }

                        if ($this->config->get('config_tax')) {
                            $tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
                        } else {
                            $tax = false;
                        }

                        if ($this->config->get('config_review_status')) {
                            $rating = $product_info['rating'];
                        } else {
                            $rating = false;
                        }

                        $manufacturer = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);


                        $data['products'][] = array(
                            'product_id'  => $product_info['product_id'],
                            'thumb'       => $image,
                            'name'        => $product_info['name'],
                            'manufacturer'        => $manufacturer['name'],
                            'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                            'price'       => $price,
                            'special'     => $special,
                            'percent_sale'     => $percentSale,
                            'tax'         => $tax,
                            'rating'      => $rating,
                            'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
                        );
                    }
                }
			}

        $data["href"]= $this->url->link('product/category', 'category_id=' . $c);
		}

	
		
		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featuredcategory.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featuredcategory.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}