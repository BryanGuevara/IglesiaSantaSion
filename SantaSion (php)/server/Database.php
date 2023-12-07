<?php

class DataBase {

    private $connection;

    public function __construct() {
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ];

        $serverName = "localhost";
        $databaseName = "SantaSion";

        $connectionString = "sqlsrv:Server=$serverName;Database=$databaseName;Integrated Security=SSPI";

        try {
            $this->connection = new PDO($connectionString, null, null, $options);
        } catch (PDOException $e) {
            die("Error al conectar a la base de datos: " . $e->getMessage());
        }
    }

    public function getConnection() {
        return $this->connection;
    }

    public function closeConnection() {
        $this->connection = null;
    }
}

?>
