<?php
session_start();

// Mengecek apakah pengguna sudah login untuk mengakses halaman edit atau delete
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

    <!-- Form pencarian -->
    <form action="" method="GET" class="navbar-search">
        <input type="text" name="search" placeholder="Cari foto atau album..." class="search-input">
        <button type="submit" class="search-btn">Cari</button>
    </form>
</div>

<!-- Koneksi ke database -->
<?php include 'koneksi.php'; ?>

<h2>Hasil Pencarian</h2>

<?php
$search_query = '';
if (isset($_GET['search'])) {
    $search_query = mysqli_real_escape_string($conn, $_GET['search']);

    // Query untuk mencari foto atau album berdasarkan keyword
    $query = "
        SELECT foto.*, album.NamaAlbum 
        FROM foto 
        JOIN album 
        ON foto.AlbumID = album.AlbumID
        WHERE foto.JudulFoto LIKE '%$search_query%' OR album.NamaAlbum LIKE '%$search_query%'
        ORDER BY TanggalUnggah DESC";
} else {
    // Default query jika tidak ada pencarian
    $query = "
        SELECT foto.*, album.NamaAlbum 
        FROM foto 
        JOIN album 
        ON foto.AlbumID = album.AlbumID
        ORDER BY TanggalUnggah DESC
        LIMIT 6";
}

$result = mysqli_query($conn, $query);
?>

<!-- Gallery container for displaying photos -->
<div class="photo-gallery">
    <?php if (mysqli_num_rows($result) > 0): ?>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <div class="card" onclick="openModal('<?php echo $row['FotoID']; ?>')">
            <img src="<?php echo $row['LokasiFile']; ?>" alt="Foto" width="100%">
            <h3><?php echo $row['JudulFoto']; ?></h3>
            <p><strong>Album:</strong> <?php echo $row['NamaAlbum']; ?></p>
            <p><strong>Tanggal Unggah:</strong> <?php echo $row['TanggalUnggah']; ?></p>
            <a href="<?php echo $row['LokasiFile']; ?>" download="<?php echo $row['JudulFoto']; ?>" class="download-btn">
                <img src="download-regular-24.png" alt="Download" width="16px" height="16px">
            </a>
        
        </div>
        <?php endwhile; ?>
    <?php else: ?>
        <p>Tidak ada hasil ditemukan untuk pencarian "<?php echo htmlspecialchars($search_query); ?>"</p>
    <?php endif; ?>
</div>

<script>
function openModal(fotoID) {
    var modal = document.getElementById("photoModal");
    var modalBody = document.getElementById("modal-body");

    // Make an AJAX call to get the photo details
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "view_foto.php?id=" + fotoID, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            modalBody.innerHTML = xhr.responseText;
            modal.style.display = "block";
        }
    };
    xhr.send();
}

function closeModal() {
    document.getElementById("photoModal").style.display = "none";
}
</script>

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

/* Form Pencarian di Navbar */
.navbar-search {
    display: inline-block;
    margin-left: 20px;
}

.search-input {
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 180px;
    outline: none;
    transition: all 0.3s ease;
}

.search-input:focus {
    border-color: #7A8665; /* Warna border saat input fokus */
    box-shadow: 0 0 5px rgba(122, 134, 101, 0.5);
}

.search-btn {
    padding: 8px 15px;
    font-size: 14px;
    border: none;
    background-color: #8C9A6F;
    color: white;
    cursor: pointer;
    border-radius: 4px;
    margin-left: 5px;
    transition: background-color 0.3s ease;
}

.search-btn:hover {
    background-color: #7A8665;
}

/* Gallery Styles */
.photo-gallery, .album-gallery {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 20px;
    justify-content: center; /* Center the gallery */
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

/* Modal styles */
#photoModal {
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.8);
    display: none;
    align-items: center;
    justify-content: center;
}

.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    position: relative;
    max-width: 800px;
    max-height: 80%;
    overflow-y: auto;
}

.close {
    position: absolute;
    top: 10px;
    right: 10px;
    color: #aaa;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover, .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* Tambahan padding untuk tata letak keseluruhan */
h1, h2 {
    text-align: center;
    color: #333;
    margin-top: 20px;
    margin-bottom: 10px;
}


</style>
