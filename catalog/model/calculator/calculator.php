<?php

class ModelCalculatorCalculator extends Model
{
    public function getCalculator($calculator_id)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "calculator_settings WHERE calculator_id = " . (int)$calculator_id);

        return $query->row;
    }

}



