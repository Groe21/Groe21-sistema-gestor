<?php
session_start();
include_once(__DIR__ . '/../../config/conexion.php');

class Autenticacion {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function autenticarUsuario($username, $password) {
        $sql = "SELECT * FROM escuela.usuarios WHERE username = :username";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':username' => $username]);
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($usuario && password_verify($password, $usuario['password'])) {
            return $usuario;
        } else {
            return false;
        }
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['usuario'];
    $password = $_POST['contrasena'];

    $pdo = conectarBaseDeDatos();
    $autenticacion = new Autenticacion($pdo);
    $usuario = $autenticacion->autenticarUsuario($username, $password);

    if ($usuario) {
        // Almacena la cédula en la sesión
        $_SESSION['usuario'] = [
            'cedula' => $usuario['username'], // Asumiendo que 'username' es la cédula
            'nombres' => $usuario['nombres'] // Asegúrate de que 'nombres' esté presente en la base de datos
        ];
        header('Location: ../../principal.php'); // Redirigir a la página principal o dashboard
        exit();
    } else {
        $_SESSION['error'] = 'Nombre de usuario o contraseña incorrectos';
        header('Location: ../../login.php'); // Redirigir de vuelta al login
        exit();
    }
}
?>