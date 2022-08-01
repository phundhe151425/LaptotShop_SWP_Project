<%-- 
    Document   : UserList
    Created on : May 28, 2022, 1:09:54 AM
    Author     : Pham Minh Giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User List</title>
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
                width: 350px;
                height: 120px;
            }
            #head form{
                display: inline-block;
                align-items: center;
            }
            #filter{
                display: inline-block;
            }
            .table-title{
                background-color: #e7ab3c;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #e7ab3c;
            }
            table{
                font-size: 15px;
            }
        </style>
        
        <script>
            function doChange() {
                if (confirm("Are you sure to change status of this User?")) {
                    document.getElementById("frm").submit();
                }
            }
        </script>
        
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
                        <div class="col-sm-6">
                            <h2 style="color: white">Manage <b>User</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addUser"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>
                        </div>
                    </div>
                </div>

                <div class="seach">
                    <form action="search">
                        <input name="search" type="text"  placeholder="Text in here" value="${requestScope.search}">
                        <input type="submit" value="Search">
                    </form>
                </div><br>

                <div class="fillter">
                    <form id="fillter" action="fillteruser" >
                        Gender
                        <select name="gender" onchange="document.getElementById('fillter').submit()" value = "${requestScope.gender}">
                            <option value="" >All</option>
                            <option value="1" <c:if test="${requestScope.gender.equals('1')}">selected</c:if> >Male</option>
                            <option value="0" <c:if test="${requestScope.gender.equals('0')}">selected</c:if>  >Female</option>
                            </select>
                            Role
                            <select name="role" onchange="document.getElementById('fillter').submit()" value = "${requestScope.role}">
                            <option value="" >All</option>
                            <option value="1" <c:if test="${requestScope.role.equals('1')}">selected</c:if>  >Admin</option>
                            <option value="2" <c:if test="${requestScope.role.equals('2')}">selected</c:if> >Customer</option>
                            <option value="3" <c:if test="${requestScope.role.equals('3')}">selected</c:if> >Sale</option>
                            <option value="4" <c:if test="${requestScope.role.equals('4')}">selected</c:if> >Marketing</option>
                            </select>
                            Status
                            <select name="status" onchange="document.getElementById('fillter').submit()" value = "${requestScope.status}">
                            <option value="" >All</option>
                            <option value="1" <c:if test="${requestScope.status.equals('1')}">selected</c:if> >Active</option>
                            <option value="0" <c:if test="${requestScope.status.equals('0')}">selected</c:if> >Deactive</option>
                            </select><br>
                        </form>
                    </div><br>

                    <div class="sort">
                        <form action="sortuser" id="sort" >
                            Sort by: 
                            <select name="sort" onchange="document.getElementById('sort').submit()" value="${requestScope.sort}">
                            <option value="Account_ID" <c:if test="${requestScope.sort.equals('Account_ID')}">selected</c:if> >Account_ID</option>
                            <option value="Name" <c:if test="${requestScope.sort.equals('Name')}">selected</c:if> >Name</option>
                            <option value="Email" <c:if test="${requestScope.sort.equals('Email')}">selected</c:if> >Email</option>
                            <option value="Phone" <c:if test="${requestScope.sort.equals('Phone')}">selected</c:if> >Phone</option>
                            <option value="Role_ID" <c:if test="${requestScope.sort.equals('Role_ID')}">selected</c:if> >Role</option>
                            </select>
                        </form>
                    </div><br>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.UserList}" var="a">
                            <tr>
                                <td>${a.getAccountID()}</td>
                                <td>${a.getName()}</td>
                                <td>
                                    <c:if test="${a.isGender()== true}">Male</c:if>
                                    <c:if test="${a.isGender()== false}">Female</c:if>
                                    </td>
                                    <td>${a.getEmail()}</td>
                                <td>${a.getPhone()}</td>
                                <td>
                                    <c:if test="${a.getRole().getRoleID()== 1}">Admin</c:if>
                                    <c:if test="${a.getRole().getRoleID()== 2}">Customer</c:if>
                                    <c:if test="${a.getRole().getRoleID()== 3}">Sale</c:if>
                                    <c:if test="${a.getRole().getRoleID()== 4}">Marketing</c:if>
                                    </td>
                                    <td>
                                        <form action="userupdate" method="post" id="frm" >
                                            <input value="${a.getAccountID()}" name="id" hidden>
                                        <c:if test="${a.isStatus()== true}">
                                            <input onclick="doChange()" type="submit" name="status" value="Active" style="background-color: #e7ab3c; color: white; border-color: lightgray">
                                        </c:if>
                                        <c:if test="${a.isStatus()== false}">
                                            <input onclick="doChange()" type="submit" name="status" value="Deactive" style="background-color: red; color: white; border-color: lightgray">
                                        </c:if>
                                    </form>
                                </td>
                                <td> <a href="userdetail?id=${a.getAccountID()}"><i style="color: #e7ab3c" class="material-icons" data-toggle="tooltip" title="Detail">&#xE254;</i></a> </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!--paging-->
                <c:if test="${requestScope.check.equals('list')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="userlist?index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="userlist?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="userlist?index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('search')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="search?search=${requestScope.search}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="search?search=${requestScope.search}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="search?search=${requestScope.search}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('sort')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="sortuser?sort=${requestScope.sort}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="sortuser?sort=${requestScope.sort}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="sortuser?sort=${requestScope.sort}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${requestScope.check.equals('fillter')}">
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:if test="${requestScope.index >1}">
                                <li class="page-item "><a href="fillteruser?gender=${requestScope.gender}&role=${requestScope.role}&status=${requestScope.status}&index=${requestScope.index-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.page}" var="i">
                                <li class="page-item <c:if test="${i.equals(requestScope.index)}">active</c:if>"><a href="fillteruser?gender=${requestScope.gender}&role=${requestScope.role}&status=${requestScope.status}&index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>

                            <c:if test="${requestScope.index < requestScope.page}">
                                <li class="page-item"><a href="fillteruser?gender=${requestScope.gender}&role=${requestScope.role}&status=${requestScope.status}&index=${requestScope.index+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </c:if>
                <!--end paging-->
            </div>
            <a href="admindashboard"><button style="font-size: 18px; background-color: #e7ab3c" type="button" class="btn btn-primary">Back to home</button></a>
        </div>

        <!-- Edit Modal HTML -->
        <div id="addUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="adduser" method="get" >
                        <div class="modal-header">						
                            <h4 class="modal-title">Add User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>User Name</label>
                                <input name="username" type="text" id="username" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>PassWord</label>
                                <input name="password" type="text" id="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" id="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <select name="gender">
                                    <option value="1">Male</option>
                                    <option value="0">Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="email" id="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input name="phone" type="tel" id="phone" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" type="text" id="address" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <select name="roleID">
                                    <option value="1">Admin</option>
                                    <option value="2">Customer</option>
                                    <option value="3">Sale</option>
                                    <option value="4">Marketing </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status">
                                    <option value="1">Active</option>
                                    <option value="0">InActive</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input onclick="check()" type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->

        <script>
            function check() {
                var username = document.getElementById('username');
                var password = document.getElementById('password');
                var name = document.getElementById('name');
                var email = document.getElementById('email');
                var phone = document.getElementById('phone');
                var address = document.getElementById('address');
                if (username.trim() == "") {
                    alert("UserName can not null");
                    return;
                }
                if (password.trim() == "") {
                    alert("Password can not null");
                    return;
                }
                if (name.trim() == "") {
                    alert("Name can not null");
                    return;
                }
                if (email.trim() == "") {
                    alert("Email can not null");
                    return;
                }
                if (phone.trim() == "") {
                    alert("Phone can not null");
                    return;
                }
                if (address.trim() == "") {
                    alert("Address can not null");
                    return;
                }
                alert("add user");
                return;
            }

        </script>

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
