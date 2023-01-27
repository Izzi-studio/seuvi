<?php
class ModelExtensionModule extends Model {
	public function addModule($code, $data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "module` SET `name` = '" . $this->db->escape($data['name']) . "', `code` = '" . $this->db->escape($code) . "', `setting` = '" . $this->db->escape(json_encode($data)) . "'");
        $module_id = $this->db->getLastId();
		if($data['module_description']) {
            foreach ($data['module_description'] as $language_id => $value) {
                $this->db->query(
                    "INSERT INTO " . DB_PREFIX . "module_description SET 
                    module_id = '" . (int)$module_id . "',
                     language_id = '" . (int)$language_id . "',
                      title = '" . $this->db->escape($value['title']) . "'"
                );
            }
        }
	}
	
	public function editModule($module_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "module` SET `name` = '" . $this->db->escape($data['name']) . "', `setting` = '" . $this->db->escape(json_encode($data)) . "' WHERE `module_id` = '" . (int)$module_id . "'");

        if($data['module_description']) {
            $this->db->query("DELETE FROM " . DB_PREFIX . "module_description WHERE module_id = '" . (int)$module_id . "'");

            foreach ($data['module_description'] as $language_id => $value) {
                $this->db->query(
                    "INSERT INTO " . DB_PREFIX . "module_description SET 
                    module_id = '" . (int)$module_id . "',
                     language_id = '" . (int)$language_id . "',
                      title = '" . $this->db->escape($value['title']) . "'"
                );
            }
        }

	}

	public function deleteModule($module_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "module` WHERE `module_id` = '" . (int)$module_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "layout_module` WHERE `code` LIKE '%." . (int)$module_id . "'");
	}
		
	public function getModule($module_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` WHERE `module_id` = '" . $this->db->escape($module_id) . "'");

		if ($query->row) {
			return json_decode($query->row['setting'], true);
		} else {
			return array();	
		}
	}
	
	public function getModules() {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` ORDER BY `code`");

		return $query->rows;
	}	
		
	public function getModulesByCode($code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` WHERE `code` = '" . $this->db->escape($code) . "' ORDER BY `name`");

		return $query->rows;
	}	
	
	public function deleteModulesByCode($code) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "module` WHERE `code` = '" . $this->db->escape($code) . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "layout_module` WHERE `code` LIKE '" . $this->db->escape($code) . "' OR `code` LIKE '" . $this->db->escape($code . '.%') . "'");
	}


    public function getModuleDescriptions($module_id) {
        $module_description_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "module_description WHERE module_id = '" . (int)$module_id . "'");

        foreach ($query->rows as $result) {
            $module_description_data[$result['language_id']] = array(
                'title' => $result['title']
            );
        }

        return $module_description_data;
    }
}