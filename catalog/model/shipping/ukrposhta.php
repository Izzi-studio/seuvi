<?php

class ModelShippingUkrposhta extends Model {

    function getQuote($address) {
        $this->load->language('shipping/ukrposhta');
        $method_data = [];
        if ($this->config->get('ukrposhta_status')) {
		$cost = 0;
		$quote_data = array();
		$quote_data['warehouse'] = array(
            'code' => 'ukrposhta.warehouse',
            'title' => $this->language->get('text_description'),
            'cost' => $cost,
            'tax_class_id' => 0,
            'text' => $this->currency->format($cost)
		);
		$method_data = array(
            'code' => 'ukrposhta',
            'title' => $this->language->get('text_title'),
            'sort_order' => $this->config->get('ukrposhta_sort_order'),
            'error' => FALSE,
		    $method_data['quote'] = array()
		);

		$method_data['quote'] = $quote_data;
	}
	return $method_data;
    }

}