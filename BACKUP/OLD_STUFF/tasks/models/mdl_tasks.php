<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Mdl_tasks extends CI_Model {


        public function __construct()
        {
                // Call the CI_Model constructor
                parent::__construct();
        }

        function get_table() //Dies Funktion muss bei jedem Model abgeändert werden hier wird der name der Tabelle angegeben alle weiteren funktionen aus Perfect mdl oder controler können ohne änderung genutzt werden
        {
            $table = "tasks";
            return $table;
        }
        
        function get($order_by)
        {
            $this->db->order_by($order_by);
            $query = $this->db->get('tasks');
            return $query;
        }
        
        function _insert($data) 
        {
            $table = $this->get_table();
            $this->db->insert($table, $data);
        }

        function get_where($id) 
        {
            $table = $this->get_table();
            $this->db->where('id', $id);
            $query=$this->db->get($table);
            return $query;
        }
        
        function _update($id, $data) 
        {
            $table = $this->get_table();
            $this->db->where('id', $id);
            $this->db->update($table, $data);
        }
}
