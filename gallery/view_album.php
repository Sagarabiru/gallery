<?php
// Mulai session
session_start();

// Cek apakah pengguna sudah login
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Koneksi ke database
include 'koneksi.php';

// Ambil AlbumID dari URL
if (isset($_GET['AlbumID'])) {
    $albumID = $_GET['AlbumID'];

    // Query untuk mendapatkan informasi album
    $query_album = "SELECT * FROM album WHERE AlbumID = '$albumID'";
    $result_album = mysqli_query($conn, $query_album);

    if (!$result_album || mysqli_num_rows($result_album) == 0) {
        die("Album tidak ditemukan.");
    }

    $album = mysqli_fetch_assoc($result_album);

    // Query untuk mengambil semua foto di dalam album
    $query_foto = "SELECT * FROM foto WHERE AlbumID = '$albumID'";
    $result_foto = mysqli_query($conn, $query_foto);

} else {
    // Jika AlbumID tidak ditemukan di URL, redirect ke halaman daftar album
    header("Location: index_album.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Album: <?= $album['NamaAlbum']; ?></title>
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
        .album-title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .album-info {
            text-align: center;
            margin-bottom: 40px;
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }
        .gallery-item {
            width: 200px;
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .gallery-item img {
            max-width: 100%;
            height: auto;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="album-title">Album: <?= $album['NamaAlbum']; ?></div>
    <div class="album-info">
        <p>Deskripsi: <?= $album['Deskripsi']; ?></p>
        <p>Tanggal Dibuat: <?= $album['TanggalDibuat']; ?></p>
        <p>Uploader: <?= $album['Uploader']; ?></p>
    </div>

    <div class="gallery">
        <?php if (mysqli_num_rows($result_foto) > 0) { ?>
            <?php while ($row_foto = mysqli_fetch_assoc($result_foto)) { ?>
                <div class="gallery-item">
                    <img src="<?= $row_foto['LokasiFile']; ?>" alt="<?= $row_foto['JudulFoto']; ?>">
                    <p><?= $row_foto['JudulFoto']; ?></p>
                    <p><?= $row_foto['DeskripsiFoto']; ?></p>
                </div>
            <?php } ?>
        <?php } else { ?>
            <p>Tidak ada foto dalam album ini.</p>
        <?php } ?>
    </div>

    <div class="back-link">
        <a href="index_album.php">Kembali ke Daftar Album</a>
    </div>
</div>

</body>
</html>

<?php
// Tutup koneksi
mysqli_close($conn);
?>
