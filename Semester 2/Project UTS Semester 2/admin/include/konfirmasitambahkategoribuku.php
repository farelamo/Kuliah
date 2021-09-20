<?php
$kategori_buku = $_POST['kategori_buku'];
if(empty($kategori_buku)){
header("Location:index.php?include=tambahkategoribuku&notif=tambahkosong");
}else{
$sql = "insert into `kategori_buku` (`kategori_buku`)
values ('$kategori_buku')";
mysqli_query($koneksi,$sql);
header("Location:index.php?include=kategoribuku&notif=tambahberhasil");
}
?>