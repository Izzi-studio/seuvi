<?php

class ControllerShippingUkrposhtaint extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('shipping/ukrposhtaint');
	$this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('ukrposhtaint', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token']);
        }

        $data['heading_title'] = $this->language->get('heading_title');
	$data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_select'] = $this->language->get('text_select');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_api_url'] = $this->language->get('entry_api_url');
        $data['entry_api_key'] = $this->language->get('entry_api_key');
        $data['entry_city_from'] = $this->language->get('entry_city_from');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_min_total_for_free_delivery'] = $this->language->get('entry_min_total_for_free_delivery');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
	$data['admin_language_id'] = $this->config->get('config_admin_language');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }


	if (isset($this->error['api_url'])) {
		$data['error_api_url'] = $this->error['api_url'];
	} else {
		$data['error_api_url'] = '';
	}

	if (isset($this->error['api_key'])) {
		$data['error_api_key'] = $this->error['api_key'];
	} else {
		$data['error_api_key'] = '';
	}


        $this->document->breadcrumbs = array();

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_shipping'),
            'separator' => ' :: '
        );

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=shipping/ukrposhtaint&token=' . $this->session->data['token'],
            'text' => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        $data['action'] = HTTPS_SERVER . 'index.php?route=shipping/ukrposhtaint&token=' . $this->session->data['token'];
        $data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'];


        if (isset($this->request->post['ukrposhtaint_status'])) {
            $data['ukrposhtaint_status'] = $this->request->post['ukrposhtaint_status'];
        } else {
            $data['ukrposhtaint_status'] = $this->config->get('ukrposhtaint_status');
        }

        if (isset($this->request->post['ukrposhtaint_api_url'])) {
            $data['ukrposhtaint_api_url'] = $this->request->post['ukrposhtaint_api_url'];
        } else {
            $data['ukrposhtaint_api_url'] = $this->config->get('ukrposhtaint_api_url');
        }

        if (isset($this->request->post['novaposhta_api_key'])) {
            $data['ukrposhtaint_api_key'] = $this->request->post['ukrposhtaint_api_key'];
        } else {
            $data['ukrposhtaint_api_key'] = $this->config->get('ukrposhtaint_api_key');
        }


        if (isset($this->request->post['novaposhta_sort_order'])) {
            $data['ukrposhtaint_sort_order'] = $this->request->post['ukrposhtaint_sort_order'];
        } else {
            $data['ukrposhtaint_sort_order'] = $this->config->get('ukrposhtaint_sort_order');
        }

       
	$data['header'] = $this->load->controller('common/header');
	$data['column_left'] = $this->load->controller('common/column_left');
	$data['footer'] = $this->load->controller('common/footer');

	$this->response->setOutput($this->load->view('shipping/ukrposhtaint.tpl',$data));
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'shipping/ukrposhtaint')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

	if (!$this->request->post['ukrposhtaint_api_url']) {
	    $this->error['api_key'] = $this->language->get('error_api_url');
	}

	if (!$this->request->post['ukrposhtaint_api_key']) {
	    $this->error['api_key'] = $this->language->get('error_api_key');
	}


	return !$this->error;

    }
}