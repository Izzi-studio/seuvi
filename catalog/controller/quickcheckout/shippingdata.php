<?php
class ControllerQuickCheckoutShippingdata extends Controller
{
    public function index()
    {
        $this->load->model('localisation/language');

        $language = $this->model_localisation_language->getLanguage($this->config->get('config_language_id'));
        $apiKey = $this->config->get('novaposhta_api_key');

        if($this->request->get['method'] == 'getCity'){
            $response =  $this->find_city_id_by_name($apiKey, $this->request->post['findString'], $language['code']);
        }
        if($this->request->get['method'] == 'getWarehouse') {
            $response =  $this->find_warehouses($apiKey, $this->request->post['findString'],$this->request->post['ref'], $language['code']);
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($response));

    }

    public function getTplNpFields(){
        $this->load->language('shipping/ukrposhta');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_warehouse'] = $this->language->get('entry_warehouse');

        $result['html'] = $this->load->view('default/template/quickcheckout/tpls/np_fields.tpl', $data);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($result));
    }
    public function getTplUkrposhtaFields(){
        $this->load->language('shipping/ukrposhta');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_warehouse'] = $this->language->get('entry_warehouse');
        $data['entry_postcode'] = $this->language->get('entry_postcode');

        $result['html'] = $this->load->view('default/template/quickcheckout/tpls/ukrposhta_fields.tpl',$data);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($result));
    }

    public function getTplUkrposhtaintFields(){
        $this->load->language('shipping/ukrposhta');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_warehouse'] = $this->language->get('entry_warehouse');
        $data['entry_postcode'] = $this->language->get('entry_postcode');

        $result['html'] = $this->load->view('default/template/quickcheckout/tpls/ukrposhta_fields.tpl',$data);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($result));
    }


    private function find_city_id_by_name($api_key, $city, $langCode = 'uk-ua') {
        $get_cities = curl_init();
        curl_setopt($get_cities, CURLOPT_URL, $this->config->get('novaposhta_api_url'));
        curl_setopt($get_cities, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($get_cities, CURLOPT_HTTPHEADER, Array("Content-Type: text/plain"));
        curl_setopt($get_cities, CURLOPT_HEADER, 0);
        curl_setopt($get_cities, CURLOPT_POSTFIELDS, '{"modelName": "Address","calledMethod": "getCities","apiKey": "' . $api_key . '","methodProperties": {"FindByString": "' . $city . '"}}');
        curl_setopt($get_cities, CURLOPT_POST, 1);
        curl_setopt($get_cities, CURLOPT_SSL_VERIFYPEER, 0);
        $cities = json_decode(curl_exec($get_cities), TRUE);
        curl_close($get_cities);

        $returnData = [];


        if ($cities['success'] == 1) {
            foreach ($cities['data'] as $key=>$item) {
                $returnData[] = [
                    'city'=> $langCode == 'uk-ua' ? $item['Description'] : $item['DescriptionRu'],
                    'ref'=>$item['Ref']
                ];
            }
            return $returnData;
        }
        return false;

    }


    private function find_warehouses($api_key, $findString,$ref, $langCode = 'uk-ua') {
        $get_cities = curl_init();
        curl_setopt($get_cities, CURLOPT_URL, $this->config->get('novaposhta_api_url'));
        curl_setopt($get_cities, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($get_cities, CURLOPT_HTTPHEADER, Array("Content-Type: text/plain"));
        curl_setopt($get_cities, CURLOPT_HEADER, 0);
        curl_setopt($get_cities, CURLOPT_POSTFIELDS, '{"modelName": "Address","calledMethod": "getWarehouses","apiKey": "' . $api_key . '","methodProperties": {"FindByString": "' . $findString . '","CityRef":"'.$ref.'"}}');
        curl_setopt($get_cities, CURLOPT_POST, 1);
        curl_setopt($get_cities, CURLOPT_SSL_VERIFYPEER, 0);
        $cities = json_decode(curl_exec($get_cities), TRUE);
        curl_close($get_cities);

        $returnData = [];


        if ($cities['success'] == 1) {
            foreach ($cities['data'] as $key=>$item) {
                $returnData[] = [
                    'warehouse'=> $langCode == 'uk-ua' ? str_replace('"','',$item['Description']) : str_replace('"','',$item['DescriptionRu']),
                    'ref'=>$item['Ref'],
                    'cityRef'=>$item['CityRef'],
                    'CityDescription'=>$langCode == 'uk-ua' ? $item['CityDescription'] : $item['CityDescriptionRu']
                ];
            }
            return $returnData;
        }


        return false;

    }
}