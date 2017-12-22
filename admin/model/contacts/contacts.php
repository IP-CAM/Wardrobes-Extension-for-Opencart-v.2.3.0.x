<?php
class ModelContactsContacts extends Model {

    public function getContacts($contacts_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "contacts WHERE contacts_id = " . (int)$contacts_id);
        $alias = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE query = 'contacts/contacts'");
        $contacts = $query->row;
        $alias_ar = $alias->row;
        $contacts['keyword'] = $alias_ar['keyword'];
        return $contacts;
    }

    public function editContacts($contacts_id, $data) {
        $sql = "UPDATE " . DB_PREFIX . "contacts SET
            title = '" . $this->db->escape($data['title']) . "',
            meta_title = '" . $this->db->escape($data['meta_title']) . "',
            meta_description = '" . $this->db->escape($data['meta_description']) . "',
            meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "',
            description = '" . $this->db->escape($data['description']) . "',
            status = '" . (int)$data['status'] . "' WHERE contacts_id = '" . (int)$contacts_id . "'";
        $this->db->query($sql);


        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'contacts/contacts'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'contacts/contacts', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('contacts');
    }


}