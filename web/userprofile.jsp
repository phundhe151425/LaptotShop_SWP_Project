<%-- 
    Document   : userprofile
    Created on : Jun 3, 2022, 2:06:32 AM
    Author     : Pham Minh Giang
--%>

<%@page import="model.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Fashi | Template</title>

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
            #select{
                margin-top: 50px;
                margin-bottom: 50px;
            }
            #male{
                margin-left: 20px;
            }
            #female{
                margin-left: 20px;
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
                            <span>User Profile</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Form Section Begin -->

        <!-- Register Section Begin -->
        <div class="register-login-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <div class="register-form">
                            <h2>User Profile</h2>
                            <c:set value="${sessionScope.account}" var="a"></c:set>
                                <form action="userprofile" method="post">
                                    <div class="group-input">
                                        <input type="text" name="id" id="con-pass" value="${a.accountID}" hidden>
                                </div>
                                <div class="group-input">
                                    <label for="con-pass">Full Name</label>
                                    <input type="text" name="fullname" id="con-pass" value="${a.name}" required>
                                    <p style="color: red">${requestScope.nameMess}</p>
                                </div>
                                <div id="select" style="font-size: 20px">
                                    <label for="con-pass">Gender</label>
                                    <c:if test="${a.gender == true}">
                                        <input type="radio" name="gender" checked id="male" value="male"  >Male
                                        <input type="radio" name="gender" id="female" value="female">Female
                                    </c:if>
                                    <c:if test="${a.gender == false}">
                                        <input type="radio" name="gender" id="male" value="male"  >Male
                                        <input type="radio" name="gender" checked id="female" value="female">Female
                                    </c:if>
                                </div>
                                <div class="group-input">
                                    <label for="con-pass">Email</label>
                                    <input type="email" name="email" id="con-pass" value="${a.email}" required readonly>
                                </div>
                                <div class="group-input">
                                    <label for="con-pass">Phone</label>
                                    <input type="text" name="phone" id="con-pass" value="${a.phone}" required>
                                    <p style="color: red">${requestScope.phoneMess}</p>
                                </div>
                                <div class="group-input">
                                    <label for="con-pass">Address</label>
                                    <input type="text" name="address"id="con-pass" value="${a.address}" required>
                                    <p style="color: red">${requestScope.addressMess}</p>
                                </div>
                                <button type="submit" class="site-btn register-btn">Save Change</button>
                            </form>
                            <!--                            <div class="switch-login">
                                                            <a href="login" class="or-login">Or Login</a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Form Section End -->

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
