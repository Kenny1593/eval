<%@ page import="com.example.eval.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eval.model.*" %>
<%@ page import="java.time.Month" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--
  Created by IntelliJ IDEA.
  User: KENNY
  Date: 07/05/2023
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<TypeDepense> typeDepenses= (List<TypeDepense>) request.getAttribute("typeDepenses");%>
<% List<Depense> depenses= (List<Depense>) request.getAttribute("depenses"); %>



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
            <a class="nav-link collapsed" href="<%=request.getContextPath()%>/homeUser">
                <i class="bi bi-grid"></i>
                <span>Liste Patient</span>
            </a>
        </li><!-- End Dashboard Nav -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="<%=request.getContextPath()%>/listFact">
                <i class="bi bi-grid"></i>
                <span>Liste Facture</span>
            </a>
        </li><!-- End Dashboard Nav -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="<%=request.getContextPath()%>/typeDep">
                <i class="bi bi-grid"></i>
                <span>Ajout Depense</span>
            </a>
        </li><!-- End Dashboard Nav -->

    </ul>

</aside><!-- End Sidebar-->

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Ajouts depenses </h1>
    </div><!-- End Page Title -->



    <section class="section">
        <div class="row">
            <div class="card">
                <div class="card-body">


                    <!-- General Form Elements -->

                        <form method="post" action="<%=request.getContextPath()%>/ajoutDepense">
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Type de depense : </label>
                                <div class="col-sm-10">
                                    <select class="form-select" name="idTypeDepense" aria-label="Default select example">
                                        <option></option>
                                        <% for (TypeDepense m : typeDepenses) { %>
                                        <option value="<%=m.getId()%>"><%=m.getValeur()%>
                                        </option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>

                            <!----- Teste ----->
                            <div class="row">
                                <div class="col-sm-3 jour">
                                    <div class="row mb-3">
                                        <label class="col-sm-5 col-form-label">Jour : </label>
                                        <div class="col-sm-5">
                                            <input type="number" name="jour" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <div class="row col-sm-5 align-content-lg-center mois">
                                    <div class="col-sm-6 left">
                                        <%for (int i = 1; i <= 6; i++) {%>
                                        <div class="row mb-3">
                                            <div class="col-sm-2">
                                                <input type="checkbox" value="<%=i%>" name="mois" class="form-check-input">
                                            </div>
                                            <label class="col-sm-10 form-check-label"><%=Month.of(i)%>
                                            </label>
                                        </div>
                                        <% } %>
                                    </div>
                                    <div class="col-sm-6 right">
                                        <%for (int i = 7; i <= 12; i++) {%>
                                        <div class="row mb-3">
                                            <div class="col-sm-2">
                                                <input type="checkbox" value="<%=i%>" name="mois" class="form-check-input">
                                            </div>
                                            <label class="col-sm-10 form-check-label"><%=Month.of(i)%>
                                            </label>
                                        </div>
                                        <% } %>
                                    </div>
                                </div>

                                <div class="col-sm-3 annee">
                                    <div class="row mb-3">
                                        <label class="col-sm-5 col-form-label">Annee : </label>
                                        <div class="col-sm-5">
                                            <input type="number" name="annee" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!----- Teste ----->
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Montant : </label>
                                <div class="col-sm-10">
                                    <input type="number" step="any" name="montant" class="form-control">
                                </div>
                            </div>
                            <!----<div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Date : </label>
                                <div class="col-sm-10">
                                    <input type="date" name="date" class="form-control">
                                </div>
                            </div> ---->
                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                                </div>
                            </div>
                        </form><!-- End General Form Elements -->


                    <form method="post" action="<%=request.getContextPath()%>/import" enctype="multipart/form-data">
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">File CSV</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" name="file">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Importer</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
            <% if(depenses!=null) { %>
            <div>
                <form>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nom type depense</th>
                            <th scope="col">Date</th>
                            <th scope="col">Montant</th>


                        </tr>
                        </thead>
                        <tbody>
                        <% int i=1; %>
                        <% for(Depense depense: depenses) {%>
                        <tr>

                            <td><%=i++%></td>
                            <td><%= depense.getTypeDepense().getValeur()%></td>
                            <td><fmt:formatDate type="both" value="<%= depense.getDate()%>" pattern="dd MMMM yyyy"/></td>
                            <td><%= depense.getMontant()%></td>
                            <td><a href="<%=request.getContextPath()%>/modifDepense/<%=depense.getId()%>" class="btn btn-dark">Modifier</a></td>
                            <td><p class="card-text"><a href="<%= request.getContextPath()%>/deleteDepense/<%=depense.getId()%>" class="btn btn-danger d-print-none">Supprimer</a></p></td>


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