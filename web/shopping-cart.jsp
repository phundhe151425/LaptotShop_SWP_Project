<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zxx">

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
    </head>

    <body >
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <%--<c:set value="${cart}" var="c"/>--%>
        <%@include file="Components/header.jsp"%>
        <!-- Header End -->

        <!-- Breadcrumb Section Begin -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text product-more">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->

        <!-- Shopping Cart Section Begin -->
        <section class="shopping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cart-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th class="p-name">Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th><i class="ti-close"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                <c:forEach items="${c.item}" var="i">

                                    <tr>
                                        <td class="cart-pic first-row"><img src="img/${i.product.imgURL}" alt=""></td>
                                        <td class="cart-title first-row">
                                            <h5>${i.product.name}</h5>
                                        </td>
                                        <td class="p-price first-row"><fmt:formatNumber pattern="###,###,###" value="${i.product.saleprice}" />VND</td>
                                        <td class="qua-col first-row">
                                            <div class="quantity">
                                                <!--                                                    <div class="pro-qty">
                                                                                                        <input type="text" value="${i.quantity}">
                                                                                                    </div>-->
                                                <div class="">
                                                    <a href="process?num=-1&id=${i.product.id}"><button class="btn btn-secondary">-</button></a> 
                                                    <strong>${i.quantity}</strong>
                                                    <a href="process?num=1&id=${i.product.id}"><button class="btn btn-secondary">+</button></a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="total-price first-row"><fmt:formatNumber pattern="###,###,###" value="${i.product.saleprice*i.quantity}" />VND</td>

                                    <form action="process" method="post">
                                        <input type="hidden" name="id" value="${i.product.id}"/>
                                        <!--<td class="close-td first-row"><i class="ti-close"></i></td>-->
                                        <td class="close-td first-row"><input class="ti-close" type="submit" value="X"/></td>
                                    </form>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="cart-buttons">
                                    <a href="home" class="primary-btn continue-shop">Continue shopping</a>
                                    <!--<a href="#" class="primary-btn up-cart">Update cart</a>-->
                                </div>
                                <!--                                <div class="discount-coupon">
                                                                    <h6>Discount Codes</h6>
                                                                    <form action="#" class="coupon-form">
                                                                        <input type="text" placeholder="Enter your codes">
                                                                        <button type="submit" class="site-btn coupon-btn">Apply</button>
                                                                    </form>
                                                                </div>-->
                            </div>
                            <div class="col-lg-4 offset-lg-4">
                                <div class="proceed-checkout">
                                    <ul>
                                        <!--<li class="subtotal">Subtotal <span>$240.00</span></li>-->
                                        <li style="font-size: 25px" class="cart-total">Total <span><fmt:formatNumber pattern="###,###,###" value="${c.totalPrice}" />VND</span></li>
                                    </ul>

                                    <a  href="cartcontact" class="proceed-btn">PROCEED TO CHECK OUT</a>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->

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