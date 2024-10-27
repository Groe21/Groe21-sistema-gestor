<?php
class Estudiante {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerEstudiantesInactivos() {
        $sql = "SELECT COUNT(DISTINCT e.Id) AS total_estudiantes
                FROM estudiante e
                JOIN matricula m ON e.Id=m.id_estudiante
                JOIN periodo p on p.Id=m.id_periodo
                WHERE e.estado = 0 AND p.estado = 1 AND e.foto IS NOT NULL;";
        $result = $this->conn->query($sql);
        return $result->fetch(PDO::FETCH_ASSOC)['total_estudiantes'];
    }

    public function obtenerEstudiantesActivos() {
        $sql = "SELECT COUNT(DISTINCT e.Id) AS total_estudiantes
                FROM estudiante e
                JOIN matricula m ON e.Id=m.id_estudiante
                JOIN periodo p on p.Id=m.id_periodo
                WHERE e.estado = 1 AND p.estado = 1 AND e.foto IS NOT NULL;";
        $result = $this->conn->query($sql);
        return $result->fetch(PDO::FETCH_ASSOC)['total_estudiantes'];
    }

    public function obtenerTotalEstudiantes() {
        $sql = "SELECT COUNT(DISTINCT e.Id) AS total_estudiantes
                FROM estudiante e
                JOIN matricula m ON e.Id=m.id_estudiante
                JOIN periodo p on p.Id=m.id_periodo
                WHERE p.estado = 1 AND e.foto IS NOT NULL;";
        $result = $this->conn->query($sql);
        return $result->fetch(PDO::FETCH_ASSOC)['total_estudiantes'];
    }
}

class ObtenerEstudiantes {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerEstudiantes() {
        $sql = "SELECT 
                e.id,
                e.cedula,
                e.nombres,
                e.apellidos,
                e.direccion,
                CASE WHEN e.condicion = 1 THEN 'SI' ELSE 'NO' END AS discapacidad,
                p.cedula AS p_cedula,
                p.apellidos_nombres,
                p.telefono
                FROM estudiante e
                JOIN persona p ON e.Id = p.id_estudiante
                JOIN rol r ON p.Id = r.id_persona
                WHERE r.rol = 'representante' AND e.foto IS NULL;";
        $result = $this->conn->query($sql);
        if (!$result) {
            throw new Exception("Error al obtener los datos: " . $this->conn->errorInfo()[2]);
        }
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>