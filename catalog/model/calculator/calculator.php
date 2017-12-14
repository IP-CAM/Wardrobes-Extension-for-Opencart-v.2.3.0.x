<?php

class ModelCalculatorCalculator extends Model
{
    public function getCalculator($calculator_id)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "calculator_description WHERE calculator_id = " . (int)$calculator_id);

        return $query->row;
    }

    public function getProductFormCategories($category_id)
    {
        $sql = "
            SELECT product.*
            FROM " . DB_PREFIX . "product product
            LEFT JOIN
            " . DB_PREFIX . "product_to_category pr_to_cat
            ON (product.product_id = pr_to_cat.product_id )
            WHERE pr_to_cat.category_id=" . (int)$category_id;
        $query = $this->db->query($sql);

        return $query->rows;
    }

}