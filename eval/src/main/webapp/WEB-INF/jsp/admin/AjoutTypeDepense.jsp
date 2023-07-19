<%@ page import="com.example.eval.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eval.model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% List<TypeDepense> typeDepenses= (List<TypeDepense>) request.getAttribute("typeDepenses");%>


<%--
  Created by IntelliJ IDEA.
  User: KENNY
  Date: 07/05/2023
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mikolo</title>
  <meta content="l'Intelligence artificielle est une " name="description">
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

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

  <div class="d-flex align-items-center justify-content-between">
    <a  class="logo d-flex align-items-center">
      <img src="${pageContext.request.contextPath}/ressources/assets/img/logo.png" alt="">
      <span class="d-none d-lg-block">Clinique</span>
    </a>
  </div><!-- End Logo -->

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/home">
        <i class="bi bi-grid"></i>
        <span>Ajout Patient</span>
      </a>
    </li><!-- End Dashboard Nav -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/typeActe">
        <i class="bi bi-grid"></i>
        <span>Ajout Type Acte</span>
      </a>
    </li><!-- End Dashboard Nav -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/typeDepense">
        <i class="bi bi-grid"></i>
        <span>Ajout Type Depense</span>
      </a>
    </li><!-- End Dashboard Nav -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/tableBord">
        <i class="bi bi-grid"></i>
        <span>Table de bord</span>
      </a>
    </li><!-- End Dashboard Nav -->
  </ul>

</aside><!-- End Sidebar-->

<main id="main" class="main">

  <div class="pagetitle">
    <h1>Achat Type Depense</h1>
  </div><!-- End Page Title -->



  <section class="section">
    <div class="row">


      <div class="card">
        <div class="card-body">


          <!-- General Form Elements -->
          <form method="post" action="<%=request.getContextPath()%>/insertDepense">
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label">Nom Depense</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="valeur">
              </div>
            </div>
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label">Code</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="code" >
              </div>
            </div>
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label">Budget</label>
              <div class="col-sm-10">
                <input type="number" step="any" class="form-control" name="budget">
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-10">
                <button type="submit" class="btn btn-primary">Ajouter</button>
              </div>
            </div>

          </form><!-- End General Form Elements -->

        </div>
      </div>
      <% if(typeDepenses!=null){ %>
      <div>
        <form>
          <table class="table">
            <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nom</th>
              <th scope="col">Code</th>
              <th scope="col">Budget</th>

            </tr>
            </thead>
            <tbody>
            <% for(TypeDepense typeDepense: typeDepenses) {%>
            <tr>
              <td><%= typeDepense.getId()%></td>
              <td><%= typeDepense.getValeur()%></td>
              <td><%=typeDepense.getCode()%></td>
              <td><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=typeDepense.getBudget()%>"/></td>
              <td><a href="<%=request.getContextPath()%>/modifTypeDepense/<%=typeDepense.getId()%>" class="btn btn-dark" >Modifier</a></td>
            </tr>
            <% } %>
            </tbody>
          </table>
        </form>
      </div>
      <% } %>


    </div>
  </section>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
  <div class="copyright">
    &copy; Copyright <strong><span>ETU001593</span></strong>. All Rights Reserved
  </div>
</footer><!-- End Footer -->

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