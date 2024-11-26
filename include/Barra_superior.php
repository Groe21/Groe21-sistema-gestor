<?php
include_once(__DIR__ . '/../config/config.php');
include_once(__DIR__ . '/../config/conexion.php');

if (!isset($_SESSION['usuario'])) {
    header('Location: ' . BASE_URL . '/login.php');
    exit();
}

// Función para cerrar sesión
if (isset($_GET['logout'])) {
    session_destroy();
    header('Location: ' . BASE_URL . '/login.php');
    exit();
}
$pdo = conectarBaseDeDatos();

?>

<nav class="navbar navbar-expand navbar-light bg-warning topbar mb-4 static-top shadow">

    <!-- Alternar barra lateral (Barra superior) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Barra superior de navegación -->
    <ul class="navbar-nav ml-auto">

        <!-- Elemento de navegación - Desplegable de búsqueda (Visible solo XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
        </li>
        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Información del usuario -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                    <?php
                    if (isset($_SESSION['usuario']['nombres'])) {
                        echo $_SESSION['usuario']['nombres'];
                    } else {
                        echo $_SESSION['usuario']['cedula']; // Mostrar la cédula si no hay nombres
                    }
                    ?>
                </span>
                <img class="img-profile rounded-circle" src="<?php echo BASE_URL; ?>/img/undraw_profile.svg">
            </a>
            <!-- Desplegable - Información del usuario -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Perfil
                </a>
                <a class="dropdown-item" href="#">
                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                    Ajustes
                </a>
                <a class="dropdown-item" href="#">
                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                    Registro de actividad
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#crearPeriodoModal">
                    <i class="fas fa-calendar-plus fa-sm fa-fw mr-2 text-gray-400"></i>
                    Crear Periodo
                </a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Cerrar sesión
                </a>
            </div>
        </li>

    </ul>

</nav>

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
                <a class="btn btn-primary" href="<?php echo BASE_URL; ?>/include/Barra_superior.php?logout=true">Cerrar sesión</a>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Crear Periodo -->
<div class="modal fade" id="crearPeriodoModal" tabindex="-1" role="dialog" aria-labelledby="crearPeriodoModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="crearPeriodoModalLabel">Crear Nuevo Periodo</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<?php echo BASE_URL; ?>/models/periodos/crear_periodo.php" method="POST">
                    <div class="form-group">
                        <label for="nombre_periodo">Nombre del Periodo:</label>
                        <input type="text" class="form-control" id="nombre_periodo" name="nombre_periodo" required>
                    </div>
                    <div class="form-group">
                        <label for="fecha_inicio">Fecha de Inicio:</label>
                        <input type="date" class="form-control" id="fecha_inicio" name="fecha_inicio" required>
                    </div>
                    <div class="form-group">
                        <label for="fecha_fin">Fecha de Fin:</label>
                        <input type="date" class="form-control" id="fecha_fin" name="fecha_fin" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Crear Periodo</button>
                </form>
            </div>
        </div>
    </div>
</div>