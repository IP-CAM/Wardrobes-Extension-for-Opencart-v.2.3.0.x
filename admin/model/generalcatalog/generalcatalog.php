<?php
class ModelGeneralcatalogGeneralcatalog extends Model {

    public function getGeneralcatalog($generalcatalog_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "generalcatalog WHERE generalcatalog_id = " . (int)$generalcatalog_id);
        $alias = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE query = 'generalcatalog/generalcatalog'");
        $contacts = $query->row;
        $alias_ar = $alias->row;
        $contacts['keyword'] = $alias_ar['keyword'];
        return $contacts;
    }

    public function editGeneralcatalog($generalcatalog_id, $data) {
        $sql = "UPDATE " . DB_PREFIX . "generalcatalog SET
            title = '" . $this->db->escape($data['title']) . "',
            meta_title = '" . $this->db->escape($data['meta_title']) . "',
            meta_description = '" . $this->db->escape($data['meta_description']) . "',
            meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "',
            description = '" . $this->db->escape($data['description']) . "',
            status = '" . (int)$data['status'] . "' WHERE generalcatalog_id = '" . (int)$generalcatalog_id . "'";
        $this->db->query($sql);


        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'generalcatalog/generalcatalog'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'generalcatalog/generalcatalog', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('contacts');
    }


}