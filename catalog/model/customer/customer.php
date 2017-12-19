<?php
class ModelCustomerCustomer extends Model {

    public function addCustomer($data)
    {
        $sql = "INSERT  " . DB_PREFIX . "customer SET
            email = '" . $this->db->escape($data['email']) . "',
            name = '" . $this->db->escape($data['name']) . "',
            telephone = '" . $this->db->escape($data['telephone']) . "',
            ip = '" . $this->db->escape($data['ip']) . "',
            date_added = NOW()" . ",
            status =  1" ;
        $this->db->query($sql);
        $sql = "SELECT MAX(customer_id) AS max FROM " . DB_PREFIX . "customer";
        $query = $this->db->query($sql);
        $customer_id = $query->row['max'];
        $sql = "INSERT  " . DB_PREFIX . "customer_order SET
            customer_id = '" . (int)$customer_id . "',
            type = '" . (int)$data['type'] . "',
            product_id = '" . (int)$data['product_id'] . "',
            width = '" . (float)$data['width'] . "',
            height = '" . (float)$data['height'] . "',
            depth = '" . (float)$data['depth'] . "'";
        $this->db->query($sql);
    }
}
