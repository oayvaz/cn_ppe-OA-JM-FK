<?php

interface IDAO {
	public function create($_o);
	public function update($_lat,$_lon,$_sup,$_plan,$_prix,$_id);
	public function delete($_id);
	public function findAll();
	public function findById($_id);
}

?>
