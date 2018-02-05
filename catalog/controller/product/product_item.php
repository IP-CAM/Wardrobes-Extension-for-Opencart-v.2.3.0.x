<?php
class ControllerProductProductItem extends Controller {

    public function index($values) {
        if(is_array($values)) {
            return $this->renderDependent($values);
        } else {
            return $this->renderIndependent($values);
        }
    }


    private function getIcon($id_product)
    {

    }



    private function renderDependent($values)
    {
        $data = array();

        if ($values['image']) {
            $image = $this->model_tool_image->resize($values['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
        } else {
            $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
        }

        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
            $price = $this->formatMany($values['price']);
        } else {
            $price = false;
        }

        $data['image'] = $image;
        $data['name'] = $values['name'];
        $product_id = $values['product_id'];
        $price_view = $this->viewPrice($product_id, 67);

        $data['price_view'] = true;

        $this->load->model('catalog/product');
        $settings = $this->model_catalog_product->getProductSettings($product_id);


        $data['price'] = $price;
        if(isset($settings['discount']) && $price_view) {
            $data['discount'] = round($settings['discount']);
            if($data['discount'] != 0) {
                $data['price_old'] = $price;
                $data['price'] = $this->formatMany(($values['price']*(100 - $settings['discount']))/100); //делаем цену дешевле на скидку
            }
        } else {
            $data['discount'] = 0;
        }

        if(isset($settings['new'])) {
            $data['new'] = $settings['new'];
        } else {
            $data['new'] = 0;
        }

        $data['product_reference'] = $this->url->link('product/product', 'path=' . '&product_id=' . $product_id);
        if(isset($values['button_text'])) {
            $data['button_text'] = $values['button_text'];
        } else {
            $data['button_text'] = "";
        }

        return $this->load->view('product/product_item', $data);
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

    private function renderIndependent($product_id)
    {
        $this->load->model('catalog/product');
        $result = $this->model_catalog_product->getProduct($product_id);
        $data_pr = array(
            'product_id'       => $result['product_id'],
            'image'       => $result['image'],
            'name'        => $result['name'],
            'price'       => $result['price'],
            'button_text'     => 'Подробнее'
        );
        return $this->renderDependent($data_pr);
    }

    private function formatMany($price)
    {
        $format_many = new Formatmany();
        return 'от ' . $format_many->format($price, $this->session->data['currency'],  $this->currencies, $this->language->get('decimal_point'));
    }

}