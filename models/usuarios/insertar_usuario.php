<?php
include_once(__DIR__ . '/../../config/conexion.php');

class Usuario {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function insertarUsuario($id_persona, $username, $password) {
        $sql = "INSERT INTO escuela.usuarios (id_persona, username, password) 
                VALUES (:id_persona, :username, :password)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':id_persona' => $id_persona,
            ':username' => $username,
            ':password' => password_hash($password, PASSWORD_BCRYPT) // Hash de la contraseña
        ]);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_persona = $_POST['id_persona'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    $pdo = conectarBaseDeDatos();
    $usuario = new Usuario($pdo);
    $usuario->insertarUsuario($id_persona, $username, $password);

    echo json_encode(['success' => true]);
}
?>