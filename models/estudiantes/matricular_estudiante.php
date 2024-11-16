<?php
include_once(__DIR__ . '/../../config/conexion.php');

class MatricularEstudiante {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function insertarMatricula($datos) {
        try {
            $this->pdo->beginTransaction();

            // Insertar datos del estudiante
            $sqlEstudiante = "INSERT INTO escuela.estudiantes (
                id_persona, paralelo, codigo_unico, condicion, tipo_discapacidad, 
                porcentaje_discapacidad, carnet_discapacidad, imagen, id_periodo
            ) VALUES (
                :id_persona, :paralelo, :codigo_unico, :condicion, :tipo_discapacidad, 
                :porcentaje_discapacidad, :carnet_discapacidad, :imagen, :id_periodo
            )";
            $stmtEstudiante = $this->pdo->prepare($sqlEstudiante);
            $stmtEstudiante->execute([
                ':id_persona' => $datos[':id_persona'],
                ':paralelo' => $datos[':paralelo'],
                ':codigo_unico' => $datos[':codigo_unico'],
                ':condicion' => $datos[':condicion'],
                ':tipo_discapacidad' => $datos[':tipo_discapacidad'],
                ':porcentaje_discapacidad' => $datos[':porcentaje_discapacidad'],
                ':carnet_discapacidad' => $datos[':carnet_discapacidad'],
                ':imagen' => $datos[':imagen'],
                ':id_periodo' => $datos[':id_periodo']
            ]);

            // Insertar datos de la madre
            $sqlMadre = "INSERT INTO escuela.madres (
                id_persona, ocupacion, telefono, correo
            ) VALUES (
                :id_persona_mama, :ocupacion_mama, :telefono_mama, :correo_mama
            )";
            $stmtMadre = $this->pdo->prepare($sqlMadre);
            $stmtMadre->execute([
                ':id_persona_mama' => $datos[':id_persona_mama'],
                ':ocupacion_mama' => $datos[':ocupacion_mama'],
                ':telefono_mama' => $datos[':telefono_mama'],
                ':correo_mama' => $datos[':correo_mama']
            ]);

            // Insertar datos del padre
            $sqlPadre = "INSERT INTO escuela.padres (
                id_persona, ocupacion, telefono, correo
            ) VALUES (
                :id_persona_papa, :ocupacion_papa, :telefono_papa, :correo_papa
            )";
            $stmtPadre = $this->pdo->prepare($sqlPadre);
            $stmtPadre->execute([
                ':id_persona_papa' => $datos[':id_persona_papa'],
                ':ocupacion_papa' => $datos[':ocupacion_papa'],
                ':telefono_papa' => $datos[':telefono_papa'],
                ':correo_papa' => $datos[':correo_papa']
            ]);

            $this->pdo->commit();
            return true;
        } catch (Exception $e) {
            $this->pdo->rollBack();
            error_log($e->getMessage()); // Log the error message
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

    // Verificar si la carpeta uploads existe, si no, crearla
    if (!file_exists(__DIR__ . '/../../uploads')) {
        mkdir(__DIR__ . '/../../uploads', 0777, true);
    }

    if (move_uploaded_file($imagenTmp, $imagenPath)) {
        // Datos para la inserción
        $datos = [
            ':id_persona' => $_POST['id_persona_estudiante'],
            ':paralelo' => $_POST['id_paralelo_estudiante'],
            ':codigo_unico' => $_POST['codigo_unico_estudiante'],
            ':condicion' => $_POST['condicion_estudiante'],
            ':tipo_discapacidad' => isset($_POST['tipo_discapacidad']) ? $_POST['tipo_discapacidad'] : null,
            ':porcentaje_discapacidad' => isset($_POST['porcentaje_discapacidad']) ? $_POST['porcentaje_discapacidad'] : null,
            ':carnet_discapacidad' => isset($_POST['carnet_discapacidad']) ? $_POST['carnet_discapacidad'] : null,
            ':imagen' => $imagen,
            ':id_periodo' => $_POST['id_periodo'],
            ':id_persona_mama' => $_POST['id_persona_mama'],
            ':ocupacion_mama' => $_POST['ocupacion_mama'],
            ':telefono_mama' => $_POST['telefono_mama'],
            ':correo_mama' => $_POST['correo_mama'],
            ':id_persona_papa' => $_POST['id_persona_papa'],
            ':ocupacion_papa' => $_POST['ocupacion_papa'],
            ':telefono_papa' => $_POST['telefono_papa'],
            ':correo_papa' => $_POST['correo_papa']
        ];

        if ($matricularEstudiante->insertarMatricula($datos)) {
            echo json_encode(['status' => 'success']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Error al insertar la matrícula']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Error al subir la imagen']);
    }
}
?>