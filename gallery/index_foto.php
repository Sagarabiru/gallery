<?php
// Mulai session
session_start();

// Cek apakah pengguna sudah login
if (!isset($_SESSION['user_id'])) {
    // Jika belum login, arahkan ke halaman login
    header("Location: login.php");
    exit();
}

// Koneksi ke database
include 'koneksi.php';

// Variabel pencarian
$search = "";
if (isset($_GET['search'])) {
    $search = mysqli_real_escape_string($conn, $_GET['search']);
}

// Query untuk mengambil semua data dari tabel foto dengan pencarian berdasarkan FotoID atau JudulFoto
$query = "SELECT * FROM foto WHERE FotoID LIKE '%$search%' OR JudulFoto LIKE '%$search%'";
$result = mysqli_query($conn, $query);

if (!$result) {
    die("Query Error: " . mysqli_errno($conn) . " - " . mysqli_error($conn));
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Foto</title>
    <style>
       
       body {
    font-family: 'Times New Roman', serif;
    background-color: #E7CCCC; /* Ubah background halaman */
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: 50px auto;
    background-color: white;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: white; /* Warna latar tabel putih */
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 8px;
    text-align: left;
}

th {
    background-color: #A5B68D; /* Warna latar kolom header */
    color: white;
}

tr:hover {
    background-color: #f1f1f1;
}

img {
    width: 100px;
    height: auto;
    display: block;
}

.title {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
}

.print-button {
    display: inline-block;
    margin: 10px 0;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}

.print-button:hover {
    background-color: #45a049;
}

/* Hide action column, search container, and print button during print */
@media print {
    .action-links, .print-button, .search-container {
        display: none; /* Sembunyikan kolom pencarian dan tombol cetak */
    }
}

.search-container {
    margin-bottom: 20px;
    text-align: center;
}

.search-input {
    padding: 5px;
    width: 300px;
}

.search-button {
    padding: 5px 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}

    </style>
</head>
<body>

<div class="container">
    <div class="title">Daftar Foto</div>
    
    <!-- Form Pencarian -->
    <div class="search-container">
        <form method="get" action="">
            <input type="text" name="search" placeholder="Cari berdasarkan FotoID atau Judul Foto" value="<?php echo $search; ?>" class="search-input">
            <button type="submit" class="search-button">Cari</button>
        </form>
    </div>

    <a href="tambah_foto.php">Tambah</a>
    <a href="home_admin.php">Home Admin</a>
    <a href="home_user.php">Home User</a>

    <!-- Tombol untuk cetak -->
    <button class="print-button" onclick="window.print()">Cetak Halaman</button>

    <table>
        <thead>
            <tr>
                <th>FotoID</th>
                <th>Judul Foto</th>
                <th>Deskripsi Foto</th>
                <th>Tanggal Unggah</th>
                <th>Preview Foto</th>
                <th>AlbumID</th>
                <th>UserID</th>
                <th>Uploader</th>
                <th class="action-links">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Looping untuk menampilkan data foto
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['FotoID'] . "</td>";
                echo "<td>" . $row['JudulFoto'] . "</td>";
                echo "<td>" . $row['DeskripsiFoto'] . "</td>";
                echo "<td>" . $row['TanggalUnggah'] . "</td>";
                echo "<td><img src='" . $row['LokasiFile'] . "' alt='Foto'></td>";
                echo "<td>" . $row['AlbumID'] . "</td>";
                echo "<td>" . $row['UserID'] . "</td>";
                echo "<td>" . $row['Uploader'] . "</td>";
                echo "<td class='action-links'>
                        <a href='view_foto.php?id=" . $row['FotoID'] . "'>View</a> |
                        <a href='edit_foto.php?id=" . $row['FotoID'] . "'>Edit</a> |
                        <a href='delete_foto.php?id=" . $row['FotoID'] . "' onclick='return confirm(\"Anda yakin ingin menghapus foto ini?\");'>Delete</a>
                      </td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>


</body>
</html>

<?php
// Tutup koneksi
mysqli_close($conn);
?>
