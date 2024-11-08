<?php
include_once(__DIR__ . '/../../config/conexion.php');

class ObtenerProfesor {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerPersonasConRolProfesor() {
        $sql = "SELECT id_persona, nombres, apellidos FROM obtener_profesores()";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function insertarProfesor($id_persona, $id_paralelo, $especialidad) {
        $sql = "INSERT INTO escuela.profesores (id_persona, id_paralelo, especialidad) 
                VALUES (:id_persona, :id_paralelo, :especialidad)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':id_persona' => $id_persona,
            ':id_paralelo' => $id_paralelo,
            ':especialidad' => $especialidad
        ]);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_persona = $_POST['id_persona'];
    $id_paralelo = $_POST['id_paralelo'];
    $especialidad = $_POST['especialidad'];

    $pdo = conectarBaseDeDatos();
    $profesor = new ObtenerProfesor($pdo);
    $profesor->insertarProfesor($id_persona, $id_paralelo, $especialidad);

    header('Location: ../../views/profesores/mostrar_profesores.php');
    exit();
}
?>