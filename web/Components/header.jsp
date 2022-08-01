<%-- 
    Document   : Header
    Created on : May 28, 2022, 1:14:21 AM
    Author     : Pham Minh Giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
                    <a class="login-panel"><i class="fa fa-user"></i>Hello ${sessionScope.account.name}</a>
                </c:if> 
                <!--                <div class="lan-selector">
                                    <label class="switch">
                                        <input type="checkbox" onclick="myFunction()">
                                        <span class="slider round"></span>
                                    </label> 
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

    <div class="container">
        <div class="inner-header">
            <div class="row">
                <!--                <div class="col-lg-2 col-md-2">
                                    <div class="logo">
                                        <a href="home">
                                            <img src="../img/logo.png" alt="">
                                        </a>
                                    </div>
                                </div>-->
                <div class="col-lg-7 col-md-7">
                    <div class="advanced-search">
                        <button type="button" class="category-btn">All Categories</button>

                        <div class="input-group">
                            <form action="fulltextsearch">
                                <input type="text" placeholder="What do you need?" name="search" value="${search}">
                                <button type="submit"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 text-right col-md-3">
                    <ul class="nav-right">
                        <li class="heart-icon">
                            <!--                                    <a href="#">
                                                                    <i class="icon_heart_alt"></i>
                                                                    <span>1</span>
                                                                </a>-->
                        </li>
                        <c:set value="${cart}" var="c"/>

                        <li class="cart-icon">
                            <a href="shoppingcart">
                                <i class="icon_bag_alt"></i>
                                <span>${c.totalQuantity}</span>
                            </a>

                            <div class="cart-hover">
                                <div class="select-items">
                                    <table>
                                        <tbody>
                                            <c:forEach items="${c.item}" var="i">
                                                <tr>
                                                    <td class="si-pic"><img src="img/${i.product.imgURL}" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p><fmt:formatNumber pattern="###,###,###" value="${i.product.saleprice}" /> VND x ${i.quantity}</p>
                                                            <h6>${i.product.name}</h6>
                                                        </div>
                                                    </td>


                                                </tr>
                                            </c:forEach>  

                                        </tbody>
                                    </table>
                                </div>
                                <div class="select-total">
                                    <span>total:</span>
                                    <h5><fmt:formatNumber pattern="###,###,###" value="${c.totalPrice}" /> VND</h5>
                                </div>
                                <div class="select-button">
                                    <a href="shoppingcart" class="primary-btn view-card">VIEW CART</a>
                                    <a href="cartcontact" class="primary-btn checkout-btn">CHECK OUT</a>
                                </div>
                            </div>

                        </li>
                        <!--<li class="cart-price"><fmt:formatNumber pattern="###,###,###" value="${c.totalPrice}" /> VND</li>-->
                    </ul>
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
                    <ul class="depart-hover">
                        <li><a href="filter?category=Gaming">Laptop Gaming</a></li>
                        <li><a href="filter?category=Design">Laptop Design</a></li>
                        <li><a href="filter?category=Office">Laptop Office</a></li>
                        <li><a href="filter?category=Luxury">Laptop Luxury</a></li>
                    </ul>
                </div>
            </div>
            <nav class="nav-menu mobile-menu">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="product">Shop</a></li>
                    <li><a href="blog">Blog</a></li>
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
