<?php

class ModelAboutcompanyAboutcompany extends Model
{
    public function getAboutcompany($aboutcompany_id)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "aboutcompany WHERE aboutcompany_id = " . (int)$aboutcompany_id);

        return $query->row;
    }

}



