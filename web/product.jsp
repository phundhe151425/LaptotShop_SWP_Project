<%-- 
    Document   : product
    Created on : Jun 2, 2022, 12:56:46 PM
    Author     : Pham Minh Giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Fashi Template">
        <meta name="keywords" content="Fashi, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fashi Shop</title>

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

        <style>
            .clearfix{
                float: right;
            }
            .pi-pic{
                height: 250px;
            }
            .pi-text{
                height: 200px;
            }

        </style>

    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <%@include file="Components/header.jsp" %>
        <!-- Header End -->

        <!-- Breadcrumb Section Begin -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->

        <!-- Product Shop Section Begin -->
        <section class="product-shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">

                        <!--start sider-->
                        <c:set value="${sessionScope.choice}" var="choice"/>
                        
                        <form id="f" action="filter">

                            <div class="filter-widget">
                                <h4 class="fw-title">Categories</h4>
                                <ul class="filter-catagories">
                                    <div class="fw-brand-check">
                                        <c:forEach items="${sessionScope.categoryList}" var="l">
                                            <c:set value="${l.name}" var="name"/>
                                            <div class="bc-item">
                                                <label >
                                                    <input type="radio" value="${l.name}" name="category" <c:if test="${l.name.equals(requestScope.category)}">checked</c:if> > 
                                                    ${l.name}
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                                    <a href="../../../backup feature SWP/SWP391_OnlineShop/web/productdetails.jsp"></a>
                                        </c:forEach>
                                    </div> 
                                </ul>
                            </div>
                            <div class="filter-widget">
                                <h4 class="fw-title">Brand</h4>
                                <ul class="filter-catagories">
                                    <div class="fw-brand-check">
                                        <c:forEach items="${sessionScope.brandList}" var="l">
                                            <div class="bc-item">
                                                <label >
                                                    ${l.name}
                                                    <input type="radio" name="brand" value="${l.name}" <c:if test="${l.name.equals(requestScope.brand)}">checked</c:if>>
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                        </c:forEach>
                                    </div> 
                                </ul>
                            </div>
                            <div class="filter-widget">
                                <h4 class="fw-title">Display</h4>
                                <ul class="filter-catagories">
                                    <div class="fw-brand-check">
                                        <c:forEach items="${sessionScope.displayList}" var="l">
                                            <div class="bc-item">
                                                <label >
                                                    ${l.name}
                                                    <input type="radio" name="display" value="${l.name}" <c:if test="${l.name.equals(requestScope.display)}">checked</c:if> >
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                        </c:forEach>
                                    </div> 
                                </ul>
                            </div>
                            <div class="filter-widget">
                                <h4 class="fw-title">CPU</h4>
                                <ul class="filter-catagories">
                                    <div class="fw-brand-check">
                                        <c:forEach items="${sessionScope.cpuList}" var="l">
                                            <div class="bc-item">
                                                <label >
                                                    ${l.name}
                                                    <input type="radio" name="cpu" value="${l.name}" <c:if test="${l.name.equals(requestScope.cpuu)}">checked</c:if>>
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                        </c:forEach>
                                    </div> 
                                </ul>
                            </div>
                            <input type="submit" value="FILTER" class="primary-btn">
                        </form>
                        <!--end sider-->

                    </div>
                    <div class="col-lg-9 order-1 order-lg-2">
                        <div class="product-show-option">
                            <div class="row">
                                <div class="col-lg-7 col-md-7">

                                    <div class="select-option">
                                        <form action="sort" id="sort">
                                            <select class="sorting" name="sort" onchange="document.getElementById('sort').submit()">
                                                <option value="0">Default Sorting</option>
                                                <option value="1" <c:if test="${requestScope.sort.equals('1')}">selected</c:if>  >Sort ascending by price</option>
                                                <option value="2" <c:if test="${requestScope.sort.equals('2')}">selected</c:if> >Sort descending by price</option>
                                                <option value="3" <c:if test="${requestScope.sort.equals('3')}">selected</c:if> >Sort ascending by name</option>
                                                <option value="4" <c:if test="${requestScope.sort.equals('4')}">selected</c:if> >Sort descending by name</option>
                                                </select>
                                            </form>
                                        </div>

                                    </div>
                                    <!--                                <div class="col-lg-5 col-md-5 text-right">
                                                                        
                                                                    </div>-->
                                </div>
                            </div>
                            <div class="product-list">
                                <div class="row">
                                <c:forEach items="${sessionScope.productList}" var="p">
                                    <div class="col-lg-4 col-sm-6">
                                        <div class="product-item">
                                            <div class="pi-pic">
                                                <a href="productdetail?id=${p.id}"><img src="img/${p.imgURL}" alt=""></a>
                                                <div class="sale pp-sale">Sale</div>
                                                <div class="icon">
                                                    <i class="icon_heart_alt"></i>
                                                </div>

                                                <ul>
                                                    <li class="w-icon active"><a href="buy?id=${p.id}&num=1&p=product&index=${index}"><i class="icon_bag_alt"></i></a></li>
                                                    <!--                                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a><i class="icon_bag_alt"></i></li>
                                                                                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>-->
                                                </ul>
                                            </div>
                                            <div class="pi-text">
                                                <div class="catagory-name">${p.category.getName()}</div>
                                                <a href="productdetail?id=${p.id}">
                                                    <h5>${p.name}</h5>
                                                </a>
                                                <div class="product-price">
                                                    <fmt:formatNumber pattern="###,###,###" value="${p.saleprice}" /> VND
                                                </div>
                                                <div class="product-price">
                                                    <span><fmt:formatNumber pattern="###,###,###" value="${p.price}" /> VND</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <c:if test="${requestScope.check.equals('list')}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="product?index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item"><a href="product?index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="product?index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${requestScope.check.equals('sort')}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="sort?sort=${requestScope.sort}&index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item"><a href="sort?sort=${requestScope.sort}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="sort?sort=${requestScope.sort}&index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${requestScope.check.equals('filter')}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="filter?category=${category}&brand=${brand}&display=${display}&cpu=${cpuu}&index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item"><a href="filter?category=${category}&brand=${brand}&display=${display}&cpu=${cpuu}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="filter?category=${category}&brand=${brand}&display=${display}&cpu=${cpuu}&index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${requestScope.check.equals('search')}">
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${requestScope.index>1}">
                                        <li class="page-item"><a href="fulltextsearch?search=${search}&index=${index-1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                                        <li class="page-item"><a href="fulltextsearch?search=${search}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${requestScope.index < requestScope.page}">
                                        <li class="page-item"><a href="fulltextsearch?search=${search}&index=${index+1}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </section>
        <!-- Product Shop Section End -->

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
