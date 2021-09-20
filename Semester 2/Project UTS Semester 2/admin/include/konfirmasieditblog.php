<?php
if (isset($_SESSION['id_blog'])) {
    $id_blog = $_SESSION['id_blog'];
    $id_kategori_blog = $_POST['kategori_blog'];
    $judul = $_POST['judul'];
    $tanggal = $_POST['tanggal'];
    $penulis = $_POST['penulis'];
    $isi = $_POST['isi'];

    if (empty($id_kategori_blog)) {
        header("Location:index.php?include=editblog&data=$id_blog&notif=editkosong&jenis=kategori blog");
    } else if (empty($judul)) {
        header("Location:index.php?include=editblog&data=$id_blog&notif=editkosong&jenis=judul");
    } else if (empty($tanggal)) {
        header("Location:index.php?include=editblog&data=$id_blog&notif=editkosong&jenis=tanggal");
    } else if (empty($penulis)) {
        header("Location:index.php?include=editblog&data=$id_blog&notif=editkosong&jenis=penulis");
    } else if (empty($isi)) {
        header("Location:index.php?include=editblog&data=$id_blog&notif=editkosong&jenis=isi");
    } else {
            $sql = "UPDATE `blog` set
                    `id_kategori_blog`='$id_kategori_blog',`judul`='$judul',
                    `tanggal`='$tanggal',`id_user`='$penulis',`isi`='$isi'
                    WHERE `id_blog`='$id_blog'";
            mysqli_query($koneksi, $sql);
        header("Location:index.php?include=blog&notif=editberhasil");
    }
}
?>