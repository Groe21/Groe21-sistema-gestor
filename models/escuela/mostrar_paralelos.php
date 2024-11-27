<?php
include_once(__DIR__ . '/../../config/conexion.php');

class MostrarParalelos {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerParalelos() {
        try {
            $sql = "SELECT * FROM escuela.paralelos";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Error al obtener paralelos: " . $e->getMessage());
            return [];
        }
    }

    public function mostrarTablaParalelos() {
        try {
            $paralelos = $this->obtenerParalelos();
            echo '<div class="container-fluid mt-5"> <!-- Cambiar a container-fluid para ocupar todo el ancho -->
                    <div class="row justify-content-center">
                        <div class="col-12"> <!-- Ajuste de ancho de la columna -->
                            <div class="card shadow">
                                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                    <h4 class="mb-0">Lista de Cursos</h4>
                                    <button class="btn btn-success" data-toggle="modal" data-target="#crearCursoModal">
                                        <i class="fas fa-plus"></i> Crear Curso
                                    </button>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive"> <!-- Añadir clase table-responsive -->
                                        <table class="table table-bordered table-striped w-100"> <!-- Añadir clase w-100 para ocupar todo el ancho -->
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>Nombre del Curso</th>
                                                    <th class="text-center">Acciones</th> <!-- Centrar el encabezado -->
                                                </tr>
                                            </thead>
                                            <tbody>';
            if (empty($paralelos)) {
                echo '<tr><td colspan="2" class="text-center">No hay cursos disponibles.</td></tr>';
            } else {
                foreach ($paralelos as $paralelo) {
                    echo '<tr>
                            <td>' . htmlspecialchars($paralelo['nombre_paralelo']) . '</td>
                            <td class="text-center"> <!-- Centrar el contenido de la celda -->
                                <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editarCursoModal" data-id="' . htmlspecialchars($paralelo['id_paralelo']) . '" data-nombre="' . htmlspecialchars($paralelo['nombre_paralelo']) . '">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#eliminarCursoModal" data-id="' . htmlspecialchars($paralelo['id_paralelo']) . '">
                                    <i class="fas fa-trash"></i>
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
        } catch (Exception $e) {
            error_log("Error al mostrar la tabla de paralelos: " . $e->getMessage());
            echo '<div class="alert alert-danger" role="alert">Ocurrió un error al mostrar los cursos.</div>';
        }
    }
}
?>