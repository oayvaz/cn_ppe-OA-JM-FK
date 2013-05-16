
  <body>
    
    <header>
      <!-- Zone pour l'image en css -->
    </header>

    <article>

      <nav>
          <table>
        <a href="index.php?">
          <ul id="color1">
            <li class="txt_btn">Accueil</li>
          </ul>
        </a>
        <a href="index.php?uc=information&action=details">
          <ul id="color2">
              <li class="txt_btn">Détails sur l'entreprise</li>
          </ul>
        </a>
        <a href="index.php?uc=information&action=contact">
          <ul id="color3">
            <li class="txt_btn">Contact</li>
          </ul>
        </a>
        <a href="#">
          <ul id="color5">
            <li class="txt_btn">Option Visiteur 5</li>
          </ul>
        </a>
        <a href="#">
          <ul id="color6">
            <li class="txt_btn">Option Visiteur 6</li>
          </ul>
        </a>
        <a href="#">
          <ul id="connexion">
            <li class="txt_btn">
              Connexion <br>
         <?php
           
           include("vues/v_connexion.php");
           ?>    
              </table>
            </li>
          </ul>
        </a>
      </nav>

      <section><?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
