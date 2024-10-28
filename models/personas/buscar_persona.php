<?php
include_once(__DIR__ . '/../../config/conexion.php');

class BuscarPersona {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function buscarPorCedula($cedula) {
        $sql = "SELECT id_persona, cedula, nombres, apellidos FROM escuela.personas WHERE cedula = :cedula";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':cedula' => $cedula]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $cedula = $_POST['cedula'];

    $pdo = conectarBaseDeDatos();
    $buscarPersona = new BuscarPersona($pdo);
    $persona = $buscarPersona->buscarPorCedula($cedula);

    if ($persona) {
        echo json_encode($persona);
    } else {
        echo json_encode(['error' => 'Persona no encontrada']);
    }
}
?>