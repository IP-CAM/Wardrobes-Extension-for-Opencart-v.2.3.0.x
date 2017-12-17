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

    public function setCalculatorClient($data)
    {


        $sql = "INSERT  " . DB_PREFIX . "calculator_clients SET
            email = '" . $this->db->escape($data['email']) . "',
            name = '" . $this->db->escape($data['name']) . "',
            phone = '" . $this->db->escape($data['phone']) . "',
            width = '" . (float)$data['width'] . "',
            height = '" . (float)$data['height'] . "',
            depth = '" . (float)$data['depth'] . "',
            ip = '" . $this->db->escape($data['ip']) . "',
            status = 1" ;
        $this->db->query($sql);

    }

    public function addCustomer($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$data['customer_group_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "', newsletter = '" . (int)$data['newsletter'] . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '" . (int)$data['status'] . "', approved = '" . (int)$data['approved'] . "', safe = '" . (int)$data['safe'] . "', date_added = NOW()");

        $customer_id = $this->db->getLastId();

        if (isset($data['address'])) {
            foreach ($data['address'] as $address) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($address['firstname']) . "', lastname = '" . $this->db->escape($address['lastname']) . "', company = '" . $this->db->escape($address['company']) . "', address_1 = '" . $this->db->escape($address['address_1']) . "', address_2 = '" . $this->db->escape($address['address_2']) . "', city = '" . $this->db->escape($address['city']) . "', postcode = '" . $this->db->escape($address['postcode']) . "', country_id = '" . (int)$address['country_id'] . "', zone_id = '" . (int)$address['zone_id'] . "', custom_field = '" . $this->db->escape(isset($address['custom_field']) ? json_encode($address['custom_field']) : '') . "'");

                if (isset($address['default'])) {
                    $address_id = $this->db->getLastId();

                    $this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");
                }
            }
        }

        return $customer_id;
    }
}



