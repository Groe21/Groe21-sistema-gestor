<?php
include_once(__DIR__ . '/../../config/conexion.php');
session_start();

try {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $conn = conectarBaseDeDatos();
        $conn->beginTransaction();
        $usuario = $_SESSION['nombre'];

        // Datos del estudiante
        $estudianteData = [
            'cedula' => $_POST['cedula_estudiante'],
            'apellidos' => $_POST['apellidos_estudiante'],
            'nombres' => $_POST['nombres_estudiante'],
            'lugar_nacimiento' => $_POST['lugar_nacimiento_estudiante'],
            'residencia' => $_POST['residencia_estudiante'],
            'direccion' => $_POST['direccion_estudiante'],
            'sector' => $_POST['sector_estudiante'],
            'fecha_nacimiento' => $_POST['fecha_nacimiento_estudiante'],
            'codigo_unico' => $_POST['codigo_unico_estudiante'],
            'condicion' => $_POST['condicion_estudiante'],
            'foto' => procesarImagen($_FILES["imagen"]["tmp_name"]),
            'created_by' => $usuario
        ];

        // Insertar estudiante
        $idEstudiante = insertarEstudiante($conn, $estudianteData);

        // Insertar matrícula
        $matriculaData = [
            'id_estudiante' => $idEstudiante,
            'id_grado' => $_POST['grado'],
            'id_paralelo' => $_POST['id_paralelo_estudiante']
        ];
        insertarMatricula($conn, $matriculaData);

        // Insertar discapacidad si aplica
        if ($estudianteData['condicion'] == 1) {
            $discapacidadData = [
                'tipo' => $_POST['tipo_discapacidad'],
                'porcentaje' => $_POST['porcentaje_discapacidad'],
                'carnet' => $_POST['carnet_discapacidad'],
                'id_estudiante' => $idEstudiante
            ];
            insertarDiscapacidad($conn, $discapacidadData);
        }

        // Insertar datos de los padres y representante
        $roles = ['Padre' => 'papa', 'Madre' => 'mama', 'Representante' => 'representante'];
        foreach ($roles as $rol => $prefix) {
            $personaData = [
                'cedula' => $_POST["cedula_$prefix"],
                'apellidos_nombres' => $_POST["apellidos_nombres_$prefix"],
                'direccion' => $_POST["direccion_$prefix"],
                'ocupacion' => $_POST["ocupacion_$prefix"],
                'telefono' => $_POST["telefono_$prefix"],
                'correo' => $_POST["correo_$prefix"],
                'foto' => procesarImagen($_FILES["imagen_$prefix"]["tmp_name"]),
                'id_estudiante' => $idEstudiante,
                'created_by' => $usuario
            ];
            $idPersona = insertarPersona($conn, $personaData);
            insertarRol($conn, $idPersona, $rol);
        }

        $conn->commit();

        echo '<script>
            Swal.fire({
                title: "Éxito",
                text: "Los datos se han guardado correctamente.",
                icon: "success",
                confirmButtonText: "Aceptar",
                showCancelButton: false
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "../administracion/estudiantes.php";
                }
            });
        </script>';
    }
} catch (Exception $e) {
    $conn->rollBack();
    echo "Error: " . $e->getMessage();
}
$conn = null;

function procesarImagen($imagePath) {
    $originalImage = imagecreatefromstring(file_get_contents($imagePath));
    $newImage = imagecreatetruecolor(148, 178);
    imagecopyresampled($newImage, $originalImage, 0, 0, 0, 0, 148, 178, imagesx($originalImage), imagesy($originalImage));
    ob_start();
    imagejpeg($newImage, NULL, 100);
    $newImageContent = ob_get_contents();
    ob_end_clean();
    imagedestroy($originalImage);
    imagedestroy($newImage);
    return $newImageContent;
}

function insertarEstudiante($conn, $data) {
    $sql = "INSERT INTO estudiante (cedula, apellidos, nombres, lugar_nacimiento, residencia, direccion, sector, fecha_nacimiento, foto, codigo_unico, condicion, created_by)
            VALUES (:cedula, :apellidos, :nombres, :lugar_nacimiento, :residencia, :direccion, :sector, :fecha_nacimiento, :foto, :codigo_unico, :condicion, :created_by)";
    $stmt = $conn->prepare($sql);
    $stmt->execute($data);
    return $conn->lastInsertId();
}

function insertarMatricula($conn, $data) {
    $idPeriodo = $conn->query("SELECT id FROM periodo WHERE estado = 1")->fetch(PDO::FETCH_ASSOC)['id'];
    $ultimoNumeroMatricula = $conn->query("SELECT MAX(numero) as ultimo_numero FROM matricula")->fetch(PDO::FETCH_ASSOC)['ultimo_numero'];
    $nuevoNumeroMatricula = $ultimoNumeroMatricula + 1;

    $sql = "INSERT INTO matricula (numero, id_estudiante, id_periodo, id_grado, id_paralelo)
            VALUES (:numeroMatricula, :id_estudiante, :idPeriodo, :id_grado, :id_paralelo)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        'numeroMatricula' => $nuevoNumeroMatricula,
        'id_estudiante' => $data['id_estudiante'],
        'idPeriodo' => $idPeriodo,
        'id_grado' => $data['id_grado'],
        'id_paralelo' => $data['id_paralelo']
    ]);
}

function insertarDiscapacidad($conn, $data) {
    $sql = "INSERT INTO discapacidad (tipo, porcentaje, carnet, id_estudiante)
            VALUES (:tipo, :porcentaje, :carnet, :id_estudiante)";
    $stmt = $conn->prepare($sql);
    $stmt->execute($data);
}

function insertarPersona($conn, $data) {
    $sql = "INSERT INTO persona (cedula, apellidos_nombres, direccion, ocupacion, telefono, correo, foto, id_estudiante, created_by)
            VALUES (:cedula, :apellidos_nombres, :direccion, :ocupacion, :telefono, :correo, :foto, :id_estudiante, :created_by)";
    $stmt = $conn->prepare($sql);
    $stmt->execute($data);
    return $conn->lastInsertId();
}

function insertarRol($conn, $idPersona, $rol) {
    $sql = "INSERT INTO rol (id_persona, rol) VALUES (:id_persona, :rol)";
    $stmt = $conn->prepare($sql);
    $stmt->execute(['id_persona' => $idPersona, 'rol' => $rol]);
}
?>