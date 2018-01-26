<?php
class ControllerProductProductItem extends Controller {


    public function index($values) {

        $data = array();

        if ($values['image']) {
            $image = $this->model_tool_image->resize($values['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
        } else {
            $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
        }

        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
            $price = 'от ' . $this->formatMany($values['price'], $this->session->data['currency']);
        } else {
            $price = false;
        }

        if ((float)$values['special']) {
            $special = $this->formatMany($values['special'], $this->session->data['currency']);
        } else {
            $special = false;
        }

        $data['image'] = $image;
        $data['name'] = $values['name'];
        $data['price'] = $price;
        $data['special'] = $special;
        $data['product_reference'] = $this->url->link('product/product', 'path=' . '&product_id=' . $values['product_id']);
        if(isset($values['button_text'])) {
            $data['button_text'] = $values['button_text'];
        } else {
            $data['button_text'] = "";
        }

        return $this->load->view('product/product_item', $data);
    }

    private function formatMany($number, $currency)
    {
        $value = '';
        $format = true;
        $decimal_place = $this->currencies[$currency]['decimal_place'];

        if (!$value) {
            $value = $this->currencies[$currency]['value'];
        }

        $amount = $value ? (float)$number * $value : (float)$number;

        $amount = round($amount, (int)$decimal_place);

        if (!$format) {
            return $amount;
        }

        $string = '';
        $string .= number_format($amount, null, $this->language->get('decimal_point'), ' ');

        return $string;
    }
}