<?php
include "koneksi.php";

$id = $_GET['id'];

$query = mysqli_query($conn, "DELETE FROM products WHERE id='$id'");

if($query){

    echo "
    <script>
        alert('Data berhasil dihapus');
        window.location='produk.php';
    </script>
    ";

}else{

    echo "
    <script>
        alert('Data gagal dihapus');
        window.location='produk.php';
    </script>
    ";
}
?>