<?php

class database{
    private $koneksi;
    
    public function __construct(){
        $host = "localhost";
        $dbname = "katalog_buku";
        $dbuser = "root";
        $dbpass = "";
        $opts = [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION];
        $dsn = "mysql:host=$host;charset=utf8;dbname=$dbname;";
        try{
            $this->koneksi = new PDO($dsn, $dbuser, $dbpass, $opts);
        } catch (PDOException $e) {
            echo "Koneksi database terputus !!". $e->getMessage();
        }
    }

    public function get_koneksi() {
        return $this->koneksi;
    }
}

?>