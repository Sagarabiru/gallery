<?php
include 'koneksi.php'; // Memasukkan file koneksi

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']); // Amankan input username
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hashing password
    $namalengkap = mysqli_real_escape_string($conn, $_POST['namalengkap']);
    $alamat = mysqli_real_escape_string($conn, $_POST['alamat']);
    
    // Cek apakah level user adalah admin atau user
    $level = (strtolower($username) == 'admin') ? 'admin' : 'user';

    // Cek apakah email sudah terdaftar
    $check_query = "SELECT * FROM user WHERE Email='$email'";
    $result = $conn->query($check_query);

    if ($result->num_rows > 0) {
        // Jika email sudah ada di database
        echo "<script>alert('Email sudah terdaftar! Silakan login.'); window.location.href='login.php';</script>";
    } else {
        // Jika email belum terdaftar, lanjutkan dengan pendaftaran
        $sql = "INSERT INTO user (Username, Password, Email, NamaLengkap, Alamat, Level) 
                VALUES ('$username', '$password', '$email', '$namalengkap', '$alamat', '$level')";

        if ($conn->query($sql) === TRUE) {
            echo "<script>alert('Registrasi berhasil!'); window.location.href='login.php';</script>";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrasi</title>
    <link rel="stylesheet" href="css/register.css"> <!-- Kustomisasi CSS -->
    <script>
        // Fungsi untuk toggle visibilitas password
        function togglePassword() {
            var passwordField = document.getElementById("password");
            var showPassword = document.getElementById("showPassword");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                showPassword.innerHTML = "Sembunyikan Password";
            } else {
                passwordField.type = "password";
                showPassword.innerHTML = "Lihat Password";
            }
        }
    </script>
</head>
<body>

    <form method="POST" action="register.php">
        <h2>Registrasi</h2>
        <label></label><input type="text" name="username" placeholder="username" required><br>
        <label></label><input type="email" name="email" placeholder="email" required><br>
        <label></label><input type="text" name="namalengkap" placeholder="nama lengkap" required><br>
        <label></label><textarea name="alamat" placeholder="alamat" required></textarea><br>
        <label></label><input type="password" name="password" placeholder="password" id="password" required><br>

        <!-- Checkbox untuk toggle visibilitas password -->
        <label><input type="checkbox" onclick="togglePassword()"> <span id="showPassword">Lihat Password</span></label><br>

        <!-- Tombol register -->
        <button type="submit">Register</button>
        <a href="login.php" class="button">Login</a>
    </form>

</body>
</html>
