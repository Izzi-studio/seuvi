<?php
class ModelFaqFaq extends Model
{
    public function getFaqsByCategoryId($category_id) {
        $faq_category_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_to_category WHERE category_id = '" . (int)$category_id . "'");

        foreach ($query->rows as $result) {
            $faq_category_data[] = $result['faq_id'];
        }

        return $faq_category_data;
    }

    public function getFaqs($faqIds = array())
    {
        if ($faqIds) {
            $sql = "SELECT * FROM " . DB_PREFIX . "faq f LEFT JOIN " . DB_PREFIX . "faq_description fd ON (f.id = fd.faq_id) WHERE fd.language_id = '" . (int)$this->config->get(
                    'config_language_id'
                ) . "' AND f.id in (".implode(',',$faqIds).")";

            $query = $this->db->query($sql);

            return $query->rows;
        }
    }
    public function getFaqsProduct()
    {
            $sql = "SELECT * FROM " . DB_PREFIX . "faq f LEFT JOIN " . DB_PREFIX . "faq_description fd ON (f.id = fd.faq_id) WHERE fd.language_id = '" . (int)$this->config->get(
                    'config_language_id'
                ) . "' and f.in_product = 1";

            $query = $this->db->query($sql);

            return $query->rows;
    }
}