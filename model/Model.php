<?php 

class  Model {

    public function conexion() {
        
        $dsn = 'mysql:host=localhost;dbname=db_sena_adso';
        $username = 'admin';
        $password = 'admin';

        try {

            $conn = new PDO($dsn, $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
        } catch (PDOException $e) {
            echo "Error de conexión: " . $e->getMessage();
        }

        return $conn;
        
    }

}


?>