<?php

class UrlController {

    public static function urlApi($method, $url, $class, $action){

        if (($_SERVER['REQUEST_METHOD'] == $method) && ($_SERVER['REQUEST_URI'] == $url)) {

            require_once("controller/".$class.".php");

            $objet = new $class();
            $objet->$action();
            exit;
        }
        
    }

}

?>