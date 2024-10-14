<?php
// Koneksi ke database
include 'koneksi.php';
session_start();

if (isset($_GET['id'])) {
    $fotoID = $_GET['id'];

    // Query untuk mengambil data foto berdasarkan FotoID
    $query = "SELECT * FROM foto WHERE FotoID = '$fotoID'";
    $result = mysqli_query($conn, $query);
    $foto = mysqli_fetch_assoc($result);

    if (!$foto) {
        die("Foto tidak ditemukan.");
    }

    // Query untuk menghitung jumlah like
    $likeQuery = "SELECT COUNT(*) as totalLikes FROM likefoto WHERE FotoID = '$fotoID'";
    $likeResult = mysqli_query($conn, $likeQuery);
    $likeData = mysqli_fetch_assoc($likeResult);
    $totalLikes = $likeData['totalLikes'];

    // Proses menambah komentar
    if (isset($_POST['submit_comment'])) {
        $isiKomentar = $_POST['isi_komentar'];
        $namaPengomentar = $_POST['nama_pengomentar'];
        $tanggalKomentar = date('Y-m-d H:i:s');

        // Query untuk menyimpan komentar
        $insertCommentQuery = "INSERT INTO komentarfoto (FotoID, NamaPengomentar, IsiKomentar, TanggalKomentar) 
                                VALUES ('$fotoID', '$namaPengomentar', '$isiKomentar', '$tanggalKomentar')";
        mysqli_query($conn, $insertCommentQuery);
        header("Location: view_foto.php?id=$fotoID");
        exit; // Menghentikan eksekusi setelah komentar tersimpan
    }

    // Mengambil komentar untuk foto ini
    $commentsQuery = "SELECT * FROM komentarfoto WHERE FotoID = '$fotoID' ORDER BY TanggalKomentar DESC";
    $commentsResult = mysqli_query($conn, $commentsQuery);
} else {
    die("ID foto tidak ditentukan.");
}

// Proses like/unlike
if (isset($_POST['like'])) {
    $queryLike = "INSERT INTO likefoto (FotoID) VALUES ('$fotoID')";
    mysqli_query($conn, $queryLike);
    header("Location: view_foto.php?id=$fotoID");
    exit;
}

if (isset($_POST['unlike'])) {
    $queryUnlike = "DELETE FROM likefoto WHERE FotoID = '$fotoID' LIMIT 1";
    mysqli_query($conn, $queryUnlike);
    header("Location: view_foto.php?id=$fotoID");
    exit;
}

// Proses hapus komentar
if (isset($_POST['delete_comment'])) {
    $komentarID = $_POST['komentar_id'];
    $deleteCommentQuery = "DELETE FROM komentarfoto WHERE KomentarID = '$komentarID'";
    mysqli_query($conn, $deleteCommentQuery);
    header("Location: view_foto.php?id=$fotoID");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Foto</title>
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
            display: flex;
            justify-content: space-between;
        }
        .left-section {
            width: 50%;
        }
        .right-section {
            width: 40%;
        }
        .title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .like-unlike {
            text-align: center;
            margin: 20px 0;
        }
        .like-unlike input {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .like-unlike input:hover {
            background-color: #45a049;
        }
        .info {
            margin: 20px 0;
        }
        .comments-section {
            margin-top: 30px;
        }
        .comment {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .comment strong {
            display: block;
        }
        .delete-button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            margin-top: 5px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <a href="home_admin.php">Home Admin</a>
            <a href="home_user.php">Home User</a>
            <div class="title">Detail Foto</div>
            <img src="<?php echo $foto['LokasiFile']; ?>" alt="<?php echo $foto['JudulFoto']; ?>">
            <div class="info">
                <h2><?php echo $foto['JudulFoto']; ?></h2>
                <p><?php echo $foto['DeskripsiFoto']; ?></p>
                <p><strong>Tanggal Unggah:</strong> <?php echo $foto['TanggalUnggah']; ?></p>
                <p><strong>Uploader:</strong> <?php echo $foto['Uploader']; ?></p>
            </div>
        </div>

        <div class="right-section">
            <div class="like-unlike">
                <form action="" method="post">
                    <input type="submit" name="like" value="Like">
                    <input type="submit" name="unlike" value="Unlike">
                </form>
                <p>Total Likes: <?php echo $totalLikes; ?></p>
            </div>

            <div class="comments-section">
                <h3>Komentar</h3>
                <form action="" method="post">
                    <input type="text" name="nama_pengomentar" placeholder="Nama Anda" required><br><br>
                    <textarea name="isi_komentar" required></textarea><br><br>
                    <input type="submit" name="submit_comment" value="Kirim Komentar">
                </form>

                <?php while ($comment = mysqli_fetch_assoc($commentsResult)): ?>
                    <div class="comment">
                        <strong><?php echo $comment['NamaPengomentar']; ?> (<?php echo $comment['TanggalKomentar']; ?>):</strong>
                        <p><?php echo $comment['IsiKomentar']; ?></p>
                        <?php if ($_SESSION['level'] == 'admin'): ?>
                            <form action="" method="post" style="display:inline;">
                                <input type="hidden" name="komentar_id" value="<?php echo $comment['KomentarID']; ?>">
                                <input type="submit" name="delete_comment" value="Hapus" class="delete-button">
                            </form>
                        <?php endif; ?>
                    </div>
                <?php endwhile; ?>
            </div>
        </div>
    </div>
</body>
</html>

<?php
// Tutup koneksi
mysqli_close($conn);
?>
