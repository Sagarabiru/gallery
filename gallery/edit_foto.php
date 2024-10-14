<?php
// Koneksi ke database
include 'koneksi.php';

if (isset($_GET['id'])) {
    $fotoID = $_GET['id'];

    // Query untuk mengambil data foto berdasarkan FotoID
    $query = "SELECT * FROM foto WHERE FotoID = '$fotoID'";
    $result = mysqli_query($conn, $query);
    $foto = mysqli_fetch_assoc($result);

    if (!$foto) {
        die("Foto tidak ditemukan.");
    }
} else {
    die("ID foto tidak ditentukan.");
}

// Proses update data
if (isset($_POST['update'])) {
    // Ambil data dari form
    $judulFoto = $_POST['judul'];
    $deskripsiFoto = $_POST['deskripsi'];
    $albumID = $_POST['album'];
    $userID = $_POST['user'];
    $uploader = $_POST['uploader'];

    // Update query
    $query = "UPDATE foto SET JudulFoto = '$judulFoto', DeskripsiFoto = '$deskripsiFoto', 
              AlbumID = '$albumID', UserID = '$userID', Uploader = '$uploader' 
              WHERE FotoID = '$fotoID'";
    
    $result = mysqli_query($conn, $query);

    if ($result) {
        header("Location: index_foto.php"); // Redirect ke halaman index_foto.php setelah berhasil
    } else {
        echo "Terjadi kesalahan saat mengupdate data: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Foto</title>
    <style>
        body {
            font-family: Times New Roman, serif;
            background-color: #f5f5f5;
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
        .title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"],
        input[type="file"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
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
    <div class="title">Edit Foto</div>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="judul">Judul Foto:</label>
        <input type="text" name="judul" id="judul" value="<?php echo $foto['JudulFoto']; ?>" required>

        <label for="deskripsi">Deskripsi Foto:</label>
        <input type="text" name="deskripsi" id="deskripsi" value="<?php echo $foto['DeskripsiFoto']; ?>" required>

        <label for="album">Album ID:</label>
        <input type="text" name="album" id="album" value="<?php echo $foto['AlbumID']; ?>" required>

        <label for="user">User ID:</label>
        <input type="text" name="user" id="user" value="<?php echo $foto['UserID']; ?>" required>

        <label for="uploader">Uploader:</label>
        <input type="text" name="uploader" id="uploader" value="<?php echo $foto['Uploader']; ?>" required>

        <input type="submit" name="update" value="Update Foto">
    </form>
</div>

</body>
</html>

<?php
// Tutup koneksi
mysqli_close($conn);
?>
