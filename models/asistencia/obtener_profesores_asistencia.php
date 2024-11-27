<?php
include_once(__DIR__ . '/../../config/conexion.php');

class ListadoProfesores {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerEstudiantesConAsistencia($id_periodo, $id_paralelo, $fechas) {
        $sql = "SELECT 
                    e.id_estudiante,
                    e.nombres,
                    e.apellidos,
                    a_lunes.id_asistencia AS asistencia_lunes,
                    a_martes.id_asistencia AS asistencia_martes,
                    a_miercoles.id_asistencia AS asistencia_miercoles,
                    a_jueves.id_asistencia AS asistencia_jueves,
                    a_viernes.id_asistencia AS asistencia_viernes
                FROM 
                    escuela.estudiantes e
                LEFT JOIN 
                    escuela.asistencia a_lunes ON e.id_estudiante = a_lunes.id_estudiante AND a_lunes.fecha = :fecha_lunes
                LEFT JOIN 
                    escuela.asistencia a_martes ON e.id_estudiante = a_martes.id_estudiante AND a_martes.fecha = :fecha_martes
                LEFT JOIN 
                    escuela.asistencia a_miercoles ON e.id_estudiante = a_miercoles.id_estudiante AND a_miercoles.fecha = :fecha_miercoles
                LEFT JOIN 
                    escuela.asistencia a_jueves ON e.id_estudiante = a_jueves.id_estudiante AND a_jueves.fecha = :fecha_jueves
                LEFT JOIN 
                    escuela.asistencia a_viernes ON e.id_estudiante = a_viernes.id_estudiante AND a_viernes.fecha = :fecha_viernes
                WHERE 
                    e.id_periodo = :id_periodo";
        
        if ($id_paralelo !== null) {
            $sql .= " AND e.id_paralelo = :id_paralelo";
        }

        $sql .= " ORDER BY e.apellidos, e.nombres";

        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':id_periodo', $id_periodo, PDO::PARAM_INT);
        $stmt->bindParam(':fecha_lunes', $fechas['lunes'], PDO::PARAM_STR);
        $stmt->bindParam(':fecha_martes', $fechas['martes'], PDO::PARAM_STR);
        $stmt->bindParam(':fecha_miercoles', $fechas['miercoles'], PDO::PARAM_STR);
        $stmt->bindParam(':fecha_jueves', $fechas['jueves'], PDO::PARAM_STR);
        $stmt->bindParam(':fecha_viernes', $fechas['viernes'], PDO::PARAM_STR);
        
        if ($id_paralelo !== null) {
            $stmt->bindParam(':id_paralelo', $id_paralelo, PDO::PARAM_INT);
        }

        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function mostrarTablaEstudiantesConAsistencia($id_periodo, $id_paralelo) {
        $fechas = $this->obtenerFechasSemana();
        $estudiantes = $this->obtenerEstudiantesConAsistencia($id_periodo, $id_paralelo, $fechas);
        echo '<div class="container-fluid mt-5">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="card shadow">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">Estudiantes con Asistencia</h4>
                                <form method="GET" action="" class="form-inline">
                                    <div class="form-group mb-0">
                                        <label for="id_periodo" class="mr-2">Periodo:</label>
                                        ' . $this->generarSelectPeriodos($id_periodo) . '
                                    </div>
                                    <div class="form-group mb-0 ml-3">
                                        <label for="id_paralelo" class="mr-2">Paralelo:</label>
                                        ' . $this->generarSelectParalelos($id_paralelo) . '
                                    </div>
                                    <button type="submit" class="btn btn-secondary btn-sm ml-2">Filtrar</button>
                                </form>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="tablaEstudiantes" class="table table-bordered table-striped w-100">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Nombre Estudiante</th>
                                                <th>Lunes</th>
                                                <th>Martes</th>
                                                <th>Miércoles</th>
                                                <th>Jueves</th>
                                                <th>Viernes</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
        if (empty($estudiantes)) {
            echo '<tr><td colspan="7" class="text-center">No hay estudiantes en este periodo.</td></tr>';
        } else {
            foreach ($estudiantes as $estudiante) {
                echo '<tr>
                        <td>' . htmlspecialchars($estudiante['nombres'] . ' ' . $estudiante['apellidos']) . '</td>';
                foreach (['lunes', 'martes', 'miercoles', 'jueves', 'viernes'] as $dia) {
                    echo '<td class="text-center">';
                    if ($estudiante['asistencia_' . $dia] == null) {
                        echo '<button class="btn btn-success btn-sm" onclick="darAsistencia(' . htmlspecialchars($estudiante['id_estudiante']) . ', \'' . $fechas[$dia] . '\')">
                                <i class="fas fa-check"></i> Dar Asistencia
                              </button>';
                    } else {
                        echo 'Sí';
                    }
                    echo '</td>';
                }
                echo '  <td class="text-center">
                            <button class="btn btn-info btn-sm">
                                <i class="fas fa-file-pdf"></i> PDF
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

    private function obtenerFechasSemana() {
        $fechas = [];
        $inicioSemana = strtotime('last monday', strtotime('tomorrow'));
        $fechas['lunes'] = date('Y-m-d', $inicioSemana);
        $fechas['martes'] = date('Y-m-d', strtotime('+1 day', $inicioSemana));
        $fechas['miercoles'] = date('Y-m-d', strtotime('+2 days', $inicioSemana));
        $fechas['jueves'] = date('Y-m-d', strtotime('+3 days', $inicioSemana));
        $fechas['viernes'] = date('Y-m-d', strtotime('+4 days', $inicioSemana));
        return $fechas;
    }

    private function generarSelectPeriodos($selected_periodo = null) {
        $periodos = $this->obtenerPeriodos();
        $html = '<select class="form-control" id="id_periodo" name="id_periodo">';
        $html .= '<option value="">Seleccione un periodo</option>';
        foreach ($periodos as $periodo) {
            $selected = ($selected_periodo == $periodo['id_periodo']) ? 'selected' : '';
            $html .= '<option value="' . $periodo['id_periodo'] . '" ' . $selected . '>' . $periodo['nombre_periodo'] . '</option>';
        }
        $html .= '</select>';
        return $html;
    }

    private function generarSelectParalelos($selected_paralelo = null) {
        $paralelos = $this->obtenerParalelos();
        $html = '<select class="form-control" id="id_paralelo" name="id_paralelo">';
        $html .= '<option value="">Seleccione un paralelo</option>';
        foreach ($paralelos as $paralelo) {
            $selected = ($selected_paralelo == $paralelo['id_paralelo']) ? 'selected' : '';
            $html .= '<option value="' . $paralelo['id_paralelo'] . '" ' . $selected . '>' . $paralelo['nombre_paralelo'] . '</option>';
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

    private function obtenerParalelos() {
        $sql = "SELECT * FROM escuela.paralelos";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>