<?php
$servername = "localhost"; // Sesuaikan dengan server database Anda
$username = "root"; // Username database
$password = ""; // Password database
$dbname = "gallery"; // Nama database

// Membuat koneksi ke database
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Cek koneksi
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>
