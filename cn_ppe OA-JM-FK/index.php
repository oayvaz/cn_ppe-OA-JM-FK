<?php
session_start();
require_once("include/fonctions.php");
require_once ("include/pdoIntranet.php");
include("vues/v_entete.php");

$pdo = PdoIntranet::getPdoIntranet();
$estConnecte = estConnecte();

if(isset($_REQUEST['uc'])){
    $uc = $_REQUEST['uc'];
        switch($uc){
                case 'connexion':{
                    include("controleurs/c_connexion.php");
                        break;
                }
                case 'information':{
                    include("controleurs/c_information.php");
                        break;
                }
        }
}else{
    include("vues/v_accueil.php");
}
include("vues/v_pied.php");
?>
