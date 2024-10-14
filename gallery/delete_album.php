<?php
// Mulai session
session_start();

// Cek apakah pengguna sudah login dan apakah levelnya adalah admin
if (!isset($_SESSION['user_id']) || $_SESSION['level'] !== 'admin') {
    header("Location: login.php");
    exit();
}

// Koneksi ke database
include 'koneksi.php';

// Ambil AlbumID dari URL
$album_id = isset($_GET['id']) ? mysqli_real_escape_string($conn, $_GET['id']) : null;

if ($album_id) {
    // Mulai transaksi
    mysqli_begin_transaction($conn);

    try {
        // Hapus semua foto terkait dengan album
        $delete_photos_query = "DELETE FROM foto WHERE AlbumID = ?";
        $stmt = $conn->prepare($delete_photos_query);
        $stmt->bind_param('i', $album_id);
        $stmt->execute();

        // Hapus album dari tabel album
        $delete_album_query = "DELETE FROM album WHERE AlbumID = ?";
        $stmt = $conn->prepare($delete_album_query);
        $stmt->bind_param('i', $album_id);
        $stmt->execute();

        // Commit transaksi jika tidak ada masalah
        mysqli_commit($conn);

        // Redirect setelah berhasil menghapus
        echo "<script>alert('Album dan semua foto di dalamnya berhasil dihapus!'); window.location.href='index_album.php';</script>";
    } catch (Exception $e) {
        // Rollback transaksi jika terjadi kesalahan
        mysqli_rollback($conn);
        echo "<script>alert('Gagal menghapus album dan foto terkait. Silakan coba lagi.'); window.location.href='index_album.php';</script>";
    }
} else {
    echo "<script>alert('ID Album tidak ditemukan!'); window.location.href='index_album.php';</script>";
}

// Tutup koneksi
mysqli_close($conn);
?>
