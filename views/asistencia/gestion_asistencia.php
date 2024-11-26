<?php
include_once(__DIR__ . '/../../config/config.php');
session_start();
include_once(__DIR__ . '/../../models/escuela/mostrar_paralelos.php');
include_once(__DIR__ . '/../../models/asistencia/obtener_profesores_asistencia.php');
$pdo = conectarBaseDeDatos();
$listadoProfesores = new ListadoProfesores($pdo);
$mostrarParalelos = new MostrarParalelos($pdo);
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gestión de asistencia</title>

    <!-- Custom fonts for this template-->
    <link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../css/sb-admin-2.min.css" rel="stylesheet">

    <link rel="icon" href="../../img/logo23.ico" type="image/x-icon">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Barra lateral -->
        <?php include_once(__DIR__ . '/../../include/barra_lateral.php'); ?>
        <!-- Fin de la barra lateral -->

        <!-- Contenedor de contenido -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Contenido principal -->
            <div id="content">

            <!-- Barra superior -->
            <?php include_once (__DIR__ . '/../../include/barra_superior.php'); ?>
            <!-- Fin de la barra superior -->

            <!-- Comienzo del contenido de la página -->
            <div class="container-fluid">

                <!-- Encabezado de la página -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Control de asistencia</h1>
                </div>

                <!-- Fila de contenido -->
                <div class="row">
                <?php $listadoProfesores->mostrarTablaProfesores(13); ?>
                </div>

            </div>
            <!-- /.contenedor-fluido -->

            </div>
            <!-- Fin del contenido principal -->

            <!-- Pie de página -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                    <span>&copy; Las Águilas del saber. Nos reservamos los derechos  </span>
                    </div>
                </div>
            </footer>
            <!-- Fin del pie de página -->

        </div>
        <!-- Fin del contenedor de contenido -->

        </div>
        <!-- Fin del contenedor de la página -->

<!-- Modal de Ejemplo -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Detalles del Curso</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
          <table id="tablaEstudiantes" class="table table-bordered table-striped w-100">
            <thead class="thead-dark">
              <tr>
                <th>Nombre Completo</th>
                <th>Lunes</th>
                <th>Martes</th>
                <th>Miércoles</th>
                <th>Jueves</th>
                <th>Viernes</th>
              </tr>
            </thead>
            <tbody id="tablaEstudiantesBody">
              <!-- Los datos de los estudiantes se llenarán dinámicamente -->
            </tbody>
          </table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../js/demo/chart-area-demo.js"></script>
    <script src="../../js/demo/chart-pie-demo.js"></script>

    <script>
    $(document).ready(function() {
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var idProfesor = button.data('id-profesor');
            var idParalelo = button.data('id-paralelo');
            var modal = $(this);

            // Limpiar el cuerpo de la tabla
            modal.find('#tablaEstudiantesBody').empty();

            // Hacer una solicitud AJAX para obtener los estudiantes del curso
            $.ajax({
                url: '<?php echo BASE_URL; ?>/models/asistencia/obtener_estudiantes_por_curso.php',
                method: 'GET',
                data: { id_paralelo: idParalelo, id_periodo: 13 }, // Ajusta el periodo según sea necesario
                success: function(response) {
                    try {
                        var estudiantes = JSON.parse(response);
                        if (estudiantes.length > 0) {
                            estudiantes.forEach(function(estudiante) {
                                var row = '<tr>' +
                                    '<td>' + estudiante.nombre_completo + '</td>' +
                                    '<td></td>' +
                                    '<td></td>' +
                                    '<td></td>' +
                                    '<td></td>' +
                                    '<td></td>' +
                                    '</tr>';
                                modal.find('#tablaEstudiantesBody').append(row);
                            });
                        } else {
                            var row = '<tr><td colspan="6" class="text-center">No hay estudiantes registrados.</td></tr>';
                            modal.find('#tablaEstudiantesBody').append(row);
                        }
                    } catch (e) {
                        console.error('Error al parsear JSON:', e);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error al obtener los estudiantes:', error);
                }
            });
        });
    });
</script>


</body>

</html>