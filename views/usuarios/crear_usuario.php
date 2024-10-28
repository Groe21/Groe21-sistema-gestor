<?php
include_once(__DIR__ . '/../../config/config.php');
session_start();
include_once(__DIR__ . '/../../config/conexion.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Crear Usuario</title>

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
                    <h1 class="h3 mb-0 text-gray-800">Crear usuario</h1>
                </div>

                <!-- Fila de contenido -->
                <div class="row">
    <div class="col-lg-6 mx-auto">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Buscar Persona</h6>
            </div>
            <div class="card-body">
                <form id="buscarPersonaForm">
                    <div class="form-group">
                        <label for="cedula">Cédula:</label>
                        <input type="text" class="form-control" id="cedula" name="cedula" required>
                        <button type="button" class="btn btn-primary mt-2" onclick="buscarPersona()">Buscar Persona</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Crear Usuario</h6>
            </div>
            <div class="card-body">
                <form id="crearUsuarioForm" onsubmit="return crearUsuario(event)">
                    <input type="hidden" id="id_persona" name="id_persona" required>
                    <div class="form-group">
                        <label for="nombre_completo">Nombre:</label>
                        <input type="text" class="form-control" id="nombre_completo" name="nombre_completo" readonly required>
                    </div>
                    <div class="form-group">
                        <label for="username">Usuario:</label>
                        <input type="text" class="form-control" id="username" name="username" readonly required>
                    </div>
                    <div class="form-group">
                        <label for="password">Contraseña:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Crear Usuario</button>
                </form>
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

    <!-- Modal de éxito -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Éxito</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Usuario creado exitosamente.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.reload()">Aceptar</button>
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

    <!-- Page level plugins -->
    <script src="../../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../js/demo/chart-area-demo.js"></script>
    <script src="../../js/demo/chart-pie-demo.js"></script>

    <script>
function buscarPersona() {
    const cedula = document.getElementById('cedula').value;

    fetch('<?php echo BASE_URL; ?>/models/personas/buscar_persona.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `cedula=${cedula}`
    })
    .then(response => response.json())
    .then(data => {
        console.log(data); // Agregar este log para ver la respuesta
        if (data.error) {
            alert(data.error);
        } else {
            document.getElementById('id_persona').value = data.id_persona;
            document.getElementById('username').value = data.cedula;
            document.getElementById('nombre_completo').value = `${data.nombres} ${data.apellidos}`;
        }
    })
    .catch(error => console.error('Error:', error));
}

function crearUsuario(event) {
    event.preventDefault();

    const form = document.getElementById('crearUsuarioForm');
    const formData = new FormData(form);

    fetch('<?php echo BASE_URL; ?>/models/usuarios/insertar_usuario.php', {
        method: 'POST',
        body: new URLSearchParams(formData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            $('#successModal').modal('show');
        } else {
            alert('Error al crear el usuario.');
        }
    })
    .catch(error => console.error('Error:', error));
}
</script>

</body>

</html>