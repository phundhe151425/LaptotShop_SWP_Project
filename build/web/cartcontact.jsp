<%-- 
    Document   : cartcontact
    Created on : Jun 8, 2022, 8:14:09 PM
    Author     : DUC THINH
--%>

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
    </head>
    <body>
        <%@include file="Components/header.jsp"%>
        <!-- Breadcrumb Section Begin -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text product-more">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->

        <!-- Shopping Cart Section Begin -->
        <section class="checkout-section spad">
            <div class="container">
                <form action="cartcompletion" method="POST" class="checkout-form">
                    <div class="row">
                        <div class="col-lg-6">

                            <c:set value="${sessionScope.account}" var="a"/>
                            <c:set value="${sessionScope.temp_ac}" var="ta"/>
                            <h4>Biiling Details</h4>
                            <c:if test="${sessionScope.errorm != null}">
                                <h3>${sessionScope.errorm}</h3>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <label for="fir">Name<span>*</span></label>
                                        <input type="text" name="name" id="fir" value="${ta.name}">
                                    </div>
                                    <div class="col-lg-12">
                                        <label for="street">Address<span>*</span></label>
                                        <input type="text" name="address" id="street" class="street-first" value="${ta.address}">

                                    </div>
                                    <div class="col-lg-6">
                                        <label for="email">Email Address<span>*</span></label>
                                        <input  readonly type="text" name="email" id="email" value="${ta.email}">
                                    </div>
                                    <div class="col-lg-6">
                                        <label for="phone">Phone<span>*</span></label>
                                        <input type="text" name="phone" id="phone" value="${ta.phone}">
                                    </div>
                                    <div class="col-lg-12">
                                        <label for="Note">Note<span></span></label>
                                        <textarea type="text" name="note" rows="4" cols="62"></textarea>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.errorm == null}">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <label for="fir">Name<span>*</span></label>
                                        <input type="text" name="name" id="fir" value="${a.name}">
                                    </div>
                                    <div class="col-lg-12">
                                        <label for="street">Address<span>*</span></label>
                                        <input type="text" name="address" id="street" class="street-first" value="${a.address}">

                                    </div>
                                    <div class="col-lg-6">
                                        <label for="email">Email Address<span>*</span></label>
                                        <input readonly type="text" name="email" id="email" value="${a.email}">
                                    </div>
                                    <div class="col-lg-6">
                                        <label for="phone">Phone<span>*</span></label>
                                        <input type="text" name="phone" id="phone" value="${a.phone}">
                                    </div>
                                    <div class="col-lg-12">
                                        <label for="Note">Note<span></span></label>
                                        <textarea type="text" name="note" rows="4" cols="62"></textarea>
                                    </div>
                                </div>
                            </c:if>
                            <div class="cart-buttons">
                                <a href="shoppingcart" class="primary-btn continue-shop">Return Cart Detail</a>
                            </div>
                        </div>
                        <div class="col-lg-6">

                            <div class="place-order">
                                <c:set value="${cart}" var="ca"/>
                                <h4>Your Order</h4>
                                <div class="order-total">
                                    <ul class="order-table">
                                        <li>Product <span>Total</span></li>
                                            <c:forEach items="${ca.item}" var="i">
                                            <li class="fw-normal">${i.product.name} x ${i.quantity}<span><fmt:formatNumber pattern="###,###,###" value="${i.product.saleprice}" /> VND</span></li>
                                            </c:forEach>
                                        <li style="font-size: 25px" class="total-price">Total <span><fmt:formatNumber pattern="###,###,###" value="${c.totalPrice}" /> </span></li>
                                    </ul>
                                    <div class="order-btn">
                                        <button type="submit" class="site-btn place-btn">Place Order</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Shopping Cart Section End -->
        <%@include file="Components/footer.jsp"%>
        <script src="path/to/autosize.min.js"></script>
        <script>
            autosize($('textarea'));
        </script>
    </body>
</html>
