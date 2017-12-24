<?php
class ModelSpecialSpecial extends Model {

    public function getSpecial($special_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "special WHERE special_id = " . (int)$special_id);
        $alias = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE query = 'special/special'");
        $special = $query->row;
        $alias_ar = $alias->row;
        $special['keyword'] = $alias_ar['keyword'];
        return $special;
    }

    public function editSpecial($special_id, $data) {
        $sql = "UPDATE " . DB_PREFIX . "special SET
            title = '" . $this->db->escape($data['title']) . "',
            meta_title = '" . $this->db->escape($data['meta_title']) . "',
            meta_description = '" . $this->db->escape($data['meta_description']) . "',
            meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "',
            description = '" . $this->db->escape($data['description']) . "',
            width = '" . (int)$data['width'] . "',
            height = '" . (int)$data['height'] . "',
            status = '" . (int)$data['status'] . "',
            limit_discounts = '" . (int)$data['limit_discounts'] . "',
            status_discounts = '" . (int)$data['status_discounts'] . "',
            product_discounts = '" . $this->db->escape($data['product_discounts']) . "',
            limit_bestsellers = '" . (int)$data['limit_bestsellers'] . "',
            status_bestsellers = '" . (int)$data['status_bestsellers'] . "',
            product_bestsellers = '" . $this->db->escape($data['product_bestsellers']) . "'
            WHERE special_id = '" . (int)$special_id . "'";
        $this->db->query($sql);




        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'special/special'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'special/special', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('special');
    }


}