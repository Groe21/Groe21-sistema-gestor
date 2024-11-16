<?php
include_once(__DIR__ . '/../../config/conexion.php');

class BuscarPersona {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function buscarPorRol($tipo) {
        $sql = "SELECT id_persona, cedula, nombres, apellidos, direccion, correo FROM escuela.personas WHERE rol = :tipo";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':tipo' => $tipo]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $tipo = $_POST['tipo'];

    $pdo = conectarBaseDeDatos();
    $buscarPersona = new BuscarPersona($pdo);
    $personas = $buscarPersona->buscarPorRol($tipo);

    if ($personas) {
        foreach ($personas as $persona) {
            echo '<tr>';
            echo '<td>' . $persona['cedula'] . '</td>';
            echo '<td>' . $persona['nombres'] . '</td>';
            echo '<td>' . $persona['apellidos'] . '</td>';
            echo '<td>' . $persona['direccion'] . '</td>';
            echo '<td>' . $persona['correo'] . '</td>';
            echo '<td><button type="button" class="btn btn-primary btn-sm" onclick="seleccionarPersona(' . $persona['id_persona'] . ', \'' . $persona['cedula'] . '\', \'' . $persona['nombres'] . '\', \'' . $persona['apellidos'] . '\', \'' . $persona['direccion'] . '\', \'' . $persona['correo'] . '\', \'' . $tipo . '\')">Seleccionar</button></td>';
            echo '</tr>';
        }
    } else {
        echo '<tr><td colspan="6">No se encontraron personas con el rol especificado</td></tr>';
    }
}
?>