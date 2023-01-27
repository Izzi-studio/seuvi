<?php
class ModelExtensionModule extends Model {
	public function getModule($module_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "module WHERE module_id = '" . (int)$module_id . "'");
		
		if ($query->row) {
			return json_decode($query->row['setting'], true);
		} else {
			return array();	
		}
	}

    public function getModuleDescriptions($module_id) {
        $module_description_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "module_description WHERE module_id = " . (int)$module_id . " and  language_id = " . (int)$this->config->get('config_language_id'). " " );

        foreach ($query->rows as $result) {
            $module_description_data = array(
                'title' => $result['title'] ? $result['title'] : false
            );
        }

        return $module_description_data;
    }
}