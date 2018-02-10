<?php

class Formatmany {

    public function format($price, $currency, $currencies, $decimal_point)
    {
        $value = '';
        $format = true;
        $decimal_place = $currencies[$currency]['decimal_place'];

        if (!$value) {
            $value = $currencies[$currency]['value'];
        }

        $amount = $value ? (float)$price * $value : (float)$price;

        $amount = round($amount, (int)$decimal_place);

        if (!$format) {
            return $amount;
        }

        $string = '';
        $string .= number_format($amount, null, $decimal_point, ' ');

        $symbol_right =  " &#8381;";
        //$string .= $symbol_right;

        return $string;
    }


    public function getPrice($price, $product_id, $currency, $currencies, $decimal_point)
    {
        $price_view = true;
        $price_norm = $price;
        $category_price = $this->categoryPrice($product_id);
        if(!empty($category_price)) {
            if($category_price['status'] == 0 || !isset($category_price['status'])) { //Цена та же что и в товаре
                $price_norm = $price;
                $price_view = true;
            }
            if($category_price['status'] == 1) { //Цена как в категории для всех товаров
                $price_norm = 'от ' . $this->format($price, $currency,  $currencies, $decimal_point);
                $price_view = true;
            }
            if($category_price['status'] == 2) { //Цены вообще не должно быть
                $price_view = false;
            }
        }
        return array('price' => $price_norm, 'price_view' => $price_view);
    }

    /*
     * Модифицируем цену в зависемости от настроек в категории
     */
    private function categoryPrice($id_product)
    {
        $categories = $this->getCategories($id_product);
        $category_price = $this->getTypePrice($categories[0]['category_id']);
        return $category_price;
    }

    public function getCategories($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

        return $query->rows;
    }

    public function getTypePrice($category_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_price WHERE category_id = '" . (int)$category_id . "'");

        return $query->row;
    }

}
