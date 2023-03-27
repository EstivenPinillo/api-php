<?php

require_once("model/Model.php");

class Usuario
{

    private $idUsuario;
    private $idPerfil;
    private $idTd;
    private $idEstado;
    private $nombre;
    private $apellido;
    private $numeroDocumento;
    private $correo;
    private $clave;
    private $createdAt;
    private $updatedAt;
    private $deletedAt;

    public function select()
    {

        $model = new Model();
        $conn = $model->conexion();

        $stmt = $conn->prepare("select * from tbl_usuario");
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $results;
    }

    public function insert($usuario)
    {

        $model = new Model();
        $conn = $model->conexion();
       
        try {

            $stmt = $conn->prepare("insert into tbl_usuario 
                                (id_estado,id_perfil,id_td,nombre,apellido,numero_documento,correo,clave)
                                values (1,1,1,:val1,:val2,:val3,:val4,:val5)");

            $stmt->bindParam(":val1", $usuario->__get("nombre"));
            $stmt->bindParam(":val2", $usuario->__get("apellido"));
            $stmt->bindParam(":val3", $usuario->__get("numeroDocumento"));
            $stmt->bindParam(":val4", $usuario->__get("correo"));
            $stmt->bindParam(":val5", $usuario->__get("clave"));
            $stmt->execute();
        } catch (PDOException $e) {

            return $e;
        }

        return $conn->lastInsertId();
    }

    public function update($usuario)
    {

        $model = new Model();
        $conn = $model->conexion();

        try {

            $stmt = $conn->prepare(
                                    "update tbl_usuario 
                                    set nombre=:val1,apellido=:val2,numero_documento=:val3,correo=:val4,clave=:val5
                                    where id_usuario=:val6"
                                  );

            $stmt->bindParam(":val1", $usuario->__get("nombre"));
            $stmt->bindParam(":val2", $usuario->__get("apellido"));
            $stmt->bindParam(":val3", $usuario->__get("numeroDocumento"));
            $stmt->bindParam(":val4", $usuario->__get("correo"));
            $stmt->bindParam(":val5", $usuario->__get("clave"));
            $stmt->bindParam(":val6", $usuario->__get("idUsuario"));
            $stmt->execute();
            

        } catch (PDOException $e) {
            return "Error: " . $e;
        }

        return $stmt->rowCount();
    }

    public function delete($usuario)
    {

        $model = new Model();
        $conn = $model->conexion();

        $stmt = $conn->prepare("delete from tbl_usuario where id_usuario=:val1");
        $stmt->bindParam(':val1', $usuario->__get('idUsuario'));
        $stmt->execute();

        return $stmt->rowCount();;
    }

    public function __set($name, $value)
    {
        $this->$name = $value;
    }

    public function __get($name)
    {
        return $this->$name;
    }
}
