<?php
include_once(__DIR__ . '/../../config/conexion.php');

class Persona {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function insertarPersona($cedula, $apellidos, $nombres, $direccion, $telefono, $correo, $rol) {
        $sql = "INSERT INTO escuela.personas (cedula, apellidos, nombres, direccion, telefono, correo, rol) 
                VALUES (:cedula, :apellidos, :nombres, :direccion, :telefono, :correo, :rol)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':cedula' => $cedula,
            ':apellidos' => $apellidos,
            ':nombres' => $nombres,
            ':direccion' => $direccion,
            ':telefono' => $telefono,
            ':correo' => $correo,
            ':rol' => $rol
        ]);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $cedula = $_POST['cedula'];
    $apellidos = $_POST['apellidos'];
    $nombres = $_POST['nombres'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    $correo = $_POST['correo'];
    $rol = $_POST['rol'];

    $pdo = conectarBaseDeDatos();
    $persona = new Persona($pdo);
    $persona->insertarPersona($cedula, $apellidos, $nombres, $direccion, $telefono, $correo, $rol);

    echo json_encode(['success' => true]);
}
?>