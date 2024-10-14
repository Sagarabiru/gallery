<?php
// Koneksi ke database
include 'koneksi.php';

// Cek apakah parameter AlbumID ada di URL
if (isset($_GET['id'])) {
    $albumID = $_GET['id'];

    // Query untuk mengambil data album berdasarkan AlbumID
    $query = "SELECT * FROM album WHERE AlbumID = $albumID";
    $result = mysqli_query($conn, $query);

    if (!$result) {
        die("Query Error: " . mysqli_errno($conn) . " - " . mysqli_error($conn));
    }

    // Ambil data album
    $album = mysqli_fetch_assoc($result);

    // Cek jika album tidak ditemukan
    if (!$album) {
        echo "Album tidak ditemukan.";
        exit();
    }
} else {
    echo "ID album tidak diberikan.";
    exit();
}

if (isset($_POST['submit'])) {
    // Ambil data dari form
    $namaAlbum = $_POST['nama_album'];
    $deskripsi = $_POST['deskripsi'];
    $uploader = $_POST['uploader'];

    // Query untuk mengupdate album
    $query = "UPDATE album SET NamaAlbum = '$namaAlbum', Deskripsi = '$deskripsi', Uploader = '$uploader' WHERE AlbumID = $albumID";
    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "Album berhasil diperbarui.";
        header("Location: index_album.php"); // Redirect ke halaman daftar album
        exit();
    } else {
        echo "Terjadi kesalahan saat memperbarui album: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Album</title>
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
    <div class="title">Edit Album</div>
    <form method="POST" action="">
        <label for="nama_album">Nama Album:</label>
        <input type="text" name="nama_album" value="<?php echo $album['NamaAlbum']; ?>" required>

        <label for="deskripsi">Deskripsi:</label>
        <textarea name="deskripsi" required><?php echo $album['Deskripsi']; ?></textarea>

        <label for="uploader">Uploader:</label>
        <input type="text" name="uploader" value="<?php echo $album['Uploader']; ?>" required>

        <input type="submit" name="submit" value="Perbarui Album">
    </form>
</div>

</body>
</html>

<?php
// Tutup koneksi
mysqli_close($conn);
?>
