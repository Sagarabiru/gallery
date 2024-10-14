<?php
// Memulai sesi
session_start();

// Koneksi ke database
include 'koneksi.php';

// Memastikan user sudah login dan UserID disimpan dalam sesi
if (!isset($_SESSION['user_id'])) {
    echo "Anda harus login terlebih dahulu.";
    exit();
}

if (isset($_POST['submit'])) {
    // Ambil data dari form
    $namaAlbum = $_POST['nama_album'];
    $deskripsi = $_POST['deskripsi'];
    $userID = $_SESSION['user_id']; // Mengambil UserID dari sesi pengguna yang login
    $uploader = $_POST['uploader'];
    $tanggalDibuat = date('Y-m-d'); // Menyimpan tanggal saat ini

    // Query untuk menyimpan album baru ke database
    $query = "INSERT INTO album (NamaAlbum, Deskripsi, UserID, Uploader, TanggalDibuat) 
              VALUES ('$namaAlbum', '$deskripsi', '$userID', '$uploader', '$tanggalDibuat')";

    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "Album berhasil ditambahkan.";
        header("Location: index_album.php"); // Redirect ke halaman daftar album
        exit();
    } else {
        echo "Terjadi kesalahan saat menambahkan album: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Album</title>
    <style>
        body {
            font-family: Times New Roman, serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="title">Tambah Album</div>
    <form method="POST" action="">
        <label for="nama_album">Nama Album:</label>
        <input type="text" name="nama_album" required>

        <label for="deskripsi">Deskripsi:</label>
        <textarea name="deskripsi" required></textarea>

        <label for="uploader">Uploader:</label>
        <input type="text" name="uploader" required>

        <input type="submit" name="submit" value="Tambahkan Album">
    </form>
</div>

</body>
</html>

<?php
// Tutup koneksi
mysqli_close($conn);
?>
