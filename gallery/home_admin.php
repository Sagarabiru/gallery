<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Admin</title>
    <link rel="stylesheet" href="css/admin.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Tambahkan aturan ini di dalam admin.css */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #333;
        }

        .navbar-link {
            display: flex;
            align-items: center;
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }

        .navbar-link img {
            margin-right: 8px;
        }

        .navbar-search {
            display: flex;
            align-items: center;
        }

        .search-input {
            padding: 5px;
            border: none;
            border-radius: 5px;
            margin-right: 5px;
        }

        .search-btn {
            background-color: #fff;
            border: none;
            padding: 6px 10px;
            cursor: pointer;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }

        .search-btn i {
            margin-right: 5px;
        }
    </style>
</head>
<body>

<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['level'] != 'admin') {
    header('Location: login.php');
    exit;
}
?>

<!-- Navbar -->
<div class="navbar">
    <a href="index_album.php" class="navbar-link">
        <img src="photo-album-regular-24 (1).png" alt="Album" class="navbar-icon"> Album
    </a>
    <a href="index_foto.php" class="navbar-link">
        <img src="image-solid-24.png" alt="Foto" class="navbar-icon"> Foto
    </a>
    
    <!-- Formulir Pencarian di Navbar -->
    <form method="GET" action="" class="navbar-search">
        <input type="text" name="search" placeholder="Cari Album atau Foto" value="<?php echo isset($_GET['search']) ? $_GET['search'] : ''; ?>" class="search-input">
        <button type="submit" class="search-btn">
            <i class="fas fa-search"></i> Cari
        </button>
    </form>

    <a href="logout.php" class="navbar-link">
        <img src="log-out-regular-24.png" alt="Logout" class="navbar-icon"> Logout
    </a>
</div>

<h1>Selamat Datang, Admin <?php echo $_SESSION['namaLengkap']; ?></h1>

<!-- Koneksi ke database -->
<?php include 'koneksi.php'; ?>

<h2>Album Terbaru</h2>

<!-- Query untuk mendapatkan album berdasarkan pencarian -->
<?php
$search_keyword = isset($_GET['search']) ? $_GET['search'] : '';
$query_albums = "
    SELECT * FROM album 
    WHERE NamaAlbum LIKE '%$search_keyword%' 
    OR Deskripsi LIKE '%$search_keyword%'
    ORDER BY TanggalDibuat DESC 
    LIMIT 6";
$result_albums = mysqli_query($conn, $query_albums);
?>

<!-- Display album information -->
<div class="album-gallery">
    <?php while ($row_album = mysqli_fetch_assoc($result_albums)): ?>
    <div class="album-card">
        <h3><?php echo $row_album['NamaAlbum']; ?></h3>
        <p><?php echo $row_album['Deskripsi']; ?></p>
        <p><strong>Tanggal Dibuat:</strong> <?php echo $row_album['TanggalDibuat']; ?></p>
        <a href="view_album.php?AlbumID=<?php echo $row_album['AlbumID']; ?>">View</a> 
    </div>
    <?php endwhile; ?>
</div>

<h2>Foto Terbaru</h2>

<!-- Query untuk mendapatkan foto berdasarkan pencarian -->
<?php
$query_fotos = "
    SELECT foto.*, album.NamaAlbum 
    FROM foto 
    JOIN album 
    ON foto.AlbumID = album.AlbumID
    WHERE foto.JudulFoto LIKE '%$search_keyword%' 
    OR foto.DeskripsiFoto LIKE '%$search_keyword%' 
    OR album.NamaAlbum LIKE '%$search_keyword%'
    ORDER BY TanggalUnggah DESC
    LIMIT 6";
$result_fotos = mysqli_query($conn, $query_fotos);
?>

<!-- Display photo information -->
<div class="photo-gallery">
    <?php while ($row_foto = mysqli_fetch_assoc($result_fotos)): ?>
    <div class="card" onclick="openModal('<?php echo $row_foto['LokasiFile']; ?>', '<?php echo $row_foto['JudulFoto']; ?>', '<?php echo $row_foto['DeskripsiFoto']; ?>', '<?php echo $row_foto['NamaAlbum']; ?>', '<?php echo $row_foto['TanggalUnggah']; ?>', '<?php echo $row_foto['FotoID']; ?>')">
        <img src="<?php echo $row_foto['LokasiFile']; ?>" alt="Foto" width="100%">
        <h3><?php echo $row_foto['JudulFoto']; ?></h3>
        <p><strong>Album:</strong> <?php echo $row_foto['NamaAlbum']; ?></p>
        <p><strong>Tanggal Unggah:</strong> <?php echo $row_foto['TanggalUnggah']; ?></p>
        <button onclick="printFoto('<?php echo $row_foto['LokasiFile']; ?>')">
            <i class="fas fa-print"></i>
        </button>
    </div>
    <?php endwhile; ?>
</div>

<!-- Modal dan Script tetap sama seperti sebelumnya -->

</body>
</html>
