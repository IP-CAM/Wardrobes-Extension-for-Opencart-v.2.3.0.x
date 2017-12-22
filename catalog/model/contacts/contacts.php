<?php

class ModelContactsContacts extends Model
{
    public function getContacts($contacts)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "contacts WHERE contacts_id = " . (int)$contacts);

        return $query->row;
    }

}



