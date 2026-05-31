<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'koneksi.php';

function query($query)
{
    global $conn;

    $result = mysqli_query($conn, $query);

    if (!$result) {
        die("Query Error: " . mysqli_error($conn));
    }

    $rows = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    return $rows;
}

// Ambil data produk + kategori
$data = query("
    SELECT
        p.id,
        p.product_Code,
        p.product_name,
        c.nm_kat AS category_name,
        p.stock,
        p.min_stock,
        p.price,
        p.gambar,
        p.created_id
    FROM products p
    LEFT JOIN categories c
        ON p.category_id = c.category_id
    ORDER BY p.product_name ASC
");

$mpdf = new \Mpdf\Mpdf([
    'format' => 'A4-L'
]);

$html = '
<html>
<head>
<title>DandyInventory - Laporan Stok Barang</title>

<style>
body{
    font-family: sans-serif;
}

h1{
    text-align:center;
    color:#262626;
    margin-bottom:5px;
}

h3{
    text-align:center;
    margin-top:0;
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
}

thead th{
    background:#4e73df;
    color:white;
    padding:10px;
    font-size:12px;
    border:1px solid #ccc;
}

tbody td{
    padding:8px;
    font-size:11px;
    border:1px solid #ccc;
}

tbody tr:nth-child(even){
    background:#f2f2f2;
}

.text-center{
    text-align:center;
}

.text-right{
    text-align:right;
}

img{
    width:70px;
    height:70px;
}

.stok-aman{
    color:green;
    font-weight:bold;
}

.stok-minim{
    color:red;
    font-weight:bold;
}
</style>

</head>

<body>

<h1>DandyInventory</h1>
<hr>
<h3>LAPORAN STOK BARANG</h3>

<table>

<thead>
<tr>
    <th>No</th>
    <th>Gambar</th>
    <th>Kode Produk</th>
    <th>Nama Produk</th>
    <th>Kategori</th>
    <th>Harga</th>
    <th>Stok</th>
    <th>Min. Stok</th>
    <th>Status</th>
    <th>Tanggal Dibuat</th>
</tr>
</thead>

<tbody>
';

$no = 1;

foreach ($data as $row) {

    $harga = "Rp " . number_format($row['price'], 0, ',', '.');

    if ($row['stock'] <= $row['min_stock']) {
        $status = '<span class="stok-minim">Stok Minim</span>';
    } else {
        $status = '<span class="stok-aman">Aman</span>';
    }

    $gambar = 'produk_img/' . $row['gambar'];

    if (
        empty($row['gambar']) ||
        !file_exists($gambar)
    ) {
        $gambarHtml = '-';
    } else {
        $gambarHtml = '<img src="' . $gambar . '">';
    }

    $kategori = !empty($row['category_name'])
        ? $row['category_name']
        : '-';

    $tanggal = !empty($row['created_id'])
        ? date('d-m-Y', strtotime($row['created_id']))
        : '-';

    $html .= '
    <tr>
        <td class="text-center">'.$no++.'</td>
        <td class="text-center">'.$gambarHtml.'</td>
        <td>'.$row['product_Code'].'</td>
        <td>'.$row['product_name'].'</td>
        <td>'.$kategori.'</td>
        <td class="text-right">'.$harga.'</td>
        <td class="text-center">'.$row['stock'].'</td>
        <td class="text-center">'.$row['min_stock'].'</td>
        <td class="text-center">'.$status.'</td>
        <td class="text-center">'.$tanggal.'</td>
    </tr>
    ';
}

$html .= '
</tbody>
</table>

</body>
</html>
';

$mpdf->WriteHTML($html);
$mpdf->Output('Laporan_Stok_Barang.pdf', 'I');
?>