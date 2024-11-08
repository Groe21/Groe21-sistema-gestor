<?php
session_start();
ob_start();
include_once(__DIR__ . '/../../config/config.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Matricular Estudiante</title>

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
                <h1 class="h3 mb-0 text-gray-800">Matricular Estudiante</h1>
                </div>

                <!-- Fila de contenido -->
                <div class="row">

                <?php include_once(__DIR__ . '/formulario_matriculacion.php'); ?>

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

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Modal de Cierre de Sesión-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
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

 <!-- Modal de búsqueda -->
 <div class="modal fade" id="modalBusqueda" tabindex="-1" role="dialog" aria-labelledby="modalBusquedaLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitulo">Buscar Persona</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="modalCedula">Cédula</label>
                    <input type="text" class="form-control" id="modalCedula" name="modalCedula" oninput="buscarEnModal(document.getElementById('modalTipo').value)">
                    <input type="hidden" id="modalTipo" name="modalTipo">
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Cédula</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Dirección</th>
                            <th>Correo</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody id="tablaResultados">
                        <!-- Resultados de la búsqueda se insertarán aquí -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


    <!-- Bootstrap core JavaScript-->
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../js/sb-admin-2.min.js"></script>
    <script src="../../js/discapacidad.js"></script>

    <!-- Page level plugins -->
    <script src="../../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../js/demo/chart-area-demo.js"></script>
    <script src="../../js/demo/chart-pie-demo.js"></script>

    <script src="../../js/perfil_img.js"></script>

    <script>
        function abrirModal(tipo) {
            $('#modalBusqueda').modal('show');
            document.getElementById('modalTitulo').innerText = `Buscar ${tipo.charAt(0).toUpperCase() + tipo.slice(1)}`;
            document.getElementById('modalTipo').value = tipo;
            buscarEnModal(tipo); // Realizar la búsqueda inicial para mostrar todos los registros del tipo
        }

        function buscarEnModal(tipo) {
            fetch('<?php echo BASE_URL; ?>/models/estudiantes/buscar_estudiante.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `tipo=${tipo}`
            })
            .then(response => response.json())
            .then(data => {
                console.log(data); // Agregar este log para ver la respuesta
                const tablaResultados = document.getElementById('tablaResultados');
                tablaResultados.innerHTML = ''; // Limpiar la tabla

                if (data.error) {
                    alert(data.error);
                } else {
                    data.forEach(persona => {
                        const fila = document.createElement('tr');
                        fila.innerHTML = `
                            <td>${persona.cedula}</td>
                            <td>${persona.nombres}</td>
                            <td>${persona.apellidos}</td>
                            <td>${persona.direccion}</td>
                            <td>${persona.correo}</td>
                            <td><button type="button" class="btn btn-primary btn-sm" onclick="seleccionarPersona(${persona.id_persona}, '${persona.cedula}', '${persona.nombres}', '${persona.apellidos}', '${persona.direccion}', '${persona.correo}', '${tipo}')">Seleccionar</button></td>
                        `;
                        tablaResultados.appendChild(fila);
                    });
                }
            })
            .catch(error => console.error('Error:', error));
        }

        function seleccionarPersona(id_persona, cedula, nombres, apellidos, direccion, correo, tipo) {
            if (tipo === 'estudiante') {
                document.getElementById('id_persona_estudiante').value = id_persona;
                document.getElementById('cedula_estudiante').value = cedula;
                document.getElementById('apellidos_estudiante').value = apellidos;
                document.getElementById('nombres_estudiante').value = nombres;
                document.getElementById('direccion_estudiante').value = direccion;
            } else if (tipo === 'madre') {
                document.getElementById('id_persona_mama').value = id_persona;
                document.getElementById('cedula_mama').value = cedula;
                document.getElementById('apellidos_nombres_mama').value = `${nombres} ${apellidos}`;
                document.getElementById('direccion_mama').value = direccion;
            } else if (tipo === 'padre') {
                document.getElementById('id_persona_papa').value = id_persona;
                document.getElementById('cedula_papa').value = cedula;
                document.getElementById('apellidos_nombres_papa').value = `${nombres} ${apellidos}`;
                document.getElementById('direccion_papa').value = direccion;
            }
            $('#modalBusqueda').modal('hide');
        }
    </script>


<?php ob_end_flush(); ?>
</body>

</html>