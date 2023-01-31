<?php
class ModelHelperHelper extends Model {

    /** get option product
     * @param array $product
     * @return array
     */
    public function getProductOptions(array $product): array {
        $this->load->model('catalog/product');
        $options = [];

        foreach ($this->model_catalog_product->getProductOptions($product['product_id']) as $option) {
            $product_option_value_data = array();

            foreach ($option['product_option_value'] as $option_value) {
                if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                    if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                        $price = $this->currency->format($this->tax->calculate($option_value['price'], $product['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
                        $priceOnly = $option_value['price'];
                    } else {
                        $price = false;
                        $priceOnly = false;
                    }

                    $product_option_value_data[] = array(
                        'product_option_value_id' => $option_value['product_option_value_id'],
                        'option_value_id'         => $option_value['option_value_id'],
                        'name'                    => $option_value['name'],
                        'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
                        'price'                   => $price,
                        'price_only'                   => $priceOnly,
                        'price_prefix'            => $option_value['price_prefix']
                    );
                }
            }

            $options[]  = array(
                'product_option_id'    => $option['product_option_id'],
                'product_option_value' => $product_option_value_data,
                'option_id'            => $option['option_id'],
                'name'                 => $option['name'],
                'type'                 => $option['type'],
                'value'                => $option['value'],
                'required'             => $option['required']
            );
        }

        return $options;

    }
}