<?php

class ModelSpecialSpecial extends Model
{
    public function getSpecial($special)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "special WHERE special_id = " . (int)$special);

        return $query->row;
    }

}



