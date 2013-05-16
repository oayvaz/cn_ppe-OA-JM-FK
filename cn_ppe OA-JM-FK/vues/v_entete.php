<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="style/style.css" />
    <title>Constructions nouvelles</title>
  </head>
  <?php
  if(!isset($_SESSION['type'])){
      include 'vues/v_visiteur.php';
  }
  if(isset($_SESSION['type'])){
      if($_SESSION['type'] == 3){
      include 'vues/v_client.php';
      }
  }
  if(isset($_SESSION['type'])){
      if($_SESSION['type'] == 2){
      include 'vues/v_commercial.php';
      }
  }
  if(isset($_SESSION['type'])){
      if($_SESSION['type'] == 1){
      include 'vues/v_direction.php';
      }
  }
  
    /*
  if(isset($_SESSION['type'])){
    $numType = $_SESSION['type'];
        switch($numType){
                case '1':{
                    include 'vues/v_direction.php';
                        break;
                }
                case '2':{
                    include 'vues/v_commercial.php';
                        break;
                }
                case '3':{
                    include 'vues/v_client.php';
                        break;
                }
                default :{
		 include 'vues/v_visiteur.php';
		break;
	}
        }
}
 */ 
  ?>