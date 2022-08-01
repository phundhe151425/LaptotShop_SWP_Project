<%-- 
    Document   : profile
    Created on : May 30, 2022, 3:28:46 PM
    Author     : MSI
--%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>


<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Fashi Template">
        <meta name="keywords" content="Fashi, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Laptot</title>

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
        <%--<c:set value="${cart}" var="c"/>--%>
        <%@include file="Components/header.jsp" %>
        <!-- Header End -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <a href="#"><i class="fa fa-home"></i> Home</a>
                            <span>Change Pass</span>
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
                        <div class="login-form">
                            <h2>Change Password</h2>
                            <form action="changepass" method="POST">
                                <div class="group-input">
                                    <label for="oldPass">Current Password *</label>
                                    <input type="password" id="oldPass" name="oldPass" placeholder="Enter Current Password">
                                </div>
                                <div class="group-input">
                                    <label for="newPass">New Password *</label>
                                    <input type="password" id="newPass" name="newPass" placeholder="Enter New Password">
                                </div>
                                <div class="group-input">
                                    <label for="confirmPass">Confirm New Password *</label>
                                    <input type="password" id="confirmPass" name="confirmPass" placeholder="Confirm New Password">
                                </div>
                                <div class="group-input gi-check">
                                    <div class="gi-more">
                                        <!--                                <label for="save-pass">
                                                                            Save Password
                                                                            <input type="checkbox" id="save-pass">
                                                                            <span class="checkmark"></span>
                                                                        </label>-->
                                        <c:if test="${error != null && error != ''}">
                                            <h5 style="color: red">${requestScope.error}</h5>

                                        </c:if>

                                        <c:if test="${success != null && success != ''}">
                                            <h5 style="color: green">${requestScope.success}</h5>
                                        </c:if>
                                        <a href="#" class="forget-pass">Forget your Password</a>
                                    </div>
                                </div>
                                <button type="submit" class="site-btn login-btn">Change</button>
                            </form>
                            <!--                    <div class="switch-login">
                                                    <a href="./register.html" class="or-login">Or Create An Account</a>
                                                </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="Components/footer.jsp" %>
        
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