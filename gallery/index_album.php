<?php
// Mulai session
session_start(); // Memastikan sesi dimulai

// Cek apakah pengguna sudah login
if (!isset($_SESSION['user_id'])) {
    // Jika belum login, arahkan ke halaman login
    header("Location: login.php");
    exit();
}

// Koneksi ke database
include 'koneksi.php';

// Menangani pencarian
$search = '';
if (isset($_GET['search'])) {
    $search = mysqli_real_escape_string($conn, $_GET['search']);
}

// Query untuk mengambil data album, disesuaikan jika ada pencarian
$query = "SELECT * FROM album WHERE AlbumID LIKE '%$search%' OR NamaAlbum LIKE '%$search%'";
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
    <title>Index Album</title>
    <link rel="stylesheet" href="css/indexalbum.css">
 
</head>
<body>

<div class="container">
    <div class="title">Daftar Album</div>

    <!-- Form Pencarian -->
    <div class="search-container">
        <form method="GET" action="index_album.php">
            <input type="text" name="search" class="search-input" placeholder="Cari berdasarkan AlbumID atau NamaAlbum" value="<?php echo $search; ?>">
            <button type="submit" class="search-button">Cari</button>
        </form>
    </div>

    <a href="add_album.php">Tambah</a>
    <a href="home_admin.php">Home Admin</a>
    <a href="home_user.php">Home User</a>

    <!-- Tombol untuk cetak -->
    <button class="print-button" onclick="window.print()">Cetak Halaman</button>

    <table>
        <thead>
            <tr>
                <th>AlbumID</th>
                <th>Nama Album</th>
                <th>Deskripsi</th>
                <th>Tanggal Dibuat</th>
                <th>UserID</th>
                <th>Uploader</th>
                <th class="action-links">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Looping untuk menampilkan data album
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['AlbumID'] . "</td>";
                echo "<td>" . $row['NamaAlbum'] . "</td>";
                echo "<td>" . $row['Deskripsi'] . "</td>";
                echo "<td>" . $row['TanggalDibuat'] . "</td>";
                echo "<td>" . $row['UserID'] . "</td>";
                echo "<td>" . $row['Uploader'] . "</td>";
                // Tambahkan link untuk melihat foto dalam album, mengedit album, dan menghapus album
                echo "<td class='action-links'>"
                   . "<a href='view_album.php?id=" . $row['AlbumID'] . "'>Lihat</a>"
                   . "<a href='edit_album.php?id=" . $row['AlbumID'] . "'>Edit</a>";

                // Tampilkan link hapus hanya jika level pengguna adalah admin
                if (isset($_SESSION['level']) && $_SESSION['level'] === 'admin') {
                    echo "<a href='delete_album.php?id=" . $row['AlbumID'] . "' onclick='return confirm(\"Apakah Anda yakin ingin menghapus album ini?\")'>Hapus</a>";
                }
                echo "</td>";
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
