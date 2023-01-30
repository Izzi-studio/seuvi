<?php
class ControllerModuleFaqproduct extends Controller {
	public function index($setting) {
		$this->load->language('module/faqproduct');
		$this->load->model('faq/faq');

        $faqs = $this->model_faq_faq->getFaqsProduct();
        $data['faqs'] = [];
        foreach($faqs as $faq){
                $data['faqs'][] = [
                    'title' => $faq['title'],
                    'description' => html_entity_decode($faq['description'], ENT_QUOTES, 'UTF-8'),
                ];
        }


        $data['heading_title'] = $this->language->get('heading_title');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/faqproduct.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/faqproduct.tpl', $data);
        } else {
            return $this->load->view('default/template/module/faqproduct.tpl', $data);
        }
	}
}