

<ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Barra lateral - Marca -->
    <a class="sidebar-brand d-flex flex-column align-items-center justify-content-center" href="<?php echo BASE_URL; ?>/principal.php" style="margin-bottom: 20px; margin-top: 20px;">
        <div class="sidebar-brand-icon" style="margin-bottom: 10px;">
            <img src="<?php echo BASE_URL; ?>/img/logo23.png" alt="Brand Image" style="width: 50px; height: 50px;">
        </div>
        <div class="sidebar-brand-text mx-3" style="display: block; text-align: center;">
            LAS ÁGUILAS DEL SABER
        </div>
    </a>

    <!-- Divisor -->
    <hr class="sidebar-divider">

    <!-- Elemento de navegación - Inicio -->
    <li class="nav-item">
        <a class="nav-link" href="<?php echo BASE_URL; ?>/principal.php">
            <i class="fas fa-home"></i>
            <span>Inicio</span>
        </a>
    </li>

    <!-- Divisor -->
    <hr class="sidebar-divider">

     <!-- Encabezado -->
     <div class="sidebar-heading">
        Gestión de Usuarios
    </div>

    <!-- Dropdown - Gestión de Usuarios -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUsuarios"
            aria-expanded="true" aria-controls="collapseUsuarios">
            <i class="fas fa-user-cog"></i>
            <span>Usuarios</span>
        </a>
        <div id="collapseUsuarios" class="collapse" aria-labelledby="headingUsuarios" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Gestión de Usuarios:</h6>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/usuarios/crear_usuario.php">Crear Usuario</a>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/usuarios/listado_usuarios.php">Listado de Usuarios</a>
            </div>
        </div>
    </li>

    <!-- Divisor -->
    <hr class="sidebar-divider">

    <!-- Encabezado -->
    <div class="sidebar-heading">
        Gestión de la Escuela
    </div>

    <!-- Dropdown - Gestión de la Escuela -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEscuela"
            aria-expanded="true" aria-controls="collapseEscuela">
            <i class="fas fa-school"></i>
            <span>Escuela</span>
        </a>
        <div id="collapseEscuela" class="collapse" aria-labelledby="headingEscuela" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Gestión de la Escuela:</h6>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/escuela/gestionar_cursos.php">gestion de cursos</a>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/escuela/gestionar_profesores.php">gestion de profesores</a>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/asistencia/gestion_asistencia.php">gestion de asistencia</a>
            </div>
        </div>
    </li>

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
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/matricular_estudiante.php">Matricular Estudiante</a>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/listado_estudiantes.php">Estudiantes Matriculados</a>
                <!-- <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/estudiantes.php">Matriculados</a>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/listado_estudiantes.php">Listado Estudiantes</a>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/periodos_culminados.php">Períodos Culminados</a>
                <a class="collapse-item" href="<?php echo BASE_URL; ?>/views/estudiantes/inactivos.php">Estudiantes Inactivos</a> -->
            </div>
        </div>
    </li>


    <!-- Divisor -->
    <hr class="sidebar-divider">


    <!-- Divisor -->
    <hr class="sidebar-divider">

</ul>
