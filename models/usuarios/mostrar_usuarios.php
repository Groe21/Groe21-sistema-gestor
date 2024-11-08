<?php
include_once(__DIR__ . '/../../config/conexion.php');

class Usuario {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function obtenerUsuarios() {
        $sql = "SELECT p.nombres, p.apellidos, u.username FROM escuela.usuarios u
                JOIN escuela.personas p ON u.id_persona = p.id_persona";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function mostrarTablaUsuarios() {
        $usuarios = $this->obtenerUsuarios();
        echo '<div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-12"> <!-- Ajusta el ancho de la columna -->
                        <div class="card shadow">
                            <div class="card-header bg-primary text-white">
                                <h4 class="mb-0">Lista de Usuarios</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="tablaUsuarios" class="table table-bordered table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Usuario</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
        foreach ($usuarios as $usuario) {
            echo '<tr>
                    <td>' . htmlspecialchars($usuario['nombres']) . '</td>
                    <td>' . htmlspecialchars($usuario['apellidos']) . '</td>
                    <td>' . htmlspecialchars($usuario['username']) . '</td>
                  </tr>';
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