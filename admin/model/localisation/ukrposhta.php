<?php
class ModelLocalisationNovaposhta extends Model {

	public function getcities($api_key) {
		$cities = array();
		$get_cities = curl_init();
		if ($this->config->get('novaposhta_api_url')) {
			curl_setopt($get_cities, CURLOPT_URL, $this->config->get('novaposhta_api_url'));
		} else {
			curl_setopt($get_cities, CURLOPT_URL, 'https://api.novaposhta.ua/v2.0/json/');
		}
		curl_setopt($get_cities, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($get_cities, CURLOPT_HTTPHEADER, Array("Content-Type: text/plain"));
		curl_setopt($get_cities, CURLOPT_HEADER, 0);
		curl_setopt($get_cities, CURLOPT_POSTFIELDS, '{"modelName": "Address","calledMethod": "getCities","methodProperties": {"": ""},"apiKey":"' . $api_key . '"}');
		curl_setopt($get_cities, CURLOPT_POST, 1);
		curl_setopt($get_cities, CURLOPT_SSL_VERIFYPEER, 0);
		$cities = json_decode(curl_exec($get_cities), TRUE);
		curl_close($get_cities);
		if (!$cities) {
			$cities['data'][0] = array(
			'Ref' => 'db5c88f5-391c-11dd-90d9-001a92567626',
			'Description' => 'Львів',
			'DescriptionRu' => 'Львов'
			);
		}
		return $cities;
	}
}