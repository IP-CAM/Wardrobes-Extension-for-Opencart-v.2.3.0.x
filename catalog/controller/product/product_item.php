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

        /*if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {

        } else {
            $price = false;
        }*/

        $data['image'] = $image;
        $data['name'] = $values['name'];
        $product_id = $values['product_id'];


        //$format_many = new Formatmany();
       // $format_many = $this->formatmany->getPrice($price, $product_id, $this->session->data['currency'],  $this->currencies, $this->language->get('decimal_point'));
       // $ar_setting_price = $format_many->getPrice($price, $product_id, $this->session->data['currency'],  $this->currencies, $this->language->get('decimal_point'));

        $price_view = true;
        $price_view_meter = true;
        $price = $this->formatMany($values['price']);
        $data['price'] = $price;
        $category_price = $this->categoryPrice($product_id);
        if(!empty($category_price)) {
            if($category_price['status'] == 0 || !isset($category_price['status'])) { //Цена та же что и в товаре

                $data['price'] = $price;
                $price_view = true;
                $price_view_meter = false;
            }
            if($category_price['status'] == 1) { //Цена как в категории для всех товаров
                $data['price'] = $this->formatMany($category_price['price']);
                $price_view = true;
                $price_view_meter = true;
            }
            if($category_price['status'] == 2) { //Цены вообще не должно быть
                $price_view = false;
            }
        }

        $data['price_view'] = $price_view;
        $data['price_view_meter'] = $price_view_meter;
       // $data['price'] = $ar_setting_price['price'];
      //  $data['price_view']  = $ar_setting_price['price_view'];
        $this->load->model('catalog/product');
        $settings = $this->model_catalog_product->getProductSettings($product_id);



        if(isset($settings['discount']) && $price_view && (!isset($category_price['status']) || $category_price['status'] == 0)) {
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

    /*
     * Модифицируем цену в зависемости от настроек в категории
     */
    private function categoryPrice($id_product)
    {
        $categories = $this->model_catalog_product->getCategories($id_product);
        $this->load->model('catalog/category');

        $category_price = $this->model_catalog_category->getTypePrice($categories[0]['category_id']);
        return $category_price;
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
        return $format_many->format($price, $this->session->data['currency'],  $this->currencies, $this->language->get('decimal_point'));
    }

}