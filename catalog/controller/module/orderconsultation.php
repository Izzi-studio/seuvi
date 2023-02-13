<?php
class ControllerModuleOrderconsultation extends Controller {
	public function index($setting) {
		$this->load->language('module/orderconsultation');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_your_phone'] = $this->language->get('text_your_phone');
		$data['text_get_consultation'] = $this->language->get('text_get_consultation');
		$data['text_description'] = $this->language->get('text_description');

        $data['text_thanks'] = $this->language->get('text_thanks');

        $data['action'] = $this->url->link('information/contact/orderConsultation','',true);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/orderconsultation.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/orderconsultation.tpl', $data);
        } else {
            return $this->load->view('default/template/module/orderconsultation.tpl', $data);
        }
	}
}