<?php
class ControllerModuleFavoritedcategories extends Controller {
	public function index($setting) {
		$this->load->language('module/favoritedcategories');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('catalog/category');

		$this->load->model('tool/image');

		$data['categories'] = array();

        $categories = $this->model_catalog_category->getFavoritesCategories();

		if (!empty($categories)) {

			foreach ($categories as $category_info) {

				if ($category_info) {
					if ($category_info['image']) {
						//$image = $this->model_tool_image->resize($category_info['image'], 270, 270);
						$image = FRONT_IMAGES.$category_info['image'];
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', 270, 270);
					}
					
					$data['categories'][] = array(
						'thumb'       => $image,
						'name'        => $category_info['name'],
						'href'        => $this->url->link('product/category', 'category_id=' . $category_info['category_id'])
					);
				}
			}
		}

	
		
		if ($data['categories']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/favoritedcategories.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/favoritedcategories.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featuredcategories.tpl', $data);
			}
		}
	}
}