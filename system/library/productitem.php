<?php
class Productitem {
    public $load = 1;

    public function __construct() {

    }
    public function getProducts($results)
    {
        $data = array();
        foreach ($results as $result) {
            $data_pr = array(
                'product_id'       => $result['product_id'],
                'image'       => $result['image'],
                'name'        => $result['name'],
                'price'       => $result['price'],
                'special'     => $result['special'],
                'button_text'     => 'Подробнее'
            );
            $registry = new Registry();
            $load = new Loader($registry);
            $data[] = $load->controller('product/product_item', $data_pr);
        }
        return $data;
    }


    public function getProduct($results)
    {
        return $this->load->controller('product/product_item', $results);
    }
}
