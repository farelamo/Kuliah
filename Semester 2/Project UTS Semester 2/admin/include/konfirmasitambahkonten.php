<?php
$judul = $_POST['judul'];
$tanggal = $_POST['tanggal'];
$isi = $_POST['isi'];
if(empty($judul)){
    header("Location:index.php?include=tambahkonten&notif=tambahkosong&jenis=judul");
}else if(empty($tanggal)){
    header("Location:index.php?include=tambahkonten&notif=tambahkosong&jenis=tanggal");
}else if(empty($isi)){
    header("Location:index.php?include=tambahkonten&notif=tambahkosong&jenis=isi");
}else{
$sql = "insert into `konten` (`judul`,`tanggal`,`isi`) values ('$judul','$tanggal','$isi')";
mysqli_query($koneksi,$sql);
header("Location:index.php?include=konten&notif=tambahberhasil");
}
?>
