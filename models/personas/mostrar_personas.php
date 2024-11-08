<?php
include_once(__DIR__ . '/../../config/conexion.php');

class MostrarPersonas {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerPersonas() {
        $sql = "SELECT cedula, apellidos, nombres, direccion, telefono, correo, rol FROM escuela.personas";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function mostrarTablaPersonas() {
        $personas = $this->obtenerPersonas();
        echo '<div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="card shadow">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">Lista de Personas</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="tablaPersonas" class="table table-bordered table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Cédula</th>
                                                <th>Apellidos</th>
                                                <th>Nombres</th>
                                                <th>Dirección</th>
                                                <th>Teléfono</th>
                                                <th>Correo</th>
                                                <th>Rol</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
        if (empty($personas)) {
            echo '<tr><td colspan="7" class="text-center">No hay personas disponibles.</td></tr>';
        } else {
            foreach ($personas as $persona) {
                echo '<tr>
                        <td>' . htmlspecialchars($persona['cedula']) . '</td>
                        <td>' . htmlspecialchars($persona['apellidos']) . '</td>
                        <td>' . htmlspecialchars($persona['nombres']) . '</td>
                        <td>' . htmlspecialchars($persona['direccion']) . '</td>
                        <td>' . htmlspecialchars($persona['telefono']) . '</td>
                        <td>' . htmlspecialchars($persona['correo']) . '</td>
                        <td>' . htmlspecialchars($persona['rol']) . '</td>
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
}
?>