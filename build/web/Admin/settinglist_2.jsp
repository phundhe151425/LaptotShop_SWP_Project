<%-- 
    Document   : settinglist
    Created on : Jul 9, 2022, 11:47:17 PM
    Author     : Pham Minh Giang
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

        <style>
            .table-title{
                background-color: #e7ab3c;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #e7ab3c;
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
                            <li class="active"><a href="home">Home</a></li>
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
                            <h2 style="color: white">Manage <b>Setting</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addSetting"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Setting</span></a>
                        </div>
                    </div>
                </div>
                <div id="head">
                    <div class="search">
                        <form action="searchsetting">
                            <input name="search" type="text"  placeholder="Text in here" value="${requestScope.search}">
                            <input type="submit" value="Search">
                        </form>
                    </div>

                    <div class="fillter">
                        <form id="filter" action="filltersetting">
                            Type
                            <select name="type" onchange="document.getElementById('filter').submit()">
                                <option value="">All</option>
                                <c:forEach items="${sessionScope.listType}" var="a"> 
                                    <option value="${a}" <c:if test="${a.equals(requestScope.type)}">selected</c:if> >${a}</option>
                                </c:forEach>
                            </select> 
                            Status
                            <select name="status" onchange="document.getElementById('filter').submit()">
                                <option value="">All</option>
                                <option value="1" <c:if test="${requestScope.status.equals('1')}">selected</c:if> >Active</option>
                                <option value="0" <c:if test="${requestScope.status.equals('0')}">selected</c:if>>Deactive</option>

                                </select>
                            </form>
                        </div>

                    <div class="sort"> 
                            <form id="sort" action="sortsetting">
                                Sort by
                                <select name="sort" onchange="document.getElementById('sort').submit()">
                                    <option value="0">Default</option>
                                    <option value="ID" <c:if test="${requestScope.sort.equals('ID')}">selected</c:if> >ID</option>
                                <option value="Type" <c:if test="${requestScope.sort.equals('Type')}">selected</c:if> >Type</option>
                                <option value="Value" <c:if test="${requestScope.sort.equals('Value')}">selected</c:if> >Value</option>
                                <option value="Order" <c:if test="${requestScope.sort.equals('Order')}">selected</c:if> >Order</option>
                                </select>
                            </form>
                        </div>

                </div><br>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Value</th>
                                <th>Order</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.listSetting}" var="l">
                            <tr>
                                <td>${l.id}</td>
                                <td>${l.type}</td>
                                <td>${l.value}</td>
                                <td>${l.order}</td>
                                <td>
                                    <form action="editsetting" method="post" >
                                        <input value="${l.id}" name="id" hidden>
                                        <c:if test="${l.status == true}">
                                            <input type="submit" name="status" value="Active" style="background-color: #e7ab3c; color: white; border-color: lightgray">
                                        </c:if>
                                        <c:if test="${l.status == false}">
                                            <input type="submit" name="status" value="Deactive" style="background-color: red; color: white; border-color: lightgray">
                                        </c:if>
                                    </form>
                                </td>
                                <td>
                                    <a href="settingdetail?id=${l.id}"  class="edit" data-toggle="modal" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!--paging-->
                <c:if test="${requestScope.check.equals('list')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="settingmanage?index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="settingmanage?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="settingmanage?index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('search')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="searchsetting?search=${requestScope.search}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="searchsetting?search=${requestScope.search}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="searchsetting?search=${requestScope.search}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('sort')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="sortsetting?sort=${requestScope.sort}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="sortsetting?sort=${requestScope.sort}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="sortsetting?sort=${requestScope.sort}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('filter')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="filltersetting?type=${requestScope.type}&status=${requestScope.status}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active style="background-color: #e7ab3c"</c:if> ><a href="filltersetting?type=${requestScope.type}&status=${requestScope.status}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="filltersetting?type=${requestScope.type}&status=${requestScope.status}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <!--end paging-->

            </div>
            <a href="marketingdashboard"><button type="button" class="btn btn-primary" style="font-size: 18px; background-color: #e7ab3c">Back to Admin Dashboard</button></a>

        </div>

        <div id="addSetting" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addsetting">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add new Setting</h4>
                            <!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Type</label>
                                <input name="type" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Value</label>
                                <input name="value" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Order</label>
                                <input name="order" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" type="text" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="form-select" aria-label="Default select example">
                                    <option value="1">Active</option>
                                    <option value="0">Deactive</option>
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
