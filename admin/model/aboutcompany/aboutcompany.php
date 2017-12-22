<?php
class ModelAboutcompanyAboutcompany extends Model {

    public function getAboutcompany($aboutcompany_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "aboutcompany WHERE aboutcompany_id = 0");
        $alias = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE query = 'aboutcompany/aboutcompany'");
        $aboutcompany = $query->row;
        $alias_ar = $alias->row;
        $aboutcompany['keyword'] = $alias_ar['keyword'];
        return $aboutcompany;
    }

    public function editAboutcompany($aboutcompany_id, $data) {
        $sql = "UPDATE " . DB_PREFIX . "aboutcompany SET
            title = '" . $this->db->escape($data['title']) . "',
            meta_title = '" . $this->db->escape($data['meta_title']) . "',
            meta_description = '" . $this->db->escape($data['meta_description']) . "',
            meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "',
            description = '" . $this->db->escape($data['description']) . "',
            status = '" . (int)$data['status'] . "' WHERE aboutcompany_id = '" . (int)$aboutcompany_id . "'";
        $this->db->query($sql);


        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'aboutcompany/aboutcompany'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'aboutcompany/aboutcompany', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('aboutcompany');
    }


}