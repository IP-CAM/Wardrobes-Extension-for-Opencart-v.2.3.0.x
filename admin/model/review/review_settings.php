<?php
class ModelReviewReviewSettings extends Model {

    public function getReview($review_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "review_settings WHERE review_id = " . (int)$review_id);
        $alias = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE query = 'review/review'");
        $review = $query->row;
        $alias_ar = $alias->row;
        $review['keyword'] = $alias_ar['keyword'];
        return $review;
    }

    public function editReview($review_id, $data) {
        $sql = "UPDATE " . DB_PREFIX . "review_settings SET
            title = '" . $this->db->escape($data['title']) . "',
            meta_title = '" . $this->db->escape($data['meta_title']) . "',
            meta_description = '" . $this->db->escape($data['meta_description']) . "',
            meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "',
            description = '" . $this->db->escape($data['description']) . "',
            status = '" . (int)$data['status'] . "' WHERE review_id = '" . (int)$review_id . "'";
        $this->db->query($sql);


        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'review/review'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'review/review', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('review');
    }


}