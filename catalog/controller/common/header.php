<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code']);
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['cur_lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
        $this->load->language('module/adv_ajaxfilter');
		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
			$data['wishlist_count'] = $this->model_account_wishlist->getTotalWishlist();
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
            $data['wishlist_count'] = (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

        //custom
        $data['text_header_city']    = $this->language->get('text_header_city');
        $data['text_manufacturers']    = $this->language->get('text_manufacturers');
        $data['text_header_grafik_raboty']    = $this->language->get('text_header_grafik_raboty');
        $data['text_header_bez_vyhodnyh']    = $this->language->get('text_header_bez_vyhodnyh');
        $data['text_header_osennie_skidki']    = $this->language->get('text_header_osennie_skidki');
        $data['text_header_besplatnaya_dostavka']    = $this->language->get('text_header_besplatnaya_dostavka');

        $data['text_menu_sale']    = $this->language->get('text_menu_sale');
        $data['text_menu_new']    = $this->language->get('text_menu_new');
        $data['text_menu_otzivi']    = $this->language->get('text_menu_otzivi');
        $data['text_menu_klientam']    = $this->language->get('text_menu_klientam');

        $data['text_svernut']    = $this->language->get('text_svernut');
        $data['text_razsvernut']    = $this->language->get('text_razsvernut');
        $data['time']    = $this->config->get('config_open');
        $blog_title = $this->config->get('blogsetting_home_title');
        $data['text_blog']    =  $blog_title[$this->language->get('code')];


        $data['link_manufacturers'] = $this->url->link('product/manufacturer','',true);
        $data["newest_link"]= $this->url->link('product/new','','SSL');
		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['blog_link'] = $this->url->link('blog/home', '', 'SSL');
        $data['special_link'] = $this->url->link('product/special','',true);
        $data['review_link'] = $this->url->link('review/review','',true);
        $data['telephone_footer'] = $this->config->get('config_telephone_footer');
		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);
		/*foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}*/

        foreach ($categories as $category) {
            $children_data = array();
            if ($category['top']) {
            //if ($category['category_id'] == $data['category_id']) {
            $children = $this->model_catalog_category->getCategories($category['category_id']);

            foreach($children as $child) {
                $filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                $childrenNested = $this->model_catalog_category->getCategories($child['category_id']);
                $nestedCategory = array();
                foreach($childrenNested as $childNested) {
                    $nestedCategory[] = array(
                        'category_id' => $childNested['category_id'],
                        //'name' => $childNested['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'name' => $childNested['name'],
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']. '_' . $childNested['category_id'])
                    );
                }

                $children_data[] = array(
                    'category_id' => $child['category_id'],
                    //'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                    'name' => $child['name'],
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
                    'children' =>$nestedCategory
                );
            }
            //}

            $filter_data = array(
                'filter_category_id'  => $category['category_id'],
                'filter_sub_category' => true
            );
            if ($category['image'] != '') {
                $image = $this->model_tool_image->resize($category['image'],80,80);
            }else {
                $image = '';
            }

            $data['categories'][] = array(
                'category_id' => $category['category_id'],
                'image' => $image ,
                //'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                'name'        => $category['name'] ,
                'children'    => $children_data,
                'href'        => $this->url->link('product/category', 'path=' . $category['category_id']),
                'column'   => $category['column'] ? $category['column'] : 1,
            );
        }
        }

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}


        $this->load->model('catalog/information');



        foreach ($this->model_catalog_information->getInformations(true) as $result) {
            if ($result['top']) {
                $data['informations'][] = array(
                    'title' => $result['title'],
                    'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }
        }

        $this->load->model('catalog/manufacturer');

        $this->load->model('tool/image');

        $data['manufacturers'] = array();

        $manufacturers = $this->model_catalog_manufacturer->getManufacturers();

        if (!empty($manufacturers)) {
            foreach ($manufacturers as $manufacturer_info) {

                if ($manufacturer_info) {
                    if ($manufacturer_info['image']) {
                        $image = $this->model_tool_image->resize($manufacturer_info['image'], 270, 270);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', 270, 270);
                    }

                    $data['manufacturers'][] = array(
                        'thumb'       => $image,
                        'name'        => $manufacturer_info['name'],
                        'href'        => $this->url->link('product/manufacturer', 'manufacturer_id=' . $manufacturer_info['manufacturer_id'])
                    );
                }
            }
        }

        $this->load->language('common/search');

        $data['text_search'] = $this->language->get('text_search');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}
