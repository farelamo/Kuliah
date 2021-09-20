<?php

session_start();
include('require.php');
$data_penerbit = new penerbit();

if(isset($_POST['edit']) && $_SESSION['kunci']){
    $kunci = $_SESSION['kunci'];
    $penerbit = $_POST['penerbit'];
    $alamat = $_POST['alamat'];

    $data = $data_penerbit->update($kunci, $penerbit, $alamat);
    if ($data) {
        header('Location: index.php');
    }
}

?>