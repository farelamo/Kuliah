<?php
if(isset($_SESSION['id_user'])){
$id_user = $_SESSION['id_user'];
$passlama = $_POST['passlama'];
$passwordbaru = $_POST['password'];
$konfirmasi = $_POST['konfirmasi'];
if(empty($passlama)){
header("Location:index.php?include=ubahpassword&notif=lamakosong");
}else if (empty($konfirmasi)) {
	header("Location:ubahpassword.php?notif=barukosong");
}else if ($passwordbaru != $konfirmasi) {
	header("Location:index.php?include=ubahpassword&notif=tidaksama");
}else{
$sql = "update `user` set `password`= MD5('$passwordbaru') where `id_user` = '$id_user'";
mysqli_query($koneksi,$sql);
header("Location:index.php?include=ubahpassword&notif=ubahberhasil");
}
}
?>