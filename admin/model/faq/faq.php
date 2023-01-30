<?php
class ModelFaqFaq extends Model
{
    public function addFaq($data)
    {

        //var_dump($data); die();
        $this->db->query("INSERT INTO " . DB_PREFIX . "faq SET in_product=".(isset($data['in_product']) ? (int)$data['in_product'] : 0).", date_added = NOW()");

        $faq_id = $this->db->getLastId();

        foreach ($data['faq_description'] as $language_id => $value) {
            $this->db->query(
                "INSERT INTO " . DB_PREFIX . "faq_description SET 
            faq_id = '" . (int)$faq_id . "', 
            language_id = '" . (int)$language_id . "', 
            title = '" . $this->db->escape($value['title']) . "',
            description = '" . $this->db->escape($value['description']) . "'"
            );
        }


        if (isset($data['faq_categories'])) {
            foreach ($data['faq_categories'] as $category_id) {
                $this->db->query(
                    "INSERT INTO " . DB_PREFIX . "faq_to_category SET 
				faq_id = '" . (int)$faq_id . "', 
				category_id = '" . (int)$category_id . "'
				"
                );
            }
        }


        $this->cache->delete('blog');
    }

    public function editFaq($faq_id, $data)
    {

        $this->db->query("update " . DB_PREFIX . "faq SET in_product=".(isset($data['in_product']) ? (int)$data['in_product'] : 0)." where id = ".$faq_id."");

        $this->db->query("DELETE FROM " . DB_PREFIX . "faq_description WHERE faq_id = '" . (int)$faq_id . "'");

        foreach ($data['faq_description'] as $language_id => $value) {
            $this->db->query(
                "INSERT INTO " . DB_PREFIX . "faq_description SET 
		faq_id = '" . (int)$faq_id . "', 
		language_id = '" . (int)$language_id . "', 
		title = '" . $this->db->escape($value['title']) . "',
		description = '" . $this->db->escape($value['description']) . "'");
        }



        $this->db->query("DELETE FROM " . DB_PREFIX . "faq_to_category WHERE faq_id = '" . (int)$faq_id . "'");

        if (isset($data['category'])) {
            foreach ($data['category'] as $category_id) {

                $this->db->query("INSERT INTO " . DB_PREFIX . "faq_to_category SET 
				faq_id = '" . (int)$faq_id . "', 
				category_id = '" . (int)$category_id . "'
				");
            }
        }

        $this->cache->delete('faq');
    }

    public function deleteFaq($faq_id)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . "faq WHERE faq_id = '" . (int)$faq_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "faq_description WHERE faq_id = '" . (int)$faq_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "faq_to_category WHERE faq_id = '" . (int)$faq_id . "'");

        $this->cache->delete('faq');
    }

    public function getFaq($faq_id)
    {
        $query = $this->db->query(
            "SELECT * FROM " . DB_PREFIX . "faq WHERE 
		id = '" . (int)$faq_id . "'
		"
        );

        return $query->row;
    }

    public function getFaqs($data = array())
    {
        if ($data) {
            $sql = "SELECT * FROM " . DB_PREFIX . "faq f LEFT JOIN " . DB_PREFIX . "faq_description fd ON (f.id = fd.faq_id) WHERE fd.language_id = '" . (int)$this->config->get(
                    'config_language_id'
                ) . "'";


            if (isset($data['start']) || isset($data['limit'])) {
                if ($data['start'] < 0) {
                    $data['start'] = 0;
                }

                if ($data['limit'] < 1) {
                    $data['limit'] = 20;
                }

                $sql .= " ORDER BY f.id DESC LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
            }

            $query = $this->db->query($sql);

            return $query->rows;
        }
    }

    public function getFaqDescriptions($faq_id)
    {
        $faq_description_data = array();

        $query = $this->db->query(
            "SELECT * FROM " . DB_PREFIX . "faq_description WHERE faq_id = '" . (int)$faq_id . "'"
        );

        foreach ($query->rows as $result) {
            $faq_description_data[$result['language_id']] = array(
                'title' => $result['title'],
                'description' => $result['description']
            );
        }

        return $faq_description_data;
    }


    public function getTotalFaq()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq");

        return $query->row['total'];
    }
    public function getCategoriesToFaq($faq_id) {
        $faq_category_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_to_category WHERE faq_id = '" . (int)$faq_id . "'");

        foreach ($query->rows as $result) {
            $faq_category_data[] = $result['category_id'];
        }

        return $faq_category_data;
    }

}