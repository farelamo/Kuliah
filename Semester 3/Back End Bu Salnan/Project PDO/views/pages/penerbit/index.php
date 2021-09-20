<?php

include('require.php');
$penerbit = new penerbit();

if((isset($_GET['aksi'])) && (isset($_GET['data']))){
    if ($_GET['aksi'] == 'hapus') {
        $id_penerbit = $_GET['data'];
        $penerbit->delete($id_penerbit);
    }
}

$data_penerbit = $penerbit->index();
?>

<!DOCTYPE html>
<html>

</html>

<head>
    <title>Penerbit</title>
</head>

<body>
    <table border="1">
        <tr>
            <td colspan="5">
                <a href="create.php"><input type="button" value="Tambah Penerbit" /></a>
            </td>
        </tr>
        <tr>
            <td width="10%">No</td>
            <td width="30%">Penerbit</td>
            <td width="40%">Alamat</td>
            <td width="10%">Edit</td>
            <td width="10%">Hapus</td>
        </tr>
        <?php
        $no=1;
        foreach($data_penerbit as $data) {?>
        <tr>
            <td><?= $no?></td>
            <td><?= $data['penerbit']; ?></td>
            <td><?= $data['alamat']; ?></td>
            <td><a href="edit.php?data=<?=
            $data['id_penerbit']; ?>"><input type="button" value="Edit Penerbit" /></td>
            <td><a href="javascript:if(confirm('Anda yakin ingin menghapus data <?= $data['penerbit']; ?> ?'))
                window.location.href='index.php?aksi=hapus&data=<?= $data['id_penerbit']; ?>'">
                <input type="button" value="Hapus Penerbit"></td>
        </tr>
        <?php $no++;}?>
         
    </table>
</body>
 

</html>