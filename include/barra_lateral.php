<?php
require_once __DIR__ . '/../config/config.php';

if (!isset($_SESSION['id']) || empty($_SESSION['nombre']) || empty($_SESSION['rol'])) {
    header("location: login.php");
    exit();
}
?>

<ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Barra lateral - Marca -->
    <a class="sidebar-brand d-flex flex-column align-items-center justify-content-center" href="../../principal.php" style="margin-bottom: 20px; margin-top: 20px;">
        <div class="sidebar-brand-icon" style="margin-bottom: 10px;">
            <img src="<?php echo BASE_URL; ?>/img/logo23.png" alt="Brand Image" style="width: 50px; height: 50px;">
        </div>
        <div class="sidebar-brand-text mx-3" style="display: block; text-align: center;">
            LAS ÁGUILAS DEL SABER
        </div>
    </a>

    <!-- Divisor -->
    <hr class="sidebar-divider">

    <!-- Encabezado -->
    <div class="sidebar-heading">
        Interfaz
    </div>

    <!-- Elemento de navegación - Inicio -->
    <?php if (isOptionAllowed('dashboard', $_SESSION['rol'])) { ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo BASE_URL; ?>/principal.php">
                <i class="fas fa-home"></i>
                <span>Inicio</span>
            </a>
        </li>
    <?php } ?>

    <!-- Divisor -->
    <hr class="sidebar-divider">

    <!-- Encabezado -->
    <div class="sidebar-heading">
        Gestión de Estudiantes
    </div>

    <!-- Dropdown - Gestión de Estudiantes -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEstudiantes"
            aria-expanded="true" aria-controls="collapseEstudiantes">
            <i class="fas fa-user-graduate"></i>
            <span>Estudiantes</span>
        </a>
        <div id="collapseEstudiantes" class="collapse" aria-labelledby="headingEstudiantes" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Gestión de Estudiantes:</h6>
                <?php if (isOptionAllowed('matricula', $_SESSION['rol'])) { ?>
                    <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/matricular_estudiante.php">Matricular Estudiante</a>
                <?php } ?>
                <?php if (isOptionAllowed('responsables', $_SESSION['rol'])) { ?>
                    <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/tabresponsable.php">Responsables</a>
                <?php } ?>
                <?php if (isOptionAllowed('matriculados', $_SESSION['rol'])) { ?>
                    <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/estudiantes.php">Matriculados</a>
                <?php } ?>
                <?php if (isOptionAllowed('listado', $_SESSION['rol'])) { ?>
                    <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/listado_estudiantes.php">Listado Estudiantes</a>
                <?php } ?>
                <?php if (isOptionAllowed('culminados', $_SESSION['rol'])) { ?>
                    <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/periodos_culminados.php">Períodos Culminados</a>
                <?php } ?>
                <?php if (isOptionAllowed('inactivos', $_SESSION['rol'])) { ?>
                    <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/inactivos.php">Estudiantes Inactivos</a>
                <?php } ?>
            </div>
        </div>
    </li>

    <!-- Divisor -->
    <hr class="sidebar-divider">

    <!-- Encabezado -->
    <div class="sidebar-heading">
        Configuración
    </div>

    <!-- Dropdown - Configuración -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseConfiguracion"
            aria-expanded="true" aria-controls="collapseConfiguracion">
            <i class="fas fa-cogs"></i>
            <span>Opciones</span>
        </a>
        <div id="collapseConfiguracion" class="collapse" aria-labelledby="headingConfiguracion" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Configuración:</h6>
                <?php if (isOptionAllowed('opciones', $_SESSION['rol'])) { ?>
                    <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/administracion/tab_opciones.php">Opciones</a>
                <?php } ?>
            </div>
        </div>
    </li>

    <!-- Divisor -->
    <hr class="sidebar-divider">

    <!-- Alternador de barra lateral (Barra lateral) -->
    <!-- <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div> -->

</ul>