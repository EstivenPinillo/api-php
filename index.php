<?php 
require_once("controller/UrlController.php");


UrlController::urlApi("GET","/usuarioSelect", "UsuarioController", "select");
UrlController::urlApi("POST","/usuarioInsert", "UsuarioController", "insert");
UrlController::urlApi("PUT","/usuarioUpdate", "UsuarioController", "update");
UrlController::urlApi("DELETE","/usuarioDelete", "UsuarioController", "delete");


?>