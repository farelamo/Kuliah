<div class="page-content page-home">
    <section class="store-trend-categories">
        <div class="container">
            <div class="row">
                <div class="col-12" data-aos="fade-up">
                    <h5>All Brands</h5>
                </div>
            </div>
            <div class="row">
                <?php
                $sql_k = "SELECT * FROM `brand_produk`";
                $query_k = mysqli_query($koneksi, $sql_k);
                while ($data_k = mysqli_fetch_row($query_k)) {
                    $id_brand = $data_k[0];
                    $brand = $data_k[1];
                    $gambar_brand = $data_k[2];
                    echo '<div class="col-6 col-md-3 col-lg-2" data-aos="fade-up" data-aos-delay="100">
                                <a href="index.php?page=brand-certain&data=' . $id_brand . '" class="component-categories d-block">
                                    <div class="categories-image">
                                        <img src="../admin/foto/brand/' . $gambar_brand . '" alt="" class="w-100"/>
                                    </div>
                                </a>
                            </div>';
                }
                ?>
            </div>
        </div>
    </section>

    <section class="store-new-products">
        <div class="container">
            <div class="row">
                <div class="col-12" data-aos="fade-up">
                    <h5>All Products</h5>
                </div>
            </div>
            <div class="row">
                <?php
                $sql_p = "SELECT `id_produk`, `title`, `nama`, `harga`, `gambar` FROM `produk` ORDER BY `id_produk` desc";
                $query_p = mysqli_query($koneksi, $sql_p);
                while($data_p = mysqli_fetch_row($query_p)) {
                    $id_produk = $data_p[0];
                    $title = $data_p[1];
                    $nama = $data_p[2];
                    $harga = $data_p[3];
                    $gambar = $data_p[4];
                    echo '<div class="col-6 col-md-4 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                                <a href="index.php?page=product&data=' . $id_produk .'" class="component-products d-block">
                                    <div class="products-thumbnail">
                                        <div class="products-image"
                                             style="background-image: url('. "../admin/foto/produk/$gambar" . ')"></div>
                                    </div>
                                    <div class="products-text">
                                        ' . $title . '
                                    </div>
                                    <div class="products-price">
                                        Rp' . $harga . '
                                    </div>
                                </a>
                            </div>';
                }
                ?>

                <?php
                if(mysqli_num_rows($query_p) === 0) {
                    echo '<div class="col-12 text-center py-5" data-aos="fade-up" data-aos-delay="100">
                                No Products Found
                            </div>';
                }
                ?>
            </div>
            <!--        <div class="row">-->
            <!--            <div class="col-12 mt-4">-->
            <!--                {{ $products->links() }}-->
            <!--            </div>-->
            <!--        </div>-->
        </div>
    </section>
</div>
