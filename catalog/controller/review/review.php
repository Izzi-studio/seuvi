<?php
class ControllerReviewReview extends Controller {
    public function index(){
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        $data['heading_title'] =  $this->language->get('text_menu_otzivi');

        $this->load->model('localisation/language');
        $language = $this->model_localisation_language->getLanguage($this->config->get('config_language_id'));
        $locale = $language['code'] == 'ua' ? 'uk' : $language['code'];
        $reviewsJson = file_get_contents(URL_GET_GOOGLE_REVIEWS.'&language='.$locale);
        $data['reviews'] = json_decode($reviewsJson)->result->reviews;


        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );


        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_menu_otzivi'),
            'href' => $this->url->link('review/review')
        );


        $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/review/review.tpl', $data));
    }
}