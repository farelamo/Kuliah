<?php
session_start();
include('../koneksi/koneksi.php');
if (isset($_GET["include"])) {
  $include = $_GET["include"];
  if ($include == "konfirmasilogin") {
    include("include/konfirmasilogin.php");
  } else if ($include == "konfirmasieditblog") {
    include("include/konfirmasieditblog.php");
  } else if ($include == "konfirmasieditbuku") {
    include("include/konfirmasieditbuku.php");
  } else if ($include == "konfirmasieditkategoriblog") {
    include("include/konfirmasieditkategoriblog.php");
  } else if ($include == "konfirmasieditkategoribuku") {
    include("include/konfirmasieditkategoribuku.php");
  } else if ($include == "konfirmasieditkonten") {
    include("include/konfirmasieditkonten.php");
  } else if ($include == "konfirmasieditpenerbit") {
    include("include/konfirmasieditpenerbit.php");
  } else if ($include == "konfirmasieditprofil") {
    include("include/konfirmasieditprofil.php");
  } else if ($include == "konfirmasiedittag") {
    include("include/konfirmasiedittag.php");
  } else if ($include == "konfirmasiedituser") {
    include("include/konfirmasiedituser.php");
  } else if ($include == "konfirmasitambahblog") {
    include("include/konfirmasitambahblog.php");
  } else if ($include == "konfirmasitambahbuku") {
    include("include/konfirmasitambahbuku.php");
  } else if ($include == "konfirmasitambahkategoriblog") {
    include("include/konfirmasitambahkategoriblog.php");
  } else if ($include == "konfirmasitambahkategoribuku") {
    include("include/konfirmasitambahkategoribuku.php");
  } else if ($include == "konfirmasitambahkonten") {
    include("include/konfirmasitambahkonten.php");
  } else if ($include == "konfirmasitambahpenerbit") {
    include("include/konfirmasitambahpenerbit.php");
  } else if ($include == "konfirmasitambahtag") {
    include("include/konfirmasitambahtag.php");
  } else if ($include == "konfirmasitambahuser") {
    include("include/konfirmasitambahuser.php");
  } else if ($include == "konfirmasiubahpassword") {
    include("include/konfirmasiubahpassword.php");
  } else if ($include == "signout") {
    include("include/signout.php");
  }
}
?>
<!DOCTYPE html>
<html>

<head>
  <?php include("includes/head.php") ?>
</head>
<?php
//cek ada get include
if (isset($_GET["include"])) {
  $include = $_GET["include"];
  //cek apakah ada session id admin
  if (isset($_SESSION['id_user'])) {
?>

    <body class="hold-transition sidebar-mini layout-fixed">
      <div class="wrapper">
        <?php include("includes/header.php") ?>
        <?php include("includes/sidebar.php") ?>
        <div class="content-wrapper">
          <?php
          if ($include == "editprofil") {
            include("include/editprofil.php");
          } else if ($include == "kategoribuku") {
            include("include/kategoribuku.php");
          } else if ($include == "tambahkategoribuku") {
            include("include/tambahkategoribuku.php");
          } else if ($include == "editkategoribuku") {
            include("include/editkategoribuku.php");
          } else if ($include == "tag") {
            include("include/tag.php");
          } else if ($include == "tambahtag") {
            include("include/tambahtag.php");
          } else if ($include == "edittag") {
            include("include/edittag.php");
          } else if ($include == "penerbit") {
            include("include/penerbit.php");
          } else if ($include == "tambahpenerbit") {
            include("include/tambahpenerbit.php");
          } else if ($include == "editpenerbit") {
            include("include/editpenerbit.php");
          } else if ($include == "kategoriblog") {
            include("include/kategoriblog.php");
          } else if ($include == "tambahkategoriblog") {
            include("include/tambahkategoriblog.php");
          } else if ($include == "editkategoriblog") {
            include("include/editkategoriblog.php");
          } else if ($include == "konten") {
            include("include/konten.php");
          } else if ($include == "tambahkonten") {
            include("include/tambahkonten.php");
          } else if ($include == "editkonten") {
            include("include/editkonten.php");
          } else if ($include == "detailkonten") {
            include("include/detailkonten.php");
          } else if ($include == "buku") {
            include("include/buku.php");
          } else if ($include == "tambahbuku") {
            include("include/tambahbuku.php");
          } else if ($include == "editbuku") {
            include("include/editbuku.php");
          } else if ($include == "detailbuku") {
            include("include/detailbuku.php");
          } else if ($include == "blog") {
            include("include/blog.php");
          } else if ($include == "tambahblog") {
            include("include/tambahblog.php");
          } else if ($include == "editblog") {
            include("include/editblog.php");
          } else if ($include == "detailblog") {
            include("include/detailblog.php");
          } else if ($include == "user") {
            include("include/user.php");
          } else if ($include == "tambahuser") {
            include("include/tambahuser.php");
          } else if ($include == "edituser") {
            include("include/edituser.php");
          } else if ($include == "detailuser") {
            include("include/detailuser.php");
          } else if ($include == "ubahpassword") {
            include("include/ubahpassword.php");
          } else if ($include == "signout") {
            include("include/signout.php");
          } else {
            include("include/profil.php");
          }
          ?>
        </div>
          <!-- /.content-wrapper -->
          <?php include("includes/footer.php") ?>
        </div>
        <!-- ./wrapper -->
        <?php include("includes/script.php") ?>
    </body>
  <?php
  } else {
    //pemanggilan halaman form login
    include("include/login.php");
  }
} else {
  if (isset($_SESSION['id_user'])) {
    //pemanggilan ke halaman-halaman profil jika ada session
  ?>

    <body class="hold-transition sidebar-mini layout-fixed">
      <div class="wrapper">
        <?php include("includes/header.php") ?>
        <?php include("includes/sidebar.php") ?>
        <div class="content-wrapper">
          <?php
          //pemanggilan profil
          include("include/profil.php");
          ?>
        </div>
        <!-- /.content-wrapper -->
        <?php include("includes/footer.php") ?>
      </div>
      <!-- ./wrapper -->
      <?php include("includes/script.php") ?>
    </body>
<?php
  } else {
    //pemanggilan halaman form login
    include("include/login.php");
  }
}
?>
</html>