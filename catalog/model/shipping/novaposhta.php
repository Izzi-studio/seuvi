<?php

class ModelShippingnovaposhta extends Model {

    function getQuote($address) {
        //$cities = $this->load->controller('quickcheckout/shippingdata');
        //($cities); die();


        $this->load->language('shipping/novaposhta');

        if ($this->config->get('novaposhta_status')) {
		$cost = 0;
		$quote_data = array();
		$quote_data['warehouse'] = array(
		'code' => 'novaposhta.warehouse',
		'title' => $this->language->get('text_description'),
		'cost' => $cost,
		'tax_class_id' => 0,
		'text' => $this->currency->format($cost)
		);
		$method_data = array(
		'code' => 'novaposhta',
		'title' => $this->language->get('text_title'),
		'sort_order' => $this->config->get('novaposhta_sort_order'),
		'error' => FALSE,
		$method_data['quote'] = array()
		);

		$method_data['quote'] = $quote_data;
	}
	return $method_data;
    }


}