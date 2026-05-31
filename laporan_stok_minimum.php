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

// Ambil data produk dengan stok minimum
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
    WHERE p.stock <= p.min_stock
    ORDER BY p.stock ASC
");

$mpdf = new \Mpdf\Mpdf([
    'format' => 'A4-L'
]);

$html = '
<html>
<head>
<title>DandyInventory - Laporan Stok Minimum</title>

<style>

body{
    font-family:sans-serif;
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
    color:#dc3545;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

thead th{
    background:#dc3545;
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
    background:#f8f9fa;
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

.stok-minimum{
    color:red;
    font-weight:bold;
}

</style>

</head>

<body>

<h1>DandyInventory</h1>
<hr>
<h3>LAPORAN STOK MINIMUM</h3>

<table>

<thead>
<tr>
    <th>No</th>
    <th>Gambar</th>
    <th>Kode Produk</th>
    <th>Nama Produk</th>
    <th>Kategori</th>
    <th>Harga</th>
    <th>Stok Saat Ini</th>
    <th>Minimal Stok</th>
    <th>Status</th>
    <th>Tanggal Dibuat</th>
</tr>
</thead>

<tbody>
';

$no = 1;

foreach ($data as $row) {

    $harga = "Rp " . number_format($row['price'], 0, ',', '.');

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
        ? date('d-m-Y H:i', strtotime($row['created_id']))
        : '-';

    $html .= '
    <tr>
        <td class="text-center">'.$no++.'</td>
        <td class="text-center">'.$gambarHtml.'</td>
        <td class="text-center">'.$row['product_Code'].'</td>
        <td>'.$row['product_name'].'</td>
        <td class="text-center">'.$kategori.'</td>
        <td class="text-right">'.$harga.'</td>
        <td class="text-center">'.$row['stock'].'</td>
        <td class="text-center">'.$row['min_stock'].'</td>
        <td class="text-center">
            <span class="stok-minimum">Stok Minimum</span>
        </td>
        <td class="text-center">'.$tanggal.'</td>
    </tr>';
}

$html .= '
</tbody>
</table>

</body>
</html>';

$mpdf->WriteHTML($html);
$mpdf->Output('Laporan_Stok_Minimum.pdf', 'I');
?>