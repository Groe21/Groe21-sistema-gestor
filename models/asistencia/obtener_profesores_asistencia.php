<?php
include_once(__DIR__ . '/../../config/conexion.php');

class ListadoProfesores {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerProfesores($id_periodo) {
        $sql = "SELECT 
                    p.nombre AS nombre_profesor,
                    pa.nombre_paralelo AS curso,
                    p.id_profesor
                FROM 
                    escuela.profesores p
                LEFT JOIN 
                    escuela.asignaciones a ON p.id_profesor = a.id_profesor
                LEFT JOIN 
                    escuela.paralelos pa ON a.id_paralelo = pa.id_paralelo
                WHERE 
                    p.id_periodo = :id_periodo
                ORDER BY 
                    p.nombre";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':id_periodo', $id_periodo, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function obtenerEstudiantesPorCurso($id_paralelo, $id_periodo) {
        $sql = "SELECT 
                    CONCAT(e.nombres, ' ', e.apellidos) AS nombre_completo
                FROM 
                    escuela.estudiantes e
                WHERE 
                    e.id_paralelo = :id_paralelo
                AND 
                    e.id_periodo = :id_periodo
                ORDER BY 
                    e.apellidos, e.nombres";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':id_paralelo', $id_paralelo, PDO::PARAM_INT);
        $stmt->bindParam(':id_periodo', $id_periodo, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function mostrarTablaProfesores($id_periodo) {
        $profesores = $this->obtenerProfesores($id_periodo);
        echo '<div class="container-fluid mt-5">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="card shadow">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">Lista de Profesores</h4>
                                <form method="GET" action="" class="form-inline">
                                    <div class="form-group mb-0">
                                        <label for="id_periodo" class="mr-2">Periodo:</label>
                                        ' . $this->generarSelectPeriodos() . '
                                    </div>
                                    <button type="submit" class="btn btn-secondary btn-sm ml-2">Filtrar</button>
                                </form>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="tablaProfesores" class="table table-bordered table-striped w-100">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Nombre Profesor</th>
                                                <th>Curso</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
        if (empty($profesores)) {
            echo '<tr><td colspan="3" class="text-center">No hay profesores disponibles en este periodo.</td></tr>';
        } else {
            foreach ($profesores as $profesor) {
                echo '<tr>
                        <td>' . htmlspecialchars($profesor['nombre_profesor']) . '</td>
                        <td>' . htmlspecialchars($profesor['curso']) . '</td>
                        <td class="text-center">
                            <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal" data-id-profesor="' . htmlspecialchars($profesor['id_profesor']) . '" data-id-paralelo="' . htmlspecialchars($profesor['curso']) . '">
                                <i class="fas fa-info-circle"></i> Ver
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
                </div>
              </div>';
    }

    private function generarSelectPeriodos() {
        $periodos = $this->obtenerPeriodos();
        $html = '<select class="form-control" id="id_periodo" name="id_periodo">';
        $html .= '<option value="">Seleccione un periodo</option>';
        foreach ($periodos as $periodo) {
            $html .= '<option value="' . $periodo['id_periodo'] . '">' . $periodo['nombre_periodo'] . '</option>';
        }
        $html .= '</select>';
        return $html;
    }

    private function obtenerPeriodos() {
        $sql = "SELECT * FROM escuela.periodos_lectivos";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>