<?php
class ControllerModuleFaq extends Controller {
	public function index($setting) {
		$this->load->language('module/faq');
		$this->load->model('faq/faq');
		$this->load->model('catalog/category');



        $cat_id = false;
        $data['path'] = "";
        if(isset($this->request->get['path'])) {
            $data['path'] = $this->request->get['path'];
            $parts = explode('_', (string)$this->request->get['path']);
            $cat_id = array_pop($parts);
        }

        $faqsIds = $this->model_faq_faq->getFaqsByCategoryId($cat_id);

        $faqs = $this->model_faq_faq->getFaqs($faqsIds);
        $data['faqs'] = [];
        if ($faqs) {
            foreach ($faqs as $faq) {
                if ($faq['in_product'] == 0) {
                    $data['faqs'][] = [
                        'title' => $faq['title'],
                        'description' => html_entity_decode($faq['description'], ENT_QUOTES, 'UTF-8'),
                    ];
                }
            }
        }
        $category = $this->model_catalog_category->getCategory($cat_id);

        $data['heading_title'] = sprintf($this->language->get('heading_title'),$category['name']);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/faq.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/faq.tpl', $data);
        } else {
            return $this->load->view('default/template/module/faq.tpl', $data);
        }
	}
}