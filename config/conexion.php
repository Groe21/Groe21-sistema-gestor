<?php
function conectarBaseDeDatos()
{
    $host = 'localhost';
    $port = '3306'; // Puerto por defecto de MySQL
    $dbname = 'arias'; // Nombre de la base de datos MySQL
    $user = 'root'; // Nombre de usuario de MySQL
    $password = ''; // Contraseña de MySQL

    // Conexión a la base de datos
    try {
        $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $password);
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
