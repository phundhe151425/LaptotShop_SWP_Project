<%-- 
    Document   : productdetailmanage
    Created on : Jun 28, 2022, 4:33:31 PM
    Author     : DUC THINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
            table td{
                padding-right: 10px; 
                padding-bottom: 10px;
            }
        </style>
    </head>
    <body>
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

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title" style="background-color: #e7ab3c">
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="productmanage"><h2 style="color: white">Manage <b>Product</b></h2></a>
                        </div>
                    </div>
                </div>

                <div class="modal-body">

                    <form action="productedit" enctype="multipart/form-data" method="post">
                        <c:if test="${sessionScope.product1 == null}">
                            <c:if test="${sessionScope.error != null}">
                                <h5 style="color:red">${sessionScope.error}</h5>
                            </c:if>
                            <c:set value="${requestScope.product}" var="p"></c:set>
                                <div class="form-group">
                                    <label>ID</label>
                                    <input name="id" type="text" class="form-control" value="${p.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" value="${p.name}"required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" id="price" value="<fmt:formatNumber pattern="#########" value="${p.price}" />" required>

                            </div>
                            <div class="form-group">
                                <label>Discount</label>
                                <input name="discount" type="text" class="form-control" id="discount" value="${p.discount}" required>
                            </div> 

                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" id="quantity" value="${p.quantity}" required/>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="file" class="form-control" value="${p.imgURL}"/>
                                <input name="oldimage" value="${p.imgURL}" hidden/>
                                <br>
                                <img src="img/${p.imgURL}" style="width: 320px; height: 240px; max-width: none">

                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" value="" required>${p.description}</textarea>
                            </div>
                            <table>

                                <tr>
                                    <td><label>Brand</label></td>
                                    <td><select name="brand" value="${p.brand.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.brandlist}" var="b">
                                                <option value="${b.id}"<c:if test="${p.brand.id == b.id}">Selected</c:if>>${b.name}</option>
                                        </c:forEach></td>
                                    </select>
                                </tr>
                                <tr>

                                    <td><label>Category</label></td>
                                    <td><select name="category" value="${p.category.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.categorylist}" var="c">
                                                <option value="${c.id}" <c:if test="${p.category.id == c.id}">Selected</c:if>>${c.name}</option>
                                            </c:forEach>
                                        </select></td>

                                </tr>
                                <tr>   
                                    <td><label>OperatingSystem</label></td>
                                    <td> <select name="os" value="${p.os.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.oslist}" var="o">
                                                <option value="${o.id}" <c:if test="${ p.os.id  == o.id}">Selected</c:if>>${o.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>    
                                <tr>
                                    <td> <label>RAM</label> </td>
                                    <td>    <select name="ram" value="${p.ram.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.ramlist}" var="r">
                                                <option value="${r.id}" <c:if test="${p.ram.id == r.id}">Selected</c:if>>${r.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td><label>CPU</label></td>
                                    <td>    <select name="cpu" value="${p.cpu.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.cpulist}" var="cpu">
                                                <option value="${cpu.id}" <c:if test="${p.cpu.id == cpu.id}">Selected</c:if>>${cpu.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>   
                                <tr>   
                                    <td>    <label>Display</label> </td>
                                    <td>    <select name="display" value="${p.display.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.displaylist}" var="d">
                                                <option value="${d.id}" <c:if test="${p.display.id == d.id}">Selected</c:if>>${d.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>    
                                <tr>  
                                    <td><label>Capacity</label></td>
                                    <td>    <select name="capacity" value="${p.capacity.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.capacitylist}" var="cap">
                                                <option value="${cap.id}" <c:if test="${p.capacity.id == cap.id}">Selected</c:if>>${cap.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>   
                                <tr>   
                                    <td><label>Card</label></td>
                                    <td>    <select name="card" value="${p.card.id}"class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.cardlist}" var="card">
                                                <option value="${card.id}" <c:if test="${p.card.id == card.id}">Selected</c:if>>${card.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>   
                            </table>
                            <div class="form-group">
                                <label>Create Date</label>
                                <input name="createdate" type="text" value="${p.createdate}" class="form-control" readonly/>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <c:if test="${p.status == true}">
                                    <input type="radio" name="status" value="ON" checked/> ACTIVE
                                    <input type="radio" name="status" value="OFF"> INACTIVE
                                </c:if>
                                <c:if test="${p.status == false}">                        
                                    <input type="radio" name="status" value="ON"/> ACTIVE
                                    <input type="radio" name="status" value="OFF" style="margin-right: 20px" checked/> INACTIVE 
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>Modify Date</label>
                                <input name="createdate" type="text" value="${p.modifydate}" class="form-control" readonly/>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.product1 != null}">
                            <c:if test="${sessionScope.error != null}">
                                <h5 style="color: red">${sessionScope.error}</h5>
                            </c:if>
                            <c:set value="${sessionScope.product1}" var="p"></c:set>
                                <div class="form-group">
                                    <label>ID</label>
                                    <input name="id" type="text" class="form-control" value="${p.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" value="${p.name}"required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" id="price" value="<fmt:formatNumber pattern="#########" value="${p.price}"/>" required>

                            </div>
                            <div class="form-group">
                                <label>Discount</label>
                                <input name="discount" type="text" class="form-control" id="discount" value="${p.discount}" required>
                            </div> 

                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" id="quantity" value="${p.quantity}" required/>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="file" class="form-control" value="${p.imgURL}"/>
                                <input name="oldimage" value="${p.imgURL}" hidden/>
                                <br>
                                <img src="img/${p.imgURL}" style="width: 100px; height: 90px; max-width: none">

                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" value="" required>${p.description}</textarea>
                            </div>
                            <table>

                                <tr>
                                    <td><label>Brand</label></td>
                                    <td><select name="brand" value="${p.brand.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.brandlist}" var="b">
                                                <option value="${b.id}"<c:if test="${p.brand.id == b.id}">Selected</c:if>>${b.name}</option>
                                        </c:forEach></td>
                                    </select>
                                </tr>
                                <tr>

                                    <td><label>Category</label></td>
                                    <td><select name="category" value="${p.category.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.categorylist}" var="c">
                                                <option value="${c.id}" <c:if test="${p.category.id == c.id}">Selected</c:if>>${c.name}</option>
                                            </c:forEach>
                                        </select></td>

                                </tr>
                                <tr>   
                                    <td><label>OperatingSystem</label></td>
                                    <td> <select name="os" value="${p.os.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.oslist}" var="o">
                                                <option value="${o.id}" <c:if test="${ p.os.id  == o.id}">Selected</c:if>>${o.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>    
                                <tr>
                                    <td> <label>RAM</label> </td>
                                    <td>    <select name="ram" value="${p.ram.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.ramlist}" var="r">
                                                <option value="${r.id}" <c:if test="${p.ram.id == r.id}">Selected</c:if>>${r.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td><label>CPU</label></td>
                                    <td>    <select name="cpu" value="${p.cpu.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.cpulist}" var="cpu">
                                                <option value="${cpu.id}" <c:if test="${p.cpu.id == cpu.id}">Selected</c:if>>${cpu.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>   
                                <tr>   
                                    <td>    <label>Display</label> </td>
                                    <td>    <select name="display" value="${p.display.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.displaylist}" var="d">
                                                <option value="${d.id}" <c:if test="${p.display.id == d.id}">Selected</c:if>>${d.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>    
                                <tr>  
                                    <td><label>Capacity</label></td>
                                    <td>    <select name="capacity" value="${p.capacity.id}" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.capacitylist}" var="cap">
                                                <option value="${cap.id}" <c:if test="${p.capacity.id == cap.id}">Selected</c:if>>${cap.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>   
                                <tr>   
                                    <td><label>Card</label></td>
                                    <td>    <select name="card" value="${p.card.id}"class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.cardlist}" var="card">
                                                <option value="${card.id}" <c:if test="${p.card.id == card.id}">Selected</c:if>>${card.name}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>   
                            </table>
                            <div class="form-group">
                                <label>Create Date</label>
                                <input name="createdate" type="text" value="${p.createdate}" class="form-control" readonly/>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <c:if test="${p.status == true}">
                                    <input type="radio" name="status" value="ON" checked/> ACTIVE
                                    <input type="radio" name="status" value="OFF"> INACTIVE
                                </c:if>
                                <c:if test="${p.status == false}">                        
                                    <input type="radio" name="status" value="ON"/> ACTIVE
                                    <input type="radio" name="status" value="OFF" style="margin-right: 20px" checked/> INACTIVE 
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>Modify Date</label>
                                <input name="createdate" type="text" value="${p.modifydate}" class="form-control" readonly/>
                            </div>
                        </c:if>
                        <div class="modal-footer" style="margin-top: 30px">
                            <a href="productmanage?index=${requestScope.index}"><button type="button" class="btn btn-primary" style="background-color: #e7ab3c;color: white;margin-right: 0%">Back to ListProduct</button></a>
                            <input name="index" value="${requestScope.index}" hidden/>
                            <input onclick="send()" type="submit"  class="btn btn-success" value="SAVE" style="background-color: #e7ab3c;margin-left: 78%">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function send() {
                var price_raw = document.getElementById('price');
                var price = price_raw.value;
                if (isNaN(price)) {
                    alert("price must be number");
                    return;
                }
                if (price < 0) {
                    alert("price must be >= 0");
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
