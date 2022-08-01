<%-- 
    Document   : blog.jsp
    Created on : Jun 2, 2022, 8:48:08 PM
    Author     : Pham Minh Giang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Fashi Template">
        <meta name="keywords" content="Fashi, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fashi Shop</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            .blog-item img{
                height: 400px
            }
            .clearfix{
                float: right
            }
        </style>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <%@include file="Components/header.jsp" %>
        <!-- Header End -->

        <!-- Breadcrumb Section Begin -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <a href="#"><i class="fa fa-home"></i> Home</a>
                            <span>Blog</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->

        <!-- Blog Section Begin -->
        <section class="blog-section spad">
            <div class="container">
                <div class="row">
                    <!--<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">-->
                    <div class="blog-sidebar">
                        <div class="search-form">
                            <h4>Search blog</h4>
                            <form action="searchblog" style="width: 500px">
                                <input type="text" name="search" placeholder="Search . . .  " value="${requestScope.search}">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>

                        <div class="row">
                            <c:forEach items="${requestScope.listBlog}" var="b">
                                <c:if test="${b.status==true}">
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="blog-item">
                                            <div class="bi-pic">
                                                <img src="img/${b.imgURL}" alt="">
                                            </div>
                                            <div class="bi-text">
                                                <p>Blog <span>${b.modyfieDate}</span></p>
                                                <a href="blogdetail?id=${b.id}">
                                                    <h4>${b.title}</h4>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>

                    </div>
                </div>
                <c:if test="${requestScope.check.equals('list')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="blog?index=${requestScope.index-1}" class="page-link">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="blog?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="blog?index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('search')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="searchblog?search=${requestScope.search}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="searchblog?search=${requestScope.search}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="searchblog?search=${requestScope.search}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if> 
            </div>
        </section>


        <!-- Blog Section End -->

        <!-- Partner Logo Section Begin -->
        <div class="partner-logo">
            <div class="container">
                <div class="logo-carousel owl-carousel">
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-1.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-2.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-3.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-4.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Partner Logo Section End -->

        <!-- Footer Section Begin -->
        <%@include file="Components/footer.jsp" %>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/jquery.dd.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
