<%-- 
    Document   : productmanage
    Created on : Jun 22, 2022, 3:46:41 PM
    Author     : DUC THINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laptot</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <!-- Css Styles -->

        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>

            #custom form{
                display :inline-block;
                margin-right: 5%;
                margin-left: 5%;
            }
            #custom form:first-child{
                margin-left: 2%;
            }
            #custom form #search{
                margin-right: 0px;
            }
            table td{
                padding-right: 10px; 
                padding-bottom: 10px;
            }

            .pagination a.active {
                background-color: #e7ab3c;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: #eec477;
            </style>
            <script>
                function doChange() {
                   if (confirm("Are you sure to change status of this product?")) {
                        document.getElementById("frm").submit();
                    }
                    }
             </script>
        </head>
        <body >
            <!--Header-->
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
                            <!--                        <div class="lan-selector">
                                                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                                                            <option value='yt' data-image="../img/flag-1.jpg" data-imagecss="flag yt"
                                                                    data-title="English">English</option>
                                                            <option value='yu' data-image="../img/flag-2.jpg" data-imagecss="flag yu"
                                                                    data-title="Bangladesh">German </option>
                                                        </select>
                                                    </div>-->
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
                                <!--                    <ul class="depart-hover">
                                                        <li class="active"><a href="#">Women’s Clothing</a></li>
                                                        <li><a href="#">Men’s Clothing</a></li>
                                                        <li><a href="#">Underwear</a></li>
                                                        <li><a href="#">Kid's Clothing</a></li>
                                                        <li><a href="#">Brand Fashion</a></li>
                                                        <li><a href="#">Accessories/Shoes</a></li>
                                                        <li><a href="#">Luxury Brands</a></li>
                                                        <li><a href="#">Brand Outdoor Apparel</a></li>
                                                    </ul>-->
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
            <!--End Header-->

            <div class="container" style="font-size: 15px;">
                <div class="table-wrapper">
                    <div class="table-title" style="background-color: #e7ab3c">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="productmanage"><h2 style="color: white">Manage <b>Product</b></h2></a>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>					
                                </div>
                            </div>
                        </div>
                        <div id="custom">
                            <form action="sortproduct" id="sort">
                             
                                Sort by 
                                <select name="sort" onchange="document.getElementById('sort').submit()">
                                    <option value="0" <c:if test="${requestScope.sort eq '0'}">Selected</c:if>>Default</option>
                                    <option value="1" <c:if test="${requestScope.sort eq '1'}">Selected</c:if>>Increase Price</option>
                                    <option value="2" <c:if test="${requestScope.sort eq '2'}">Selected</c:if>>Decrease Price</option>
                                    <option value="3" <c:if test="${requestScope.sort eq '3'}">Selected</c:if>>Increase Name</option>
                                    <option value="4" <c:if test="${requestScope.sort eq '4'}">Selected</c:if>>Decrease Name</option>
                                    </select>
                                </form>


                                <form action="filterproduct" id="filter">
                                    Brand
                                    <select name="brandid" onchange="document.getElementById('filter').submit()" vallue="">
                                        <option value="0">All</option>
                                    <c:forEach items="${requestScope.brandlist}" var="b">
                                        <option value="${b.id}" <c:if test="${requestScope.brandid eq b.id}">Selected</c:if>>${b.name}</option>     
                                    </c:forEach>
                                </select>
                            </form>

                            <form action="filterproduct" id="status">
                                Status
                                <select name="statusfilter" onchange="document.getElementById('status').submit()" vallue="">
                                    <option value="2" <c:if test="${requestScope.statusfilter eq '2'}">Selected</c:if>>All</option>
                                    <option value="1" <c:if test="${requestScope.statusfilter eq '1'}">Selected</c:if>>ON</option>
                                    <option value="0" <c:if test="${requestScope.statusfilter eq '0'}">Selected</c:if>>OFF</option>
                                    </select>
                            </form>

                            <form action="productsearch" id="search">
                                    <input name="search" type="text" value="${requestScope.search}"/>
                                <button type="submit">Search</button>
                            </form>
                        </div>

                        <c:if test="${requestScope.s!=null}">
                            ${requestScope.s}
                        </c:if>
                        <c:if test="${requestScope.id!=null}">
                            ${requestScope.id}
                        </c:if>

                        <table id="table" class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Brand</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Sale Price</th>
                                    <th>Quantity</th>
                                    <th>Status</th>
                                    <th>Detail</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach items="${requestScope.productlist}" var="p">
                                    <tr>
                                        <td>${p.id}</td>
                                        <td>${p.name}</td>
                                        <td>
                                            <img src="img/${p.imgURL}" style="width: 100px; height: 90px; max-width: none">
                                        </td>
                                        <td>${p.brand.name}</td>
                                        <td><fmt:formatNumber pattern="###,###,###" value="${p.price}" />VND</td>
                                        <td>${p.discount}</td>
                                        <td><fmt:formatNumber pattern="###,###,###" value="${p.saleprice}" />VND</td>
                                        <td>${p.quantity}</td>
                                        <td>
                                            <form action="productmanage" method="post" name="frm" id="frm">
                                                <c:if test="${p.status == true}">
                                                    <button onclick="doChange()" type="submit" style="padding: 10px;border: none;background-color: green;color: white">
                                                        <input name="id" value="${p.id}" hidden/>
                                                        <input name="status" value="ON" hidden/>
                                                        <input name="type" value="${requestScope.type}" hidden/>
                                                        <input name="index" value="${requestScope.index}" hidden/>
                                                        <c:if test="${requestScope.brandid!=null}">
                                                            <input name="brandid" value="${requestScope.brandid}" hidden/>
                                                        </c:if>
                                                        <c:if test="${requestScope.statusfilter!=null}">
                                                            <input name="statusfilter" value="${requestScope.statusfilter}" hidden/>
                                                        </c:if>
                                                        <c:if test="${requestScope.sort!=null}">
                                                            <input name="sort" value="${requestScope.sort}" hidden/>
                                                        </c:if>
                                                        <c:if test="${requestScope.search!=null}">
                                                            <input name="search" value="${requestScope.search}" hidden/>
                                                        </c:if>
                                                        ON
                                                    </button>
                                                </c:if>
                                                <c:if test="${p.status == false}">
                                                    <button onclick="doChange()" type="submit" style="padding: 10px;border: none;background-color: red;color: white">
                                                        <input name="id" value="${p.id}" hidden/>
                                                        <input name="status" value="OFF" hidden>
                                                        <input name="type" value="${requestScope.type}" hidden/>                                   
                                                        <input name="index" value="${requestScope.index}" hidden/>
                                                        <c:if test="${requestScope.brandid!=null}">
                                                            <input name="brandid" value="${requestScope.brandid}" hidden/>
                                                        </c:if>
                                                        <c:if test="${requestScope.statusfilter!=null}">
                                                            <input name="statusfilter" value="${requestScope.statusfilter}" hidden/>
                                                        </c:if>
                                                        <c:if test="${requestScope.sort!=null}">
                                                            <input name="sort" value="${requestScope.sort}" hidden/>
                                                        </c:if>
                                                        <c:if test="${requestScope.search!=null}">
                                                            <input name="search" value="${requestScope.search}" hidden/>
                                                        </c:if>
                                                        OFF
                                                    </button>
                                                </c:if>
                                            </form>

                                        </td>
                                        <td>
                                            <a href="productdetailmanage?id=${p.id}&index=${requestScope.index}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>                                         
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>


                        <c:if test="${requestScope.type eq 'default'}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="productmanage?index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item"><a  class="${i==index?"active":""}" href="productmanage?index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="productmanage?index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${requestScope.type eq 'sort'}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="sortproduct?sort=${param.sort}&index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item" ><a  class="${i==index?"active":""}"  href="sortproduct?sort=${param.sort}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="sortproduct?sort=${param.sort}&index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${requestScope.type eq 'filter'}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="filterproduct?brandid=${param.brandid}&index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item"><a  class="${i==index?"active":""}"  href="filterproduct?brandid=${param.brandid}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="filterproduct?brandid=${param.brandid}&index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.type eq 'statusfilter'}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="filterproduct?statusfilter=${param.statusfilter}&index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item" ><a  class="${i==index?"active":""}" href="filterproduct?statusfilter=${param.statusfilter}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="filterproduct?statusfilter=${param.statusfilter}&index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${requestScope.type eq 'search'}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="productsearch?search=${param.search}&index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item"><a   class="${i==index?"active":""}" href="productsearch?search=${param.search}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="productsearch?search=${param.search}&index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                    <a href="marketingdashboard"><button type="button" class="btn btn-primary" style="background-color: #e7ab3c;color: white">Back to Dashboard</button></a>

                </div>
                <!-- Edit Modal HTML -->
                <div id="addEmployeeModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="addproduct" method="post" enctype="multipart/form-data">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Add Product</h4>
                                    <c:if test="${requestScope.error!=null}">
                                        <h6 style="color: red">${requestScope.error}</h6>
                                    </c:if>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>

                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" type="text" class="form-control" id="name" value="${param.name}"required>
                                    </div>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input name="price" type="text" class="form-control" id="price" value="${param.price}" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Discount</label>
                                        <input name="discount" type="text" class="form-control" id="discount" value="${param.discount}" required>
                                    </div>             
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input name="quantity" type="text" class="form-control" id="quantity" value="${param.quantity}" required/>
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input name="image" type="file" class="form-control" value="${param.image}" required/>
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" class="form-control" value="${param.description}" required>${param.description}</textarea>
                                    </div>
                                    <table>
                                        <tr>
                                            <td><label>Brand</label></td>
                                            <td>          <select name="brand" value="${param.brand}" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.brandlist}" var="b">
                                                        <option value="${b.id}"<c:if test="${requestScope.brandid eq b.id}">Selected</c:if>>${b.name}</option>
                                                    </c:forEach>
                                                </select></td>
                                        </tr>           
                                        <tr>
                                            <td> <label>Category</label></td>
                                            <td><select name="category" value="${param.category}" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.categorylist}" var="c">
                                                        <option value="${c.id}" <c:if test="${requestScope.categoryid eq c.id}">Selected</c:if>>${c.name}</option>
                                                    </c:forEach>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><label>OperatingSystem</label></td>
                                            <td>   <select name="os" value="${param.os}" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.oslist}" var="o">
                                                        <option value="${o.id}" <c:if test="${requestScope.osid eq o.id}">Selected</c:if>>${o.name}</option>
                                                    </c:forEach>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>   <label>RAM</label></td>
                                            <td>    <select name="ram" value="${param.ram}" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.ramlist}" var="r">
                                                        <option value="${r.id}" <c:if test="${requestScope.ramid eq r.id}">Selected</c:if>>${r.name}</option>
                                                    </c:forEach>
                                                </select></td>
                                        </tr>
                                        <tr>

                                            <td>  <label>CPU</label></td>
                                            <td>    <select name="cpu" value="${param.cpu}" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.cpulist}" var="cpu">
                                                        <option value="${cpu.id}" <c:if test="${requestScope.cpuid eq cpu.id}">Selected</c:if>>${cpu.name}</option>
                                                    </c:forEach>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>    <label>Display</label> </td>
                                            <td>    <select name="display" value="${param.display}" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.displaylist}" var="d">
                                                        <option value="${d.id}" <c:if test="${requestScope.displayid eq d.id}">Selected</c:if>>${d.name}</option>
                                                    </c:forEach>
                                                </select> </td>
                                        </tr>
                                        <tr>
                                            <td>    <label>Capacity</label> </td>
                                            <td>   <select name="capacity" value="${param.capacity}" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.capacitylist}" var="cap">
                                                        <option value="${cap.id}" <c:if test="${requestScope.capacityid eq cap.id}">Selected</c:if>>${cap.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>    <label>Card</label> </td>
                                            <td>    <select name="card" value="${param.card}"class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${requestScope.cardlist}" var="card">
                                                        <option value="${card.id}" <c:if test="${requestScope.cardid eq card.id}">Selected</c:if>>${card.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        <tr>
                                    </table>           
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input onclick="send()" type="submit"  class="btn btn-success" value="Add" style="background-color: #e7ab3c;">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                                    
            <script>
                function send() {
                    var name_raw = document.getElementById('name');
                    var name = (String)name_raw;    
                    if(name.trim() === ""){
                        alert("Name can not be empty");
                        return;
                    }
  
                    var price_raw = document.getElementById('price');
                    var price = price_raw.value;
                    if (isNaN(price)) {
                        alert("price must be number");
                        return;
                    }
                    if (price < 0) {
                        alert("price must be >= 0VND");
                        return;
                    }
                    var discount_raw = document.getElementById('discount');
                    var discount = discount_raw.value;
                    if (isNaN(discount)) {
                        alert("discount must be number");
                        return;
                    }
                    if (discount > 1 || discount < 0) {
                        alert("discount must be arround 0<= discount <=1");
                        return;
                    }

                    var quantity_raw = document.getElementById('quantity');
                    var quantity = quantity_raw.value;
                    if (isNaN(quantity)) {
                        alert("quantity must be number");
                        return;
                    }
                    if (quantity < 0) {
                        alert("quantity must be positive Integer");
                        return;
                    }
                }
            </script>

            <!-- Footer Section Begin -->
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
                <!-- Footer Section End -->
                <script src="js/manager.js" type="text/javascript"></script>
            </body>
        </html>
