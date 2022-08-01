<%-- 
    Document   : blogdetails
    Created on : Jun 2, 2022, 9:10:59 PM
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
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <%@include file="Components/header.jsp" %>
        <!-- Header End -->

        <!-- Blog Details Section Begin -->
        <c:set value="${requestScope.blog}" var="b"></c:set>
            <section class="blog-details spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="blog-details-inner">
                                <div class="blog-detail-title">
                                    <h2>${b.title}</h2><br>
                                <p>${b.authorName} </p><br> 
                                <span>${b.modyfieDate}</span>
                            </div>
                            <div class="blog-large-pic">
                                <img src="img/${b.imgURL}" alt="">
                            </div>
                            <div class="blog-detail-desc">
                                <p>${b.content}
                                </p>
                            </div>
                            <div class="blog-quote">
                                <p>${b.content} <span>- Steven Jobs</span></p>
                            </div>
                            <div class="blog-more">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <img src="img/blog/blog-detail-1.jpg" alt="">
                                    </div>
                                    <div class="col-sm-4">
                                        <img src="img/blog/blog-detail-2.jpg" alt="">
                                    </div>
                                    <div class="col-sm-4">
                                        <img src="img/blog/blog-detail-3.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                            <p>${b.content}     </p>
                            <div class="tag-share">
                                <div class="details-tag">
                                    <ul>
                                        <li><i class="fa fa-tags"></i></li>
                                        <li>Technology</li>
                                        <li>Laptop</li>
                                        <li>Fashion</li>
                                    </ul>
                                </div>
                                <div class="blog-share">
                                    <span>Share:</span>
                                    <div class="social-links">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                        <a href="#"><i class="fa fa-youtube-play"></i></a>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="posted-by">
                                <div class="pb-pic">
                                    <img src="img/blog/post-by.png" alt="">
                                </div>
                                <div class="pb-text">
                                    <a href="#">
                                        <h5>Shane Lynch</h5>
                                    </a>
                                    <p>Aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                                        velit esse cillum bore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                        amodo</p>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Details Section End -->

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
