<?php
include_once(__DIR__ . '/config/config.php');
include_once(__DIR__ . '/models/administrativo/obtener_comunicado.php');

$pdo = conectarBaseDeDatos();
$mostrarComunicados = new MostrarComunicados($pdo);

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Comunicados</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="Free HTML Templates" name="keywords" />
    <meta content="Free HTML Templates" name="description" />
    <link rel="icon" href="./img/logo23.ico" type="image/x-icon">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Handlee&family=Nunito&display=swap"
      rel="stylesheet"
    />

    <!-- Font Awesome -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />

    <!-- Flaticon Font -->
    <link href="lib/flaticon/font/flaticon.css" rel="stylesheet" />

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet" />
  </head>


  <body>

    <!-- Navbar Start -->
    <?php include_once(__DIR__ . '/include/pagina_principal/cabecera.php'); ?> 
    <!-- Navbar End -->

    <!-- Header Start -->
    <div class="container-fluid bg-primary mb-5">
      <div
        class="d-flex flex-column align-items-center justify-content-center"
        style="min-height: 400px"
      >
        <h3 class="display-3 font-weight-bold text-white">Comunicados</h3>
        <div class="d-inline-flex text-white">
          <p class="m-0"><a class="text-white" href="">Inicio</a></p>
          <p class="m-0 px-2">/</p>
          <p class="m-0">Comunicados</p>
        </div>
      </div>
    </div>
    <!-- Header End -->

    <!-- Detail Start -->
    <div class="container">
      <div class="row pt-1">
        <div class="col-lg-8">
        <?php $mostrarComunicados->mostrarTarjetasComunicados();?>
        </div>
      </div>
    </div>
    <!-- Detail End -->

    <!-- Footer Start -->
    <div class="container-fluid bg-secondary text-white mt-5 py-5 px-sm-3 px-md-5">
      <div class="row pt-5">
      <div class="col-lg-3 col-md-6 mb-5">
        <a href="" class="navbar-brand font-weight-bold text-primary m-0 mb-4 p-0" style="font-size: 40px; line-height: 40px">
        <span class="text-white">Footer Title</span>
        </a>
        <p>Example content for the footer.</p>
        <div class="d-flex justify-content-start mt-4">
        <a class="btn btn-outline-primary rounded-circle text-center text-white mr-2 px-0" style="width: 38px; height: 38px" href="#">
          <i class="fab fa-facebook-f text-white"></i>
        </a>
        <a class="btn btn-outline-primary rounded-circle text-center text-white mr-2 px-0" style="width: 38px; height: 38px" href="#">
          <i class="fab fa-instagram text-white"></i>
        </a>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-5">
        <div class="d-flex">
        <h4 class="fa fa-map-marker-alt text-primary"></h4>
        <div class="pl-3">
          <h5 class="text-white">Ubicacion</h5>
          <p>Example location content.</p>
        </div>
        </div>
        <div class="d-flex">
        <h4 class="fa fa-envelope text-primary"></h4>
        <div class="pl-3">
          <h5 class="text-white">Correo Electronico</h5>
          <p>example@example.com</p>
        </div>
        </div>
        <div class="d-flex">
        <h4 class="fa fa-phone-alt text-primary"></h4>
        <div class="pl-3">
          <h5 class="text-white">Celular</h5>
          <p>+123456789</p>
        </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-5">
        <h3 class="text-primary mb-4">Contactenos</h3>
        <form action="">
        <div class="form-group">
          <input type="text" class="form-control border-0 py-4" placeholder="Nombres Completos" required="required" />
        </div>
        <div class="form-group">
          <input type="email" class="form-control border-0 py-4" placeholder="Correo Electronico" required="required" />
        </div>
        <div class="form-group">
          <textarea class="form-control border-0 py-4" placeholder="Mensaje" required="required"></textarea>
        </div>
        <div>
          <button class="btn btn-primary btn-block border-0 py-3" type="submit">Enviar Mensaje</button>
        </div>
        </form>
      </div>
      </div>
      <div class="container-fluid pt-5" style="border-top: 1px solid rgba(23, 162, 184, 0.2);">
      <p class="m-0 text-center text-white">
        &copy; <a class="text-primary font-weight-bold" href="#">Las Aguilas del Saber</a>. Nos Reservamos los Derechos.
      </p>
      </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary p-3 back-to-top"
      ><i class="fa fa-angle-double-up"></i
    ></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
  </body>
</html>
