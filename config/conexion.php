<?php
function conectarBaseDeDatos()
{
    $host = 'localhost';
    $port = '5432'; // Puerto por defecto de PostgreSQL
    $dbname = 'aguilas_del_saber'; // Nombre de la base de datos PostgreSQL
    $user = 'postgres'; // Nombre de usuario de PostgreSQL
    $password = '12345'; // Contraseña de PostgreSQL

    // Conexión a la base de datos
    try {
        $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $password);
        // Configuración para manejar errores y excepciones de PDO
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
    } catch (PDOException $e) {
        echo "Error de conexión: " . $e->getMessage();
        exit(); // Si hay un error, termina el script
    }
    return $pdo;
}

// Ejemplo de cómo llamar a la función
$conexion = conectarBaseDeDatos();
?>
