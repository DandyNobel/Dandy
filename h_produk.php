<?php
include "koneksi.php";

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// ambil data gambar
$get = mysqli_query($conn, "SELECT gambar FROM products WHERE id=$id");
$data = mysqli_fetch_assoc($get);

if ($data) {

    $gambar = $data['gambar'];

    // hapus file gambar
    $path = "produk_img/" . $gambar;

    if (!empty($gambar) && file_exists($path)) {
        unlink($path);
    }

    // hapus data database
    $hapus = mysqli_query($conn, "DELETE FROM products WHERE id=$id");

    if ($hapus) {
        echo "
        <script>
            alert('Data berhasil dihapus');
            window.location='produk.php';
        </script>
        ";
    } else {
        echo "
        <script>
            alert('Data gagal dihapus');
            window.location='produk.php';
        </script>
        ";
    }

} else {

    echo "
    <script>
        alert('Data tidak ditemukan');
        window.location='produk.php';
    </script>
    ";
}
?>