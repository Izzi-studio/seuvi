<?php
class ControllerModuleFeaturedmanufacturer extends Controller {
	public function index($setting) {
		$this->load->language('module/featuredmanufacturer');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_brendov'] = $this->language->get('text_brendov');

		$this->load->model('catalog/manufacturer');

		$this->load->model('tool/image');

		$data['manufacturers'] = array();

        $manufacturers = $this->model_catalog_manufacturer->getManufacturers([],true);

		if (!empty($manufacturers)) {
            $data['manufacturers_count'] = count($manufacturers);
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


        $data['link_all'] = $this->url->link('product/manufacturer','',true);
		
		if ($data['manufacturers']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featuredmanufacturer.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featuredmanufacturer.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}