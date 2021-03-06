<?php
if (isset($_GET['data'])) {
  $urut = $_GET['data'];
  $_SESSION['user'] = $urut;
  $sql_u = "select * from `user` where `id_user` = '$urut'";
  $query_u = mysqli_query($koneksi, $sql_u);
  while ($data_u = mysqli_fetch_row($query_u)) {
    $nama = $data_u[1];
    $email = $data_u[2];
    $username = $data_u[3];
    $level = $data_u[5];
    $foto = $data_u[6];
  }
}

?>

<!DOCTYPE html>
<html>
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h3><i class="fas fa-user-tie"></i> Detail Data User</h3>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="index.php?include=profil">Home</a></li>
                <li class="breadcrumb-item"><a href="index.php?include=user">Data User</a></li>
                <li class="breadcrumb-item active">Detail Data User</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="card">
          <div class="card-header">
            <div class="card-tools">
              <a href="index.php?include=user" class="btn btn-sm btn-warning float-right">
                <i class="fas fa-arrow-alt-circle-left"></i> Kembali</a>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <td colspan="2"><i class="fas fa-user-circle"></i> <strong>Data User<strong></td>
                </tr>
                <tr>
                  <td><strong>Foto User<strong></td>
                  <td><img src="foto/<?php if ($foto == '') {
                                        echo 'default.png';
                                      } else {
                                        echo $foto;
                                      }
                                      ?>" class="img-fluid" width="200px;"></td>
                </tr>
                <tr>
                  <td width="20%"><strong>Nama<strong></td>
                  <td width="80%"><?= $nama; ?></td>
                </tr>
                <tr>
                  <td width="20%"><strong>Email<strong></td>
                  <td width="80%"><?= $email; ?></td>
                </tr>
                <tr>
                  <td width="20%"><strong>Level<strong></td>
                  <td width="80%"><?= $level; ?></td>
                </tr>
                <tr>
                  <td width="20%"><strong>Username<strong></td>
                  <td width="80%"><?= $username; ?></td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer clearfix">&nbsp;</div>
        </div>
        <!-- /.card -->

      </section>
</html>