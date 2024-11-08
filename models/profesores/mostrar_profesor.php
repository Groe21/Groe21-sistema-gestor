<?php
include_once(__DIR__ . '/../../config/conexion.php');

class ObtenerProfesor {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerProfesores() {
        $sql = "SELECT p.id_persona, p.nombres, p.apellidos, pa.nombre_paralelo
                FROM escuela.personas p
                LEFT JOIN escuela.asignaciones a ON p.id_persona = a.id_profesor
                LEFT JOIN escuela.paralelos pa ON a.id_paralelo = pa.id_paralelo
                WHERE p.rol = 'profesor'";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function obtenerParalelos() {
        $sql = "SELECT * FROM escuela.paralelos";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function asignarCursoAProfesor($idProfesor, $idParalelo) {
        $sql = "INSERT INTO escuela.asignaciones (id_profesor, id_paralelo) VALUES (:idProfesor, :idParalelo)
                ON CONFLICT (id_profesor, id_paralelo) DO NOTHING";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':idParalelo', $idParalelo, PDO::PARAM_INT);
        $stmt->bindParam(':idProfesor', $idProfesor, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function mostrarTablaProfesores() {
        $profesores = $this->obtenerProfesores();
        echo '<div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="card shadow">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">Lista de Profesores</h4>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Curso</th>
                                            <th class="text-center">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>';
        if (empty($profesores)) {
            echo '<tr><td colspan="4" class="text-center">No hay profesores disponibles.</td></tr>';
        } else {
            foreach ($profesores as $profesor) {
                echo '<tr>
                        <td>' . htmlspecialchars($profesor['nombres']) . '</td>
                        <td>' . htmlspecialchars($profesor['apellidos']) . '</td>
                        <td>' . ($profesor['nombre_paralelo'] ? htmlspecialchars($profesor['nombre_paralelo']) : '<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#asignarCursoModal" data-id="' . htmlspecialchars($profesor['id_persona']) . '"><i class="fas fa-plus"></i> Asignar Curso</button>') . '</td>
                        <td class="text-center">
                            <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editarProfesorModal" data-id="' . htmlspecialchars($profesor['id_persona']) . '" data-nombre="' . htmlspecialchars($profesor['nombres']) . '" data-apellido="' . htmlspecialchars($profesor['apellidos']) . '">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                      </tr>';
            }
        }
        echo '              </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
              </div>';
    }
}
?>