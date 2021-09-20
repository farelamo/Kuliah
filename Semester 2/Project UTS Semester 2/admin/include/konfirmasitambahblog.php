<?php
$id_kategori_blog = $_POST['kategori_blog'];
$judul = $_POST['judul'];
$id_user = $_POST['penulis'];
$isi = $_POST['isi'];
$tanggal = $_POST['tanggal'];

if(empty($id_kategori_blog)){
header("Location:index.php?include=tambahblog&notif=tambahkosong&jenis=kategori blog");
}else if(empty($judul)){
header("Location:index.php?include=tambahblog&notif=tambahkosong&jenis=judul");
}else if(empty($id_user)){
    header("Location:index.php?include=tambahblog&notif=tambahkosong&jenis=penulis");
}else if(empty($tanggal)){
    header("Location:index.php?include=tambahblog&notif=tambahkosong&jenis=tanggal");
}else if(empty($isi)){
    header("Location:index.php?include=tambahblog&notif=tambahkosong&jenis=isi");
}else{
$sql = "INSERT INTO `blog`(`id_kategori_blog`,`judul`,`id_user`,`tanggal`,`isi`) VALUES ('$id_kategori_blog','$judul','$id_user','$tanggal','$isi')";
// echo $sql;
mysqli_query($koneksi,$sql);
// $id_blog = mysqli_insert_id($koneksi);
header("Location:index.php?include=blog&notif=tambahberhasil");
}
?>