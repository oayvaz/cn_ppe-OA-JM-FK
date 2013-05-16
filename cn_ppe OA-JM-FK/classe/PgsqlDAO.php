<?php

abstract class PGsqlDAO implements IDAO {
	
	protected $PARAM_hote='localhost'; // le chemin vers le serveur
	protected $PARAM_port='5432';
	protected $PARAM_nom_bd='ConstructionNouvelles'; // le nom de votre base de données
	protected $PARAM_utilisateur='postgres'; // nom d'utilisateur pour se connecter
	protected $PARAM_mot_passe='0550002D'; // mot de passe de l'utilisateur pour se connecter
	
	function __construct() {
		
		try
		{
			$connexion = new PDO('pgsql:host='.$this->PARAM_hote.';dbname='.$this->PARAM_nom_bd, $this->PARAM_utilisateur, $this->PARAM_mot_passe);
		}
	
		catch(Exception $e)
		{
			echo 'Erreur : '.$e->getMessage().'<br />';
			echo 'N° : '.$e->getCode();
		}
	}


	public function create($_o){}


	public function update($_lat,$_lon,$_sup,$_plan,$_prix,$_id){}


	public function delete($_id){}


	public function findAll(){}
	
	public function findById($_id){}
	
}
?>