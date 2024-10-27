<?php
session_start();
include_once ('config/conexion.php');
include_once ('models/usuarios/roles.php');
// Incluye la clase Estudiante
include_once('models/estudiantes/obtener_estudiantes.php');

// Crea una instancia de la clase Estudiante
$estudiante = new Estudiante($conexion);

// Obtiene los datos de estudiantes
$totalInactivos = $estudiante->obtenerEstudiantesInactivos();
$totalActivos = $estudiante->obtenerEstudiantesActivos();
$totalEstudiantes = $estudiante->obtenerTotalEstudiantes();

// Crear una instancia de la clase ObtenerEstudiantes
$estudiante = new ObtenerEstudiantes($conexion);
try {
    // Obtener los datos de los estudiantes
    $estudiantes = $estudiante->obtenerEstudiantes();
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
    exit;
}


?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Principal</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <link rel="icon" href="img/logo23.ico" type="image/x-icon">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Barra lateral -->
        <?php include_once ('include\barra_lateral.php'); ?>
        <!-- Fin de la barra lateral -->

        <!-- Contenedor de contenido -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Contenido principal -->
            <div id="content">

            <!-- Barra superior -->
            <?php include_once ('include\barra_superior.php'); ?>
            <!-- Fin de la barra superior -->

            <!-- Comienzo del contenido de la página -->
            <div class="container-fluid">

                <!-- Encabezado de la página -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Principal</h1>
                </div>

                <!-- Fila de contenido -->
                <div class="row">

                    <!-- Tarjeta de estudiantes inactivos -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Estudiantes Inactivos
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo $totalInactivos; ?></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-user-slash fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tarjeta de estudiantes activos -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Estudiantes Activos
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo $totalActivos; ?></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-user-check fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tarjeta de total de estudiantes -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            Total Estudiantes
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo $totalEstudiantes; ?></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-users fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Fila de la tabla de estudiantes -->
                <div class="row justify-content-center">
                    <div class="col-xl-10 col-lg-12">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Lista de Estudiantes</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                     <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>N°</th>
                                                <th>Cedula</th>
                                                <th>Nombres</th>
                                                <th>Apellidos</th>
                                                <th>Dirección</th>
                                                <th>Discapacidad</th>
                                                <th>Representante</th>
                                                <th>Telefono</th>
                                                <th>Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($estudiantes as $row): ?>
                                                <tr>
                                                    <td><?php echo $row['id']; ?></td>
                                                    <td><?php echo $row['cedula']; ?></td>
                                                    <td><?php echo $row['nombres']; ?></td>
                                                    <td><?php echo $row['apellidos']; ?></td>
                                                    <td><?php echo $row['direccion']; ?></td>
                                                    <td><?php echo $row['discapacidad']; ?></td>
                                                    <td><?php echo $row['apellidos_nombres']; ?></td>
                                                    <td><?php echo $row['telefono']; ?></td>
                                                    <td>
                                                        <div style="display: flex; align-items: center;">
                                                            <form action="matriculacion.php" method="post" id="actForm">
                                                                <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                                                <button id="actualizar" class="hand-cursor" type="submit" value="<?php echo $row['id']; ?>" style="background-color: var(--c);">
                                                                    <i class="fas fa-user-check" style="font-size: 28px; color: #ec1d17;"></i>
                                                                </button>
                                                            </form>
                                                            <?php if ($_SESSION['rol'] == "admin" || $_SESSION['rol'] == "secretariado"): ?>
                                                                <form action="../controller/eliminar_prematricula.php" method="post" id="eliminarForm">
                                                                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                                                    <button class="hand-cursor" type="button" onclick="alerta_eliminar(<?php echo $row['id']; ?>)" style="background-color: var(--c);">
                                                                        <i class="fas fa-trash-alt" style="font-size: 28px; color: #ec1d17; margin-left:10px;"></i>
                                                                    </button>
                                                                </form>
                                                            <?php endif; ?>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.contenedor-fluido -->

            </div>
            <!-- Fin del contenido principal -->

            <!-- Pie de página -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                    <span>&copy; Las Guilas del saber. Nos reservamos los derechos  </span>
                    </div>
                </div>
            </footer>
            <!-- Fin del pie de página -->

        </div>
        <!-- Fin del contenedor de contenido -->

        </div>
        <!-- Fin del contenedor de la página -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Modal de Cierre de Sesión-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">¿Listo para salir?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Seleccione "Cerrar sesión" a continuación si está listo para finalizar su sesión actual.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="login.html">Cerrar sesión</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>