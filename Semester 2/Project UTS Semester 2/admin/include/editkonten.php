<?php
if (isset($_GET['data'])) {
  $id_konten = $_GET['data'];
  $_SESSION['konten'] = $id_konten;
  //get data tag
  $sql_t = "select `judul`,`tanggal`,`isi` from `konten` where `id_konten` = '$id_konten'";
  $query_t = mysqli_query($koneksi, $sql_t);
  while ($data_t = mysqli_fetch_row($query_t)) {
    $judul = $data_t[0];
    $tanggal = $data_t[1];
    $isi = $data_t[2];
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
              <h3><i class="fas fa-edit"></i> Edit Data Konten</h3>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="index.php?include=konten">Data Konten</a></li>
                <li class="breadcrumb-item active">Edit Data Konten</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">

        <div class="card card-info">
          <div class="card-header">
            <h3 class="card-title" style="margin-top:5px;"><i class="far fa-list-alt"></i> Form Edit Data Konten</h3>
            <div class="card-tools">
              <a href="index.php?include=konten" class="btn btn-sm btn-warning float-right">
                <i class="fas fa-arrow-alt-circle-left"></i> Kembali</a>
            </div>
          </div>
          <!-- /.card-header -->
          <!-- form start -->
          </br></br>
          <div class="col-sm-10">
            <?php
            if (isset($_GET['notif'])) {
              if ($_GET['notif'] == "editkosong") {
                echo '<div class="alert alert-danger" role="alert">Maaf data ' . $_GET['jenis'] . ' wajib di isi</div>';
              }
            }
            ?>
          </div>
          <form class="form-horizontal" action="index.php?include=konfirmasieditkonten" method="post" enctype="multipart/form-data">
            <div class="card-body">

              <div class="form-group row">
                <label for="nim" class="col-sm-3 col-form-label">Judul</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="judul" id="nim" value="<?= $judul; ?>">
                </div>
              </div>
              <div class="form-group row">
                <label for="tanggal" class="col-sm-3 col-form-label">Tanggal</label>
                <div class="col-sm-7">
                    <div class="input-group-append">
                    <input type="date" class="form-control" name="tanggal" 
                          id="tanggal" value="<?= $tanggal; ?>">
                    </div>
                </div>
              </div>
              <div class="form-group row">
            <label for="sinopsis" class="col-sm-3 col-form-label">Isi</label>
            <div class="col-sm-7">
              <textarea class="form-control" name="isi" id="editor1" rows="12"><?= $isi; ?></textarea>
            </div>
          </div>

            </div>
        </div>

    </div>
    <!-- /.card-body -->
    <div class="card-footer">
      <div class="col-sm-12">
        <button type="submit" class="btn btn-info float-right"><i class="fas fa-save"></i> Simpan</button>
      </div>
    </div>
    <!-- /.card-footer -->
    </form>
  </div>
  <!-- /.card -->

  </section>
</html>