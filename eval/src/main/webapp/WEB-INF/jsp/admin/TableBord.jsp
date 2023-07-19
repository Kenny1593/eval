<%@ page import="com.example.eval.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eval.model.*" %>
<%@ page import="java.time.Month" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale" %>
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
<% List<V_recette> vRecettes= (List<V_recette>) request.getAttribute("vRecettes");%>
<% List<V_depense> vDepenses= (List<V_depense>) request.getAttribute("vDepenses");%>
<% Integer annee= (Integer) request.getAttribute("annee"); %>
<% List<Annee> annees= (List<Annee>) request.getAttribute("annees");%>



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
        <% if(annee==null){%>
            <h1>Tableau de bords</h1>
        <%}else{%>
            <h1>Tableau de bords en année <%=annee%></h1>
        <%}%>
    </div><!-- End Page Title -->



    <section class="section">
        <div class="row">
            <div class="card">
                <div class="card-body">


                    <!-- General Form Elements -->
                    <form method="get" action="<%=request.getContextPath()%>/annee">
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Inserer l'annee</label>
                            <div class="col-sm-10">
                                <select class="form-select" aria-label="Default select example" name="annee">
                                    <option></option>
                                    <% for(Annee annee1: annees){ %>
                                    <option value="<%=annee1.getAnnee()%>"><%=annee1.getAnnee()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Inserer Mois</label>
                            <div class="col-sm-10">
                                <select class="form-select" aria-label="Default select example" name="mois">
                                    <option></option>
                                    <% for(int i=1;i<=12;i++){ %>
                                        <option value="<%=i%>"><%=Month.of(i)%></option>
                                    <% } %>

                                </select>
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


            <% if(vDepenses!=null && vRecettes!=null) { %>
            <div>
                <h4 class="bg-opacity-100">Depense</h4>
            </div>
            <div>

                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nom Depense</th>
                        <th scope="col">Montant</th>
                        <th scope="col">Budget</th>
                        <th scope="col">Realisation</th>
                    </tr>
                    </thead>

                    <tbody>

                    <% double sommeDep=0;
                        int l=1;
                    %>
                    <% double sommeBudgDep=0;%>
                    <% for (V_depense vDepense: vDepenses) { %>
                    <tr>
                        <%/*
                                Month month=Month.of(vRecette.getMois());
                                String monthName = month.getDisplayName(TextStyle.FULL, Locale.getDefault());
                              */
                            Double budgetDep=(vDepense.getTypeDepense().getBudget())/12;
                            sommeDep+=vDepense.getDepense();
                            sommeBudgDep+=budgetDep;
                            Double realisationDep=(vDepense.getDepense()) * (100) / (budgetDep);

                        %>
                        <td><%=l++%></td>
                        <td><%=vDepense.getTypeDepense().getValeur()%></td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=vDepense.getDepense()%>"/></td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=budgetDep%>"/></td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=realisationDep%>"/>%</td>
                    </tr>
                    <% } %>
                    <tr>
                        <%
                            Double bilanRealDep=(sommeDep) *(100)/ (sommeBudgDep);
                        %>
                        <td></td>
                        <td></td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeDep%>"/></td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeBudgDep%>"/></td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=bilanRealDep%>"/>%</td>
                    </tr>

                    </tbody>
                </table>

            </div>

            <div>
                <h4 class="bg-opacity-100">Recette</h4>
            </div>
            <div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nom Recette</th>
                            <th scope="col">Montant</th>
                            <th scope="col">Budget</th>
                            <th scope="col">Realisation</th>
                        </tr>
                        </thead>

                        <tbody>

                        <% double sommeR=0;
                            int i=1;
                        %>
                        <% double sommeBudg=0;%>
                        <% for (V_recette vRecette: vRecettes) { %>
                        <tr>
                            <%/*
                                Month month=Month.of(vRecette.getMois());
                                String monthName = month.getDisplayName(TextStyle.FULL, Locale.getDefault());
                              */
                                Double budget=(vRecette.getTypeActe().getBudget())/12;
                                sommeR+=vRecette.getRecette();
                                sommeBudg+=budget;
                                Double realisation=(vRecette.getRecette()) * (100) / (budget);

                            %>
                            <td><%=i++%></td>
                            <td><%=vRecette.getTypeActe().getValeur()%></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=vRecette.getRecette()%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=budget%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=realisation%>"/>%</td>
                        </tr>
                        <% } %>
                        <tr>
                            <%
                                Double bilanReal=(sommeR) *(100)/ (sommeBudg);
                            %>
                            <td></td>
                            <td></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeR%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeBudg%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=bilanReal%>"/>%</td>
                        </tr>

                        </tbody>
                    </table>

                <div>
                    <h4 class="bg-opacity-100">Benefice</h4>
                </div>
                <div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Reel</th>
                            <th scope="col">Budget</th>
                            <th scope="col">Realisation</th>
                        </tr>
                        </thead>

                        <tbody>


                        <tr>
                            <td>Recette</td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeR%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeBudg%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=bilanReal%>"/>%</td>
                        </tr>
                        <tr>
                            <td>Depense</td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeDep%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=sommeBudgDep%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="<%=bilanRealDep%>"/>%</td>
                        </tr>
                        <tr>
                            <%
                                Double ben=sommeR-sommeDep;
                                Double benBudg=sommeBudg-sommeBudgDep;
                                Double realFinal=(ben) *(100)/(benBudg);
                            %>
                            <td></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="<%=ben%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="<%=benBudg%>"/></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="<%=realFinal%>"/>%</td>
                        </tr>
                        </tbody>
                    </table>

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