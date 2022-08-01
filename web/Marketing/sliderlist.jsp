<%-- 
    Document   : sliderlist
    Created on : Jun 25, 2022, 9:53:48 PM
    Author     : Pham Minh Giang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Slider Manager</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            img{
                width: 350px;
                height: 120px;
            }
            #head form{
                display: inline-block;
                align-items: center;
            }
            #filter{
                float: right;
            }
            .table-title{
                background-color: #e7ab3c;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #e7ab3c;
            }
        </style>
        
        <script>
            function doChange() {
                if (confirm("Are you sure to change status of this Slider?")) {
                    document.getElementById("frm").submit();
                }
            }
        </script>
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
                        <div class="col-sm-6">
                            <a href="slidermanage"><h2 style="color: white">Manage <b>Slider</b></h2></a>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>

                <div id="head">
                    <form action="searchslider">
                        <input name="search" type="text"  placeholder="Text in here" value="${requestScope.search}">
                        <input type="submit" value="Search">
                    </form>

                    <form id="filter" action="filterslider">
                        Status
                        <select name="status" onchange="document.getElementById('filter').submit()">
                            <option value="all" <c:if test="${requestScope.status.equals('all')}">selected</c:if>>All</option>
                            <option value="1" <c:if test="${requestScope.status.equals('1')}">selected</c:if> >On</option>
                            <option value="0" <c:if test="${requestScope.status.equals('0')}">selected</c:if>>Off</option>
                            </select>
                        </form>

                    </div><br>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Image</th>
                                <th>Content</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.listSlider}" var="l">
                            <tr>
                                <td>${l.id}</td>
                                <td>${l.title}</td>
                                <td>
                                    <img src="img/${l.imgURL}">
                                </td>
                                <td>${l.content.substring(0,80)}...</td>
                                <td>
                                    <form action="editslider" method="get" id="frm">
                                        <input value="${l.id}" name="id" hidden>
                                        <c:if test="${l.status == true}">
                                            <input onclick="doChange()" type="submit" name="status" value="On" style="background-color: orange; color: white; border-color: lightgray">
                                        </c:if>
                                        <c:if test="${l.status == false}">
                                            <input onclick="doChange()" type="submit" name="status" value="Off" style="background-color: red; color: white; border-color: lightgray">
                                        </c:if>
                                    </form>
                                </td>
                                <td>
                                    <a href="sliderdetail?id=${l.id}" class="edit" data-toggle="modal" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <c:if test="${requestScope.check.equals('list')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="slidermanage?index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="slidermanage?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="slidermanage?index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('search')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="searchslider?search=${requestScope.search}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="searchslider?search=${requestScope.search}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="searchslider?search=${requestScope.search}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('filter')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="filterslider?status=${requestScope.status}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="filterslider?status=${requestScope.status}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="filterslider?status=${requestScope.status}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

            </div>
            <a href="marketingdashboard"><button type="button" class="btn btn-primary" style="font-size: 18px; background-color: #e7ab3c">Back to Marketing Dashboard</button></a>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach begin="1" end="3" var="o">
                                        <option value="1">Giày Adidas</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
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
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
