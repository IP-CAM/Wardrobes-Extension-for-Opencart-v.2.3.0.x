<?php
class ModelCalculatorCalculatorSettings extends Model {

    public function getCalculator($calculator_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "calculator_settings WHERE calculator_id = $calculator_id");
        $alias = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE query = 'calculator/calculator'");
        $calculator = $query->row;
        $alias_ar = $alias->row;
        $calculator['keyword'] = $alias_ar['keyword'];
        return $calculator;
    }

    public function editCalculator($calculator_id, $data) {
        $sql = "UPDATE " . DB_PREFIX . "calculator_settings SET
            title = '" . $this->db->escape($data['title']) . "',
            meta_title = '" . $this->db->escape($data['meta_title']) . "',
            meta_description = '" . $this->db->escape($data['meta_description']) . "',
            meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "',
            description = '" . $this->db->escape($data['description']) . "',
            status = '" . (int)$data['status'] . "' WHERE calculator_id = '" . (int)$calculator_id . "'";
        $this->db->query($sql);


        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'calculator/calculator'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'calculator/calculator', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('calculator');
    }


}