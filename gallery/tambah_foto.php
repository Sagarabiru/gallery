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

// Ambil daftar album dari database
$query_album = "SELECT AlbumID, NamaAlbum FROM album";
$result_album = mysqli_query($conn, $query_album);

if (isset($_POST['submit'])) {
    // Ambil data dari form
    $judulFoto = $_POST['judul'];
    $deskripsiFoto = $_POST['deskripsi'];
    $tanggalUnggah = $_POST['tanggal'];
    $albumID = $_POST['album']; // Ambil album yang dipilih
    $userID = $_SESSION['user_id']; // Ambil UserID dari sesi
    $uploader = $_POST['uploader'];

    // Cek apakah FotoID sudah digunakan
    $query_cek_id = "SELECT FotoID FROM foto WHERE JudulFoto = '$judulFoto'";
    $result_cek_id = mysqli_query($conn, $query_cek_id);

    if (mysqli_num_rows($result_cek_id) > 0) {
        echo "Maaf, ID telah digunakan.";
    } else {
        // Proses upload file
        $target_dir = "images/"; // Folder tempat menyimpan file
        $file_name = basename($_FILES["file"]["name"]);
        $target_file = $target_dir . $file_name;
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Cek apakah file adalah gambar
        $check = getimagesize($_FILES["file"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            echo "File bukan gambar.";
            $uploadOk = 0;
        }

        // Cek ukuran file (maksimum 5MB)
        if ($_FILES["file"]["size"] > 5000000) {
            echo "File terlalu besar.";
            $uploadOk = 0;
        }

        // Hanya izinkan format tertentu (JPG, JPEG, PNG, GIF)
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
            echo "Hanya file JPG, JPEG, PNG, dan GIF yang diperbolehkan.";
            $uploadOk = 0;
        }

        // Cek apakah $uploadOk adalah 0 akibat error
        if ($uploadOk == 0) {
            echo "File gagal diunggah.";
        } else {
            // Jika semua pengecekan berhasil, upload file
            if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
                // Simpan informasi ke database
                $query = "INSERT INTO foto (JudulFoto, DeskripsiFoto, TanggalUnggah, LokasiFile, AlbumID, UserID, Uploader) 
                          VALUES ('$judulFoto', '$deskripsiFoto', '$tanggalUnggah', '$target_file', '$albumID', '$userID', '$uploader')";

                $result = mysqli_query($conn, $query);

                if ($result) {
                    echo "File berhasil diunggah dan data disimpan.";
                    header("Location: index_foto.php"); // Redirect ke halaman index_foto.php
                    exit; // Pastikan untuk menghentikan eksekusi script setelah redirect
                } else {
                    echo "Terjadi kesalahan saat menyimpan data: " . mysqli_error($conn);
                }
            } else {
                echo "Terjadi kesalahan saat mengunggah file.";
            }
        }
    }
}

// Tutup koneksi database
mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Foto</title>
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 10px;
        }
        input[type="text"], input[type="date"], textarea, input[type="file"], select {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
        }
        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Tambah Foto Baru</h2>
    <form action="tambah_foto.php" method="POST" enctype="multipart/form-data">
        <label for="judul">Judul Foto:</label>
        <input type="text" name="judul" id="judul" required>
        
        <label for="deskripsi">Deskripsi Foto:</label>
        <textarea name="deskripsi" id="deskripsi" rows="4" required></textarea>
        
        <label for="tanggal">Tanggal Unggah:</label>
        <input type="date" name="tanggal" id="tanggal" required>
        
        <label for="album">Pilih Album:</label>
        <select name="album" id="album" required>
            <option value="" disabled selected>Pilih Album</option>
            <?php while($row_album = mysqli_fetch_assoc($result_album)) { ?>
                <option value="<?= $row_album['AlbumID']; ?>"><?= $row_album['NamaAlbum']; ?></option>
            <?php } ?>
        </select>
        
        <label for="uploader">Uploader:</label>
        <input type="text" name="uploader" id="uploader" required>
        
        <label for="file">Pilih Foto:</label>
        <input type="file" name="file" id="file" accept="image/*" required>
        
        <button type="submit" name="submit">Upload Foto</button>
    </form>
    <div class="back-link">
        <a href="index_foto.php">Kembali ke Daftar Foto</a>
    </div>
</div>

</body>
</html>
