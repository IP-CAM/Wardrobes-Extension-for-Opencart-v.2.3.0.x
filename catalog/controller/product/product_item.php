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
        $product_id = $values['product_id'];
        $price_view = $this->viewPrice($product_id, 67);
        $data['price_view'] = $price_view;

        $this->load->model('catalog/product');
        $settings = $this->model_catalog_product->getProductSettings($product_id);



        if(isset($settings['discount']) && $price_view) {
            $data['discount'] = round($settings['discount']);
        } else {
            $data['discount'] = 0;
        }

        if(isset($settings['new'])) {
            $data['new'] = $settings['new'];
        } else {
            $data['new'] = 0;
        }

        $data['price'] = $price;
        $data['special'] = $special;
        $data['product_reference'] = $this->url->link('product/product', 'path=' . '&product_id=' . $product_id);
        if(isset($values['button_text'])) {
            $data['button_text'] = $values['button_text'];
        } else {
            $data['button_text'] = "";
        }

        return $this->load->view('product/product_item', $data);
    }


    private function getIcon($id_product)
    {

    }
    /**
     * Убираем цены, во всех шкафах, кроме стандартных
     * @param $id_product
     * @param $id_view_category
     *
     * @return bool
     */
    private function viewPrice($id_product, $id_view_category)
    {
        $this->load->model('catalog/product');
        $categories = $this->model_catalog_product->getCategories($id_product);

        $view = false;
        foreach($categories as $category) {
            if((int)$category['category_id'] == $id_view_category) {
                $view  =true;
                break;
            }
        }
        return $view;
    }
}