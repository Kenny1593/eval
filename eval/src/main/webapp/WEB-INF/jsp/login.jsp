<%--
  Created by IntelliJ IDEA.
  User: KENNY
  Date: 06/05/2023
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Gestion Pret</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/ressources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/ressources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/ressources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/ressources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/ressources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/ressources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/ressources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/ressources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/ressources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/ressources/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.2.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

<main>
  <div class="container">

    <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

            <div class="d-flex justify-content-center py-4">
              <a class="logo d-flex align-items-center w-auto">
                <img src="${pageContext.request.contextPath}/ressources/assets/img/logo.png" alt="">
                <span class="d-none d-lg-block">NiceAdmin</span>
              </a>
            </div><!-- End Logo -->

            <div class="card mb-3">

              <div class="card-body">

                <div class="pt-4 pb-2">
                  <h5 class="card-title text-center pb-0 fs-4">Veuillez-vous connecter </h5>
                  <p class="text-center small">Entrer votre email et mot de passe</p>
                </div>

                <form class="row g-3 needs-validation" method="post" action="<%=request.getContextPath() %>/connected" novalidate>

                  <div class="col-12">
                    <label for="yourUsername" class="form-label">Nom</label>
                    <div class="input-group has-validation">
                      <span class="input-group-text" id="inputGroupPrepend">@</span>
                      <input type="text" name="nom" class="form-control" id="yourUsername" value="Rakoto" required>
                      <div class="invalid-feedback">Please enter your email</div>
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="yourPassword" class="form-label">Mot de passe</label>
                    <input type="password" name="pwd" class="form-control" id="yourPassword" value="Rakoto123" required>
                    <div class="invalid-feedback">Please enter your password!</div>
                  </div>

                  <div class="col-12">
                    <button class="btn btn-primary w-100" type="submit">Login</button>
                  </div>
                </form>

              </div>
            </div>

          </div>
        </div>
      </div>

      <div>
        <h4>Admin</h4>
        <div>
          <a>Nom: Rakoto</a>
          <a>Mdp: Rakoto123</a>
        </div>

        <div>
          <a>Nom: Randria</a>
          <a>Mdp: Randria123</a>
        </div>
      </div>

      <div>
        <h4>Client</h4>
        <div>
          <a>Nom: Kenny</a>
          <a>Mdp: Kenny123</a>
        </div>

        <div>
          <a>Nom: Sarobidy</a>
          <a>Mdp: Sarobidy123</a>
        </div>

        <div>
          <a>Nom: Patricia</a>
          <a>Mdp: Patricia123</a>
        </div>

      </div>


    </section>

  </div>
</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/chart.js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/quill/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/ressources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/ressources/assets/js/main.js"></script>

</body>

</html>