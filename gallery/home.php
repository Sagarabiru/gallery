<?php
session_start();

// Jika ada aksi edit atau delete, periksa login
if (isset($_GET['action']) && ($_GET['action'] == 'edit' || $_GET['action'] == 'delete')) {
    if (!isset($_SESSION['user_id'])) {
        // Jika belum login, alihkan ke halaman login
        header('Location: login.php');
        exit;
    }
}

// Jika pengguna sudah login, tampilkan nama pengguna
if (isset($_SESSION['user_id'])) {
    echo "<h1>Selamat Datang, User " . $_SESSION['namaLengkap'] . "</h1>";
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
    <?php if (isset($_SESSION['user_id'])): ?>
        <a href="logout.php" class="navbar-link">
            <img src="log-out-regular-24.png" alt="Logout" class="navbar-icon"> Logout
        </a>
    <?php else: ?>
        <a href="login.php" class="navbar-link">
            <img src="log-in-circle-regular-24.png" alt="Login" class="navbar-icon"> Login
        </a>
    <?php endif; ?>
</div>

<!-- Koneksi ke database -->
<?php include 'koneksi.php'; ?>

<h2>Foto Terbaru</h2>

<!-- Query untuk mendapatkan semua foto -->
<?php
$query = "
    SELECT foto.*, album.NamaAlbum 
    FROM foto 
    JOIN album 
    ON foto.AlbumID = album.AlbumID
    ORDER BY TanggalUnggah DESC
    LIMIT 6"; // Adjust the limit as needed
$result = mysqli_query($conn, $query);
?>

<h2>Album Terbaru</h2>

<!-- Query untuk mendapatkan semua album -->
<?php
$query_albums = "SELECT * FROM album ORDER BY TanggalDibuat DESC LIMIT 6"; // Adjust the limit as needed
$result_albums = mysqli_query($conn, $query_albums);
?>

<!-- Display album information -->
<div class="album-gallery">
    <?php while ($row_album = mysqli_fetch_assoc($result_albums)): ?>
    <div class="album-card">
        <h3><?php echo $row_album['NamaAlbum']; ?></h3>
        <p><?php echo $row_album['Deskripsi']; ?></p>
        <p><strong>Tanggal Dibuat:</strong> <?php echo $row_album['TanggalDibuat']; ?></p>
        <?php if (isset($_SESSION['user_id'])): ?>
            <a href="edit_album.php?AlbumID=<?php echo $row_album['AlbumID']; ?>">Edit</a> |
            <a href="delete_album.php?AlbumID=<?php echo $row_album['AlbumID']; ?>" onclick="return confirm('Apakah Anda yakin ingin menghapus album ini?')">Delete</a>
        <?php else: ?>
            <a href="view_album.php?AlbumID=<?php echo $row_album['AlbumID']; ?>">View</a>
        <?php endif; ?>
    </div>
    <?php endwhile; ?>
</div>

<!-- Gallery container for displaying photos -->
<div class="photo-gallery">
    <?php while ($row = mysqli_fetch_assoc($result)): ?>
    <div class="card">
        <img src="<?php echo $row['LokasiFile']; ?>" alt="Foto" width="100%">
        <h3><?php echo $row['JudulFoto']; ?></h3>
        <p><strong>Album:</strong> <?php echo $row['NamaAlbum']; ?></p>
        <p><strong>Tanggal Unggah:</strong> <?php echo $row['TanggalUnggah']; ?></p>
        <!-- Add Download button with smaller icon -->
        <a href="<?php echo $row['LokasiFile']; ?>" download="<?php echo $row['JudulFoto']; ?>" class="download-btn">
            <img src="download-regular-24.png" alt="Download" width="16px" height="16px"> <!-- Ukuran ikon lebih kecil -->
        </a>
    </div>
    <?php endwhile; ?>
</div>

<style>
/* Body Style */
body {
    background-color: #E7CCCC; /* Background color body */
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    font-family: 'Times New Roman', serif;
}

/* Navbar Style */
.navbar {
    background-color: #A5B68D; /* Background color navbar */
    padding: 10px;
    text-align: center;
}

.navbar a {
    color: #333;
    padding: 10px 20px;
    text-decoration: none;
    font-weight: bold;
    margin: 0 15px;
    display: inline-flex;
    align-items: center;
}

.navbar a:hover {
    background-color: #8C9A6F; /* Hover effect */
    color: white;
}

.navbar-icon {
    margin-right: 5px;
    width: 20px;
    height: 20px;
}

/* Gallery Styles */
.photo-gallery, .album-gallery {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 10px;
}

.card, .album-card {
    background-color: #A5B68D; /* Card background color */
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    width: calc(20% - 10px); /* 5 cards per row */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    padding: 5px;
    cursor: pointer;
    transition: transform 0.2s;
}

.card:hover, .album-card:hover {
    transform: scale(1.05);
}

.card img {
    max-width: 100%;
    height: 150px; /* Menetapkan tinggi tetap untuk foto */
    object-fit: cover; /* Menjaga proporsi gambar */
}

.card h3, .album-card h3 {
    margin: 0;
    padding: 5px;
    font-size: 0.9em;
}

.card p, .album-card p {
    padding: 0 5px 5px;
    font-size: 0.8em;
}

.card a, .album-card a {
    display: inline-block;
    margin: 5px;
    color: #007BFF;
    text-decoration: none;
}

.card a:hover, .album-card a:hover {
    text-decoration: underline;
}

/* Download button style */
.download-btn img {
    display: inline-block;
    margin-top: 5px;
    width: 16px; /* Ukuran ikon lebih kecil */
    height: 16px; /* Ukuran ikon lebih kecil */
}
</style>
