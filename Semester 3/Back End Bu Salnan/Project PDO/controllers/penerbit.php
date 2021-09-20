<?php

class penerbit{

    private $db;

    public function __construct()
    {
        $this->db = new database();
        $this->db = $this->db->get_koneksi();
    }
    
    public function index()
    {
       $tampil = $this->db
       ->prepare('SELECT * FROM `penerbit` ORDER BY `id_penerbit` DESC');
       
       $tampil->execute();
       $data = $tampil->fetchAll();
       return $data;
    }

    public function store($penerbit, $alamat) 
    {    
        $insert = $this->db
        ->prepare('INSERT INTO `penerbit` (`penerbit`, `alamat`) VALUES (?,?)');

        $insert->bindParam(1, $penerbit);
        $insert->bindParam(2, $alamat);

        $insert->execute();
        return $insert;
    }


    public function show($id_penerbit)
    {
        $tampil_id = $this->db
        ->prepare("SELECT `penerbit`, `alamat` FROM `penerbit` WHERE `id_penerbit` = (?)");
        $tampil_id->bindParam(1, $id_penerbit);
        $tampil_id->execute();
        return $tampil_id->fetch();
    }

    public function update($id_penerbit, $penerbit, $alamat)
    {
        $update = $this->db
        ->prepare('UPDATE `penerbit` SET `penerbit` = ?, `alamat` = ? WHERE `id_penerbit` = ?');

        $update->bindParam(1, $penerbit);
        $update->bindParam(2, $alamat);
        $update->bindParam(3, $id_penerbit);
        $update-> execute();
        return $update;
    }

    public function delete($id_penerbit)
    {
        $destroy = $this->db
        ->prepare("DELETE FROM `penerbit` WHERE `id_penerbit` = ?");
        
        $destroy->bindParam(1, $id_penerbit);
        $destroy->execute();
        return $destroy;
    }
}

?>

