<?php 
require_once ("model/Usuario.php");
require_once ("view/Json.php");

class UsuarioController {

    public function select() {

        $usaurio = new Usuario();
        $data = $usaurio->select();
        
        return Json::returnJson($data);
    }

    public function insert() {

        $nombre = $_REQUEST['nombre'];
        $apellido = $_REQUEST['apellido'];
        $numeroDocumento = $_REQUEST['numeroDocumento'];
        $correo = $_REQUEST['correo'];
        $clave = $_REQUEST['clave'];

        if (
            $nombre &&
            $apellido &&
            $numeroDocumento &&
            $correo &&
            $clave
        ) {
            $usaurio = new Usuario();
            $usaurio->__set("nombre",$nombre);
            $usaurio->__set("apellido",$apellido);
            $usaurio->__set("numeroDocumento",$numeroDocumento);
            $usaurio->__set("correo",$correo);
            $usaurio->__set("clave",$clave);
            
            return Json::returnJson($usaurio->insert($usaurio));
        }else {

            return Json::returnJson("Hacen falta datos");
        }

    }

    public function update() {

        parse_str(file_get_contents("php://input"),$datos);

        $nombre = $datos['nombre'];
        $apellido = $datos['apellido'];
        $numeroDocumento = $datos['numeroDocumento'];
        $correo = $datos['correo'];
        $clave = $datos['clave'];
        $idUsuario = $datos['idUsuario'];

        $usaurio = new Usuario();
        $usaurio->__set("nombre",$nombre);
        $usaurio->__set("apellido",$apellido);
        $usaurio->__set("numeroDocumento",$numeroDocumento);
        $usaurio->__set("correo",$correo);
        $usaurio->__set("clave",$clave);
        $usaurio->__set("idUsuario",$idUsuario);

        return Json::returnJson("Update :D, ".$usaurio->update($usaurio));
    }

    public function delete() {

        parse_str(file_get_contents("php://input"),$datos);
        $idUsuario = $datos['idUsuario'];

        $usaurio = new Usuario();
        $usaurio->__set("idUsuario",$idUsuario);

       

        return Json::returnJson("Delete Exitoso :D, ".$usaurio->delete($usaurio));
    }

}


?>