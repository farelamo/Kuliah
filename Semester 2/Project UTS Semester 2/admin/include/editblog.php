<?php
if (isset($_GET['data'])) {
  $id_blog = $_GET['data'];
  $_SESSION['id_blog'] = $id_blog;
  //get data buku
  $sql_m = "SELECT `id_kategori_blog`,`id_user`,`tanggal`,`judul`,`isi` FROM `blog` WHERE `id_blog`='$id_blog'";
  $query_m = mysqli_query($koneksi, $sql_m);
  while ($data_m = mysqli_fetch_row($query_m)) {
    $id_kategori_blog = $data_m[0];
    $penulis = $data_m[1];
    $tanggal = $data_m[2];
    $judul = $data_m[3];
    $isi = $data_m[4];
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
            <h3><i class="fas fa-edit"></i> Edit Data Blog</h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php?include=blog">Data Blog</a></li>
              <li class="breadcrumb-item active">Edit Data Blog</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

    <div class="card card-info">
      <div class="card-header">
        <h3 class="card-title"style="margin-top:5px;"><i class="far fa-list-alt"></i> Form Edit Data Blog</h3>
        <div class="card-tools">
          <a href="index.php?include=blog" class="btn btn-sm btn-warning float-right">
          <i class="fas fa-arrow-alt-circle-left"></i> Kembali</a>
        </div>
      </div>
      <!-- /.card-header -->
      <!-- form start -->
      </br></br>
      <div class="col-sm-10">
      <?php if ((!empty($_GET['notif'])) && (!empty($_GET['jenis']))) { ?>
              <?php if ($_GET['notif'] == "editkosong") { ?>
                <div class="alert alert-danger" role="alert">Maaf data
                  <?= $_GET['jenis']; ?> wajib di isi</div>
              <?php } ?>
            <?php } ?>
      </div>
      <form class="form-horizontal" action="index.php?include=konfirmasieditblog" method="post" enctype="multipart/form-data">
        <div class="card-body">
          <div class="form-group row">
            <label for="kategori" class="col-sm-3 col-form-label">Kategori Blog</label>
            <div class="col-sm-7">
              <select class="form-control" id="kategori" name="kategori_blog">
              <option value="">- Pilih Kategori -</option>
                    <?php
                    $sql_k = "SELECT `id_kategori_blog`,`kategori_blog` FROM `kategori_blog` ORDER BY `kategori_blog`";
                    $query_k = mysqli_query($koneksi, $sql_k);
                    while ($data_k = mysqli_fetch_row($query_k)) {
                      $id_kat = $data_k[0];
                      $kat = $data_k[1];
                    ?>
                      <option value="<?= $id_kat; ?>" <?php if ($id_kat == $id_kategori_blog) { ?> selected <?php } ?>><?= $kat; ?></option>
                    <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group row">
            <label for="nim" class="col-sm-3 col-form-label">Judul</label>
            <div class="col-sm-7">
              <input type="text" class="form-control" name="judul" id="nim" value="<?= $judul; ?>">
            </div>
          </div>
          <div class="form-group row">
            <label for="kategori" class="col-sm-3 col-form-label">Penulis</label>
            <div class="col-sm-7">
              <select class="form-control" id="penulis" name="penulis">
              <option value="">- Pilih Kategori -</option>
                    <?php
                    $sql_k = "SELECT `id_user`,`nama` FROM `user` ORDER BY `nama`";
                    $query_k = mysqli_query($koneksi, $sql_k);
                    while ($data_k = mysqli_fetch_row($query_k)) {
                      $id_user = $data_k[0];
                      $nama = $data_k[1];
                    ?>
                      <option value="<?= $id_user; ?>" <?php if ($id_user == $penulis) { ?> selected <?php } ?>><?= $nama; ?></option>
                    <?php } ?>
              </select>
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
            <label for="isi" class="col-sm-3 col-form-label">Isi</label>
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