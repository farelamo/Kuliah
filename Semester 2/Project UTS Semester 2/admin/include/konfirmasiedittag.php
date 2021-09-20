<?php
if(isset($_SESSION['tag'])){
 $id_tag = $_SESSION['tag'];
 $tag = $_POST['tag'];
 if(empty($tag)){
	header("Location:index.php?include=edittag&data=".$id_tag."&notif=editkosong");
	}else{
	$sql = "update `tag` set `tag`='$tag' where `id_tag`='$id_tag'";
	mysqli_query($koneksi,$sql);
	unset($_SESSION['id_tag']);
	header("Location:index.php?include=tag&notif=editberhasil");
	 }
	}
?>
