<?php

class ModelGeneralcatalogGeneralcatalog extends Model
{
    public function getGeneralcatalog($generalcatalog)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "generalcatalog WHERE generalcatalog_id = " . (int)$generalcatalog);

        return $query->row;
    }

}



