<?php
include 'koneksi.php'; // Memasukkan file koneksi
session_start();

if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']); // Amankan input username
    $namaLengkap = mysqli_real_escape_string($conn, $_POST['namaLengkap']); // Amankan input nama lengkap
    $password = $_POST['password']; // Ambil password input user

    // Query untuk mendapatkan data user berdasarkan username dan nama lengkap
    $stmt = $conn->prepare("SELECT * FROM user WHERE Username = ? AND NamaLengkap = ?");
    $stmt->bind_param('ss', $username, $namaLengkap);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc(); // Ambil data user dari database

    // Verifikasi password dan cek apakah user ada
    if ($user && password_verify($password, $user['Password'])) {
        // Jika berhasil login, simpan data user di sesi
        $_SESSION['user_id'] = $user['UserID'];
        $_SESSION['level'] = $user['Level'];
        $_SESSION['namaLengkap'] = $user['NamaLengkap'];

        // Arahkan berdasarkan level user (admin atau user)
        if (strtolower($user['Level']) == 'admin') {
            header('Location: home_admin.php'); // Arahkan ke halaman admin
            exit();
        } else {
            header('Location: home_user.php'); // Arahkan ke halaman user
            exit();
        }
    } else {
        // Jika username, nama lengkap, atau password salah
        echo "<script>alert('Username, Nama Lengkap, atau password salah!'); window.location.href='login.php';</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css"> <!-- Kustomisasi CSS -->
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

    <form method="post" action="login.php">
        <h2>Login</h2>
        
        <label for="username"></label>
        <input type="text" name="username" placeholder="Username" required><br>

        <label for="namaLengkap"></label>
        <input type="text" name="namaLengkap" placeholder="Nama Lengkap" required><br>

        <label for="password"></label>
        <input type="password" name="password" placeholder="Password" id="password" required><br>
        
        <button type="submit" name="login">Login</button>

        <!-- Checkbox untuk toggle visibilitas password -->
        <label><input type="checkbox" onclick="togglePassword()"> <span id="showPassword">Lihat Password</span></label>
        <p>Belum punya akun? <a href="register.php">Daftar di sini</a></p>
    </form>

</body>
</html>
