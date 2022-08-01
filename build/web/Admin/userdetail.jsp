<%-- 
    Document   : UserDetails
    Created on : May 28, 2022, 2:53:41 PM
    Author     : Pham Minh Giang
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User Detail</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

        <style>
            img{
                width: 200px;
                height: 180px;
            }
            #head form{
                display: inline-block;
                align-items: center;
            }
            .table-title{
                background-color: #e7ab3c;
            }
            #sort{
                float: right;
            }
            #filter{
                margin-left: 400px;
            }
            #order h2{
                font-size: 35px;
            }
            #order h4{
                font-size: 24px;
                color: white;
            }
            form label{
                font-size: 25px;
            }
            form input{
                size: 25px;
            }

        </style>
    </head>
    <body>

        <header class="header-section">
            <div class="header-top">
                <div class="container">
                    <div class="ht-left">
                        <div class="mail-service">
                            <i class=" fa fa-envelope"></i>
                            laptot@laptot.com
                        </div>
                        <div class="phone-service">
                            <i class=" fa fa-phone"></i>
                            +9999999999
                        </div>
                    </div>
                    <div class="ht-right">
                        <c:if test="${sessionScope.account==null}">
                            <a href="login" class="login-panel"><i class="fa fa-user"></i>Login</a>
                        </c:if>
                        <c:if test="${sessionScope.account!=null}">       
                            <a class="login-panel"><i class="fa fa-user"></i>Hello ${sessionScope.account.name}</a> -
                        </c:if> 

                        <div class="top-social">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-linkedin"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="nav-item">
                <div class="container">
                    <div class="nav-depart">
                        <div class="depart-btn">
                            <i class="ti-menu"></i>
                            <span>All departments</span>

                        </div>
                    </div>
                    <nav class="nav-menu mobile-menu">
                        <ul>
                            <li><a href="home">Home</a></li>
                            <li><a href="product">Shop</a></li>
                            <!--                    <li><a href="#">Collection</a>
                                                    <ul class="dropdown">
                                                        <li><a href="#">Men's</a></li>
                                                        <li><a href="#">Women's</a></li>
                                                        <li><a href="#">Kid's</a></li>
                                                    </ul>
                                                </li>-->
                            <li><a href="blog">Blog</a></li>
                            <!--                    <li><a href="./contact.html">Contact</a></li>-->
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">

                                    <c:set value="${sessionScope.account}" var="a"></c:set>
                                    <c:if test="${a.getRole().getRoleName().toLowerCase().equals('admin')}">
                                        <li><a href="admindashboard">Admin DashBoard</a></li>
                                        </c:if>
                                        <c:if test="${a.getRole().getRoleName().toLowerCase().equals('saler')}">
                                        <li><a href="saledashboard">Sale DashBoard</a></li>
                                        </c:if>
                                        <c:if test="${a.getRole().getRoleName().toLowerCase().equals('marketer')}">
                                        <li><a href="marketingdashboard">Marketing DashBoard</a></li>
                                        </c:if>

                                    <c:if test="${sessionScope.account!=null}">  
                                        <li><a href="userprofile">User Profile</a></li>
                                        <li><a href="myorder?AccountID=${sessionScope.account.accountID}">My Order</a></li>
                                        <li><a href="shoppingcart">Shopping Cart</a></li>
                                        <li><a href="cartcontact">Checkout</a></li>
                                        <li><a href="changepass">Change Password</a></li>                                
                                        <li><a href="logout">Logout</a></li>
                                        </c:if> 
                                        <c:if test="${sessionScope.account==null}"> 
                                        <li><a href="register">Register</a></li>
                                        </c:if>


                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </header>


        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6" id="order">
                            <h2 style="color: white">User <b>Detail</b></h2><br>
                            <c:set var="a" value="${requestScope.Account}"/>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>

                <form action="userupdate">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>ID</label>
                            <input style="font-size: 15px" type="text" class="form-control" required name="id" value="${a.accountID}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input style="font-size: 15px" type="text" class="form-control" required value="${a.name}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Gender</label>
                            <c:if test="${a.gender==true}"><input style="font-size: 15px" type="text" class="form-control" required value="Male" readonly></c:if> 
                            <c:if test="${a.gender==false}"><input style="font-size: 15px" type="text" class="form-control" required value="Female" readonly></c:if> 
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input style="font-size: 15px" class="form-control" required value="${a.email}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input style="font-size: 15px" class="form-control" required value="${a.phone}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Role</label>
                            <select name="role" style="font-size: 15px" class="form-control">
                                <option>${a.role.roleName}</option>
                                <c:forEach items="${requestScope.RoleList}" var="r">
                                    <option value="${r.roleID}">${r.roleName}</option>
                                </c:forEach>
                            </select>
                        </div>					
                        <div class="form-group">
                            <label>Address</label>
                            <input style="font-size: 15px" type="text" class="form-control" required value="${a.address}" readonly>
                        </div>					
                        <div class="form-group">
                            <label>Status</label>
                            <input style="font-size: 15px" type="text" class="form-control" required value="<c:if test="${a.status==true}">Active</c:if><c:if test="${a.status==false}">Deactive</c:if>" readonly>
                        </div>					
                    </div>
                    <div class="modal-footer">
                        <input style="font-size: 18px; background-color: #e7ab3c" type="submit" class="btn btn-info" value="Save Changes">
                    </div>
                </form>
            </div>
            <a href="userlist" ><button style="font-size: 18px; background-color: #e7ab3c" type="button" class="btn btn-primary">Back to UserList</button></a><br><br>
        </div>

        <footer class="footer-section" style="margin-top: 30px">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="footer-left">

                            <ul>
                                <li>Address: 60-49 Road 11378 New York</li>
                                <li>Phone: +65 11.188.888</li>
                                <li>Email: hello.colorlib@gmail.com</li>
                            </ul>
                            <div class="footer-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 offset-lg-1">
                        <div class="footer-widget">
                            <h5>Information</h5>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Serivius</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="footer-widget">
                            <h5>My Account</h5>
                            <ul>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Shopping Cart</a></li>
                                <li><a href="#">Shop</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="newslatter-item">
                            <h5>Join Our Newsletter Now</h5>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#" class="subscribe-form">
                                <input type="text" placeholder="Enter Your Mail">
                                <button type="button">Subscribe</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-reserved">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="copyright-text">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </footer>

    </body>
</html>
