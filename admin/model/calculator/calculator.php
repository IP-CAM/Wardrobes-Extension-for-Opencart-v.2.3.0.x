<?php
class ModelCalculatorCalculator extends Model {


	public function editCalculator($calculator_id, $data) {
        $sql = "UPDATE " . DB_PREFIX . "calculator_description SET
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



    public function getCalculatorClients() {
        $sql = "SELECT * FROM `" .
               DB_PREFIX . "calculator_clients` cc";

        $sort_data = array(
            'cc.client_id',
            'cc.name'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY cc.client_id";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        $query = $this->db->query($sql);
        return $query->rows;
    }

    public function deleteClient($client_id)
    {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "calculator_clients` WHERE client_id = '" . (int)$client_id . "'");
    }


}