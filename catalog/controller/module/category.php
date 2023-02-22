<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
        $this->load->model('tool/image');
		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

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
                if ($category['image'] != ''){

                    if(utf8_strtolower(utf8_substr(strrchr($category['image'], '.'), 1)) == 'svg'){
                        $image= FRONT_IMAGES.stristr($category['image'],'catalog/');
                    }else{
                        $image = $this->model_tool_image->resize(utf8_substr($category['image'], utf8_strlen(DIR_IMAGE)), 100, 100);
                    }


                 //$image = $this->model_tool_image->resize($category['image'],80,80);
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
        $this->load->language('module/adv_ajaxfilter');
        $this->load->model('catalog/manufacturer');
        $data['text_manufacturers']    = $this->language->get('text_manufacturers');
        $data['link_manufacturers'] = $this->url->link('product/manufacturer','',true);
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
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/category.tpl', $data);
		}
	}
}