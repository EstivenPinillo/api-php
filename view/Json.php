<?php

class Json{
 
    public static function returnJson($data){

        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
        header('Content-Type: application/json');
        echo json_encode($data);

    }

}



?>