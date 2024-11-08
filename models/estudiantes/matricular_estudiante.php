<?php
include_once(__DIR__ . '/../../config/conexion.php');

class MatricularEstudiante {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function insertarMatricula($datosEstudiante, $datosMadre, $datosPadre) {
        try {
            $this->pdo->beginTransaction();

            // Insertar datos del estudiante
            $sqlEstudiante = "INSERT INTO escuela.estudiantes (id_persona, paralelo, codigo_unico, condicion, tipo_discapacidad, porcentaje_discapacidad, carnet_discapacidad, imagen) 
                              VALUES (:id_persona, :paralelo, :codigo_unico, :condicion, :tipo_discapacidad, :porcentaje_discapacidad, :carnet_discapacidad, :imagen)";
            $stmtEstudiante = $this->pdo->prepare($sqlEstudiante);
            $stmtEstudiante->execute($datosEstudiante);

            // Insertar datos de la madre
            $sqlMadre = "INSERT INTO escuela.madres (id_persona, ocupacion, telefono, correo) 
                         VALUES (:id_persona, :ocupacion, :telefono, :correo)";
            $stmtMadre = $this->pdo->prepare($sqlMadre);
            $stmtMadre->execute($datosMadre);

            // Insertar datos del padre
            $sqlPadre = "INSERT INTO escuela.padres (id_persona, ocupacion, telefono, correo) 
                         VALUES (:id_persona, :ocupacion, :telefono, :correo)";
            $stmtPadre = $this->pdo->prepare($sqlPadre);
            $stmtPadre->execute($datosPadre);

            $this->pdo->commit();
            return true;
        } catch (Exception $e) {
            $this->pdo->rollBack();
            return false;
        }
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $pdo = conectarBaseDeDatos();
    $matricularEstudiante = new MatricularEstudiante($pdo);

    // Manejar la carga de la imagen
    $imagen = $_FILES['imagen']['name'];
    $imagenTmp = $_FILES['imagen']['tmp_name'];
    $imagenPath = __DIR__ . '/../../uploads/' . $imagen;
    move_uploaded_file($imagenTmp, $imagenPath);

    // Datos del estudiante
    $datosEstudiante = [
        ':id_persona' => $_POST['id_persona_estudiante'],
        ':paralelo' => $_POST['id_paralelo_estudiante'],
        ':codigo_unico' => $_POST['codigo_unico_estudiante'],
        ':condicion' => $_POST['condicion_estudiante'],
        ':tipo_discapacidad' => $_POST['tipo_discapacidad'],
        ':porcentaje_discapacidad' => $_POST['porcentaje_discapacidad'],
        ':carnet_discapacidad' => $_POST['carnet_discapacidad'],
        ':imagen' => $imagen
    ];

    // Datos de la madre
    $datosMadre = [
        ':id_persona' => $_POST['id_persona_mama'],
        ':ocupacion' => $_POST['ocupacion_mama'],
        ':telefono' => $_POST['telefono_mama'],
        ':correo' => $_POST['correo_mama']
    ];

    // Datos del padre
    $datosPadre = [
        ':id_persona' => $_POST['id_persona_papa'],
        ':ocupacion' => $_POST['ocupacion_papa'],
        ':telefono' => $_POST['telefono_papa'],
        ':correo' => $_POST['correo_papa']
    ];

    if ($matricularEstudiante->insertarMatricula($datosEstudiante, $datosMadre, $datosPadre)) {
        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error']);
    }
}
?>