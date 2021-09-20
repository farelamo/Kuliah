<?php
if (isset($_SESSION['konten'])) {
    $id_konten = $_SESSION['konten'];
    $judul = $_POST['judul'];
    $tanggal = $_POST['tanggal'];
    $isi = $_POST['isi'];

    if (empty($judul)) {
        header("Location:index.php?include=editkonten&data=$id_konten&notif=editkosong&jenis=judul");
    } else if (empty($tanggal)) {
        header("Location:index.php?include=editkonten&data=$id_konten&notif=editkosong&jenis=tanggal");
    } else if (empty($isi)) {
        header("Location:index.php?include=editkonten&data=$id_konten&notif=editkosong&jenis=isi");
    } else {
            $sql = "UPDATE `konten` set
                    `judul`='$judul',`tanggal`='$tanggal',`isi`='$isi'
                    WHERE `id_konten`='$id_konten'";
            mysqli_query($koneksi, $sql);
        header("Location:index.php?include=konten&notif=editberhasil");
    }
}
