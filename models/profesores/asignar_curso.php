<?php
include_once(__DIR__ . '/../../config/conexion.php');

class AsignarCurso {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerParalelos() {
        $sql = "SELECT * FROM escuela.paralelos";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function asignarCursoAProfesor($idProfesor, $idParalelo) {
        $sql = "UPDATE escuela.profesores SET id_paralelo = :idParalelo WHERE id_persona = :idProfesor";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':idParalelo', $idParalelo, PDO::PARAM_INT);
        $stmt->bindParam(':idProfesor', $idProfesor, PDO::PARAM_INT);
        return $stmt->execute();
    }
}
?>