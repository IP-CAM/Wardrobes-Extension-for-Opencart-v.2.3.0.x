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
            SELECT product.*, pr_desc.name
            FROM " . DB_PREFIX . "product product
            LEFT JOIN
            " . DB_PREFIX . "product_to_category pr_to_cat
            ON (product.product_id = pr_to_cat.product_id )
            LEFT JOIN
            " . DB_PREFIX . "product_description pr_desc
            ON (pr_desc.product_id = product.product_id )
            WHERE pr_to_cat.category_id=" . (int)$category_id;
        $query = $this->db->query($sql);


        return $query->rows;
    }

    public function addCalculatorClient($data)
    {


        $sql = "INSERT  " . DB_PREFIX . "calculator_clients SET
            email = '" . $this->db->escape($data['email']) . "',
            name = '" . $this->db->escape($data['name']) . "',
            telephone = '" . $this->db->escape($data['telephone']) . "',
            type = '" . (int)$data['type'] . "',
            width = '" . (float)$data['width'] . "',
            height = '" . (float)$data['height'] . "',
            depth = '" . (float)$data['depth'] . "',
            ip = '" . $this->db->escape($data['ip']) . "',
            status = 1" ;
        $this->db->query($sql);

    }

}



