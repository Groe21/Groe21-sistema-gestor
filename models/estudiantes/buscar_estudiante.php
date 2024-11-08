<?php
include_once(__DIR__ . '/../../config/conexion.php');

class BuscarPersona {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function buscarPorRol($tipo) {
        $sql = "SELECT id_persona, cedula, nombres, apellidos, direccion, correo FROM escuela.personas WHERE rol = :tipo";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':tipo' => $tipo]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $tipo = $_POST['tipo'];

    $pdo = conectarBaseDeDatos();
    $buscarPersona = new BuscarPersona($pdo);
    $personas = $buscarPersona->buscarPorRol($tipo);

    if ($personas) {
        echo json_encode($personas);
    } else {
        echo json_encode(['error' => 'No se encontraron personas con el rol especificado']);
    }
}
?>