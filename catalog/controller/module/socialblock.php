<?php
class ControllerModuleSocialblock extends Controller {
	public function index($setting) {
		$this->load->language('module/socialblock');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_followers'] = $this->language->get('text_followers');
		$data['text_inst_description'] = $this->language->get('text_inst_description');
		$data['text_fb_description'] = $this->language->get('text_fb_description');
		$data['text_tiktok_description'] = $this->language->get('text_tiktok_description');


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/socialblock.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/socialblock.tpl', $data);
        } else {
            return $this->load->view('default/template/module/socialblock.tpl', $data);
        }
	}
}