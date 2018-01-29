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
            $format_many = new Formatmany();
            $price = 'от ' . $format_many->format($values['price'], $this->session->data['currency'],  $this->currencies, $this->language->get('decimal_point'));
        } else {
            $price = false;
        }

        if ((float)$values['special']) {
            $format_many = new Formatmany();
            $special = $format_many->format($values['special'], $this->session->data['currency'],  $this->currencies, $this->language->get('decimal_point'));
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
}