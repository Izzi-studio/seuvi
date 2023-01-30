<?php
class ControllerFaqFaq extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('faq/faq');

		$this->document->setTitle($this->language->get('heading_title'));
		 
		$this->load->model('faq/faq');

		$this->getList();
	}

	public function insert() {
		$this->load->language('faq/faq');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('faq/faq');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->model_faq_faq->addFaq($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			
			$this->response->redirect($this->url->link('faq/faq', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('faq/faq');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('faq/faq');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->model_faq_faq->editFaq($this->request->get['faq_id'], $this->request->post);

			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('faq/faq', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
 
	public function delete() {
		$this->load->language('faq/faq');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('faq/faq');

		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $faq_id) {
				$this->model_faq_faq->deleteFaq($faq_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			
			$this->response->redirect($this->url->link('faq/faq', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
		$url = "";

		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('faq/faq', 'token=' . $this->session->data['token'] . $url, 'SSL')
   		);

		$data['add'] = $this->url->link('faq/faq/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('faq/faq/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}



		$data['faqs'] = array();

		$filter_data = array(
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

        $faq_total = $this->model_faq_faq->getTotalFaq();

		$results = $this->model_faq_faq->getFaqs($filter_data);

    	foreach ($results as $result) {

			$data['faqs'][] = array(
				'faq_id' => $result['faq_id'],
				'title'      => $result['title'],
				'in_product'      => $result['in_product'],
				'description'      => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
				'selected'   => isset($this->request->post['selected']) && in_array($result['blog_id'], $this->request->post['selected']),
				'edit'     => $this->url->link('faq/faq/update', 'token=' . $this->session->data['token'] . '&faq_id=' . $result['faq_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_title'] = $this->language->get('column_title');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_comments'] = $this->language->get('column_comments');
		$data['column_count_read'] = $this->language->get('column_count_read');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_in_product'] = $this->language->get('entry_in_product');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';


		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}



		$url = '';


		$pagination = new Pagination();
		$pagination->total = $faq_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('faq/faq', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($faq_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($faq_total - $this->config->get('config_limit_admin'))) ? $faq_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $faq_total, ceil($faq_total / $this->config->get('config_limit_admin')));



		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('faq/faq_list.tpl', $data));
	}

	private function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_form'] = $this->language->get('heading_form');

		$data['entry_in_product'] = $this->language->get('entry_in_product');
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_links'] = $this->language->get('tab_links');
		$data['tab_comments'] = $this->language->get('tab_comments');
		$data['tab_design'] = $this->language->get('tab_design');
		
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
    	$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_all_users'] = $this->language->get('text_all_users');
		$data['text_member_only'] = $this->language->get('text_member_only');
		$data['text_please_select'] = $this->language->get('text_please_select');
    	$data['text_approve'] = $this->language->get('text_approve');
    	$data['text_unapprove'] = $this->language->get('text_unapprove');
    	$data['text_delete'] = $this->language->get('text_delete');
		$data['text_approved'] = $this->language->get('text_approved');
    	$data['text_unapproved'] = $this->language->get('text_unapproved');
		$data['text_no_comments'] = $this->language->get('text_no_comments');
		
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_page_title'] = $this->language->get('entry_page_title');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_short_description'] = $this->language->get('entry_short_description');
		$data['entry_short_description_h'] = $this->language->get('entry_short_description_h');
		$data['entry_tags'] = $this->language->get('entry_tags');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_related'] = $this->language->get('entry_related');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_author'] = $this->language->get('entry_author');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_allow_comment'] = $this->language->get('entry_allow_comment');
		
		$data['entry_layout'] = $this->language->get('entry_layout');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['allow_author_change'] = $this->config->get('blogsetting_author_change');

		$data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('faq/faq', 'token=' . $this->session->data['token'] . $url, 'SSL')
   		);
							
		if (!isset($this->request->get['faq_id'])) {
			$data['action'] = $this->url->link('faq/faq/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('faq/faq/update', 'token=' . $this->session->data['token'] . '&faq_id=' . $this->request->get['faq_id'] . $url, 'SSL');
		}
		
		$data['cancel'] = $this->url->link('faq/faq', 'token=' . $this->session->data['token'] . $url, 'SSL');

				
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['faq_description'])) {
			$data['faq_description'] = $this->request->post['faq_description'];
		} elseif (isset($this->request->get['faq_id'])) {
			$data['faq_description'] = $this->model_faq_faq->getFaqDescriptions($this->request->get['faq_id']);
		} else {
			$data['faq_description'] = array();
		}

		$faq_info = $this->model_faq_faq->getFaq($this->request->get['faq_id']);


        if (isset($this->request->post['in_product'])) {
            $data['in_product'] = $this->request->post['in_product'];
        } elseif (isset($faq_info)) {
            $data['in_product'] = $faq_info['in_product'];
        } else {
            $data['in_product'] = 0;
        }



        // Categories
        $this->load->model('catalog/category');

        if (isset($this->request->post['category_faq'])) {
            $categoriesFaq = $this->request->post['category_faq'];
        } elseif (isset($this->request->get['faq_id'])) {
            $categoriesFaq = $this->model_faq_faq->getCategoriesToFaq($this->request->get['faq_id']);
        } else {
            $categoriesFaq = array();
        }

        $data['categories_faq'] = array();

        foreach ($categoriesFaq as $category_id) {
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info) {
                $data['categories_faq'][] = array(
                    'category_id' => $category_info['category_id'],
                    'name' => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                );
            }
        }

		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('faq/faq_form.tpl', $data));
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'blog/blog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['blog_description'] as $language_id => $value) {
			if ((strlen(utf8_decode($value['title'])) < 3) || (strlen(utf8_decode($value['title'])) > 128)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
		
		}

		if (!$this->error) {
			return TRUE;
		} else {
			if (!isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_required_data');
			}
			return FALSE;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'blog/blog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('blog/blog');

			

			$results = $this->model_blog_blog->getBlogs(0);

			foreach ($results as $result) {
				$json[] = array(
					'blog_id' => $result['blog_id'],
					'title'        => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['title'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
}