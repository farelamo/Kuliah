<?php

include('require.php');
$data_penerbit = new penerbit();

if (isset($_POST['tambah'])) {
    $penerbit = $_POST['penerbit'];
    $alamat = $_POST['alamat'];

    $data = $data_penerbit->store($penerbit, $alamat);
    if ($data) {
        header('Location: index.php');
    }
}

?>