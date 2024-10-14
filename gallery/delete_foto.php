<?php
// Koneksi ke database
include 'koneksi.php';
session_start();

// Periksa apakah pengguna sudah login dan memiliki level yang sesuai (misal, level admin)
if (!isset($_SESSION['level']) || $_SESSION['level'] !== 'admin') {
    die("Akses ditolak. Hanya pengguna dengan level admin yang dapat menghapus foto.");
}

// Cek jika ID foto diterima
if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $fotoID = $_GET['id'];

    // Query untuk menghapus foto dari database
    $query = "DELETE FROM foto WHERE FotoID = '$fotoID'";
    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "Foto berhasil dihapus.";
        header("Location: index_foto.php"); // Redirect kembali ke halaman index
        exit();
    } else {
        echo "Terjadi kesalahan saat menghapus foto: " . mysqli_error($conn);
    }
} else {
    echo "ID foto tidak valid.";
}

// Tutup koneksi database
mysqli_close($conn);
?>
