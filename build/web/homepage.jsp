<%-- 
    Document   : homepage
    Created on : May 27, 2022, 1:43:11 PM
    Author     : DUC THINH
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>


<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Fashi Template">
        <meta name="keywords" content="Fashi, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Laptot</title>

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
            .pi-pic{
                height: 250px;
            }
            .pi-text{
                height: 200px;
            }
            data-setbg{
                width: 100%;
            }
            .product-slider img{
                height: 240px;
            }
        </style>

    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <!-- Header Section Begin -->
        <%--<c:set value="${cart}" var="c"/>--%>
        <%@include file="Components/header.jsp" %>
        <!-- Header End -->

        <!-- Hero Section Begin -->
        <section class="hero-section">
            <div class="hero-items owl-carousel">
                <!--slide list-->
                <%--<c:forEach items="" var="">--%>
                <!--                <div class="single-hero-items set-bg" data-setbg="https://i0.wp.com/jawwaby.club/wp-content/uploads/2022/05/Best-2-in-1-Laptop-for-2022.jpg?fit=1200%2C630&ssl=1">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <span>Bag,kids</span>
                                                <h1>Our Achievements</h1>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                    incididunt ut labore et dolore</p>
                                                <a href="blog" class="primary-btn">View</a>
                                            </div>
                                        </div>
                                                                <div class="off-card">
                                                                    <h2>Sale <span>50%</span></h2>
                                                                </div>
                                    </div>
                                </div>
                                <div class="single-hero-items set-bg" data-setbg="https://assets1.ignimgs.com/2019/05/17/laptopsmoon-blogroll-1558134085315_160w.jpg?width=1280">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <span>Bag,kids</span>
                                                <h1>Black friday</h1>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                    incididunt ut labore et dolore</p>
                                                <a href="product" class="primary-btn">Shop Now</a>
                                            </div>
                                        </div>
                                        <div class="off-card">
                                            <h2>Sale <span>50%</span></h2>
                                        </div>
                                    </div>
                                </div>-->
                <%--</c:forEach>--%>
                <c:forEach items="${requestScope.slider}" var="s">
                    <c:if test="${s.status == true}">
                        <div class="single-hero-items set-bg" data-setbg="img/${s.imgURL}">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <h1>${s.title}</h1>
                                        <a href="sliderdetails?id=${s.id}" class="primary-btn">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </c:forEach>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <div class="banner-section spad">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="single-banner">
                            <img src="https://cdn.techzones.vn/Data/Sites/1/media/tin-t%E1%BB%A9c-/laptop-gaming-choi-game-cua-asus-hay-msi/laptop-gaming-choi-game-cua-asus-hay-msi-1.jpg?w=1920" alt="">
                            <div class="inner-text">
                                <a href="filter?category=Gaming"><h4>Gaming</h4></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-banner">
                            <img src="https://m.media-amazon.com/images/I/81aO-KQ+MdL._SL1500_.jpg" alt="">
                            <div class="inner-text">
                                <a href="filter?category=Design"><h4>Design</h4></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-banner">
                            <img src="https://m.media-amazon.com/images/I/81hZ0z4l1kS._AC_SL1500_.jpg" alt="">
                            <div class="inner-text">
                                <a href="filter?category=Office"><h4>Office</h4></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Section End -->

        <!-- Women Banner Section Begin -->
        <section class="women-banner spad">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="product-large set-bg" data-setbg="https://images.unsplash.com/photo-1542393545-10f5cde2c810?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bGFwdG9wJTIwY29tcHV0ZXJ8ZW58MHx8MHx8&w=1000&q=80">
                            <h2>Top Selling</h2>
                            <a href="product">Discover More</a>
                        </div>
                    </div>
                    <div class="col-lg-8 offset-lg-1">
                        <div class="filter-control">
                            <ul>
                                <li class="active">Hot Deal</li>
                                <!--                                <li>HandBag</li>
                                                                <li>Shoes</li>
                                                                <li>Accessories</li>-->
                            </ul>
                        </div>
                        <div class="product-slider owl-carousel">
                            <c:forEach items="${requestScope.listSell}" var="l">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <a href="productdetail?id=${l.id}"><img src="img/${l.imgURL}" alt=""></a>
                                        <div class="sale">Hot</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a href="buy?id=${l.id}&num=1&p=home"><i class="icon_bag_alt"></i></a></li>
                                            <!--                                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                                                                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>-->
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">${l.category.getName()}</div>
                                        <a href="productdetail?id=${l.id}">
                                            <h5>${l.name}</h5>
                                        </a>
                                        <div class="product-price">
                                            <fmt:formatNumber pattern="###,###,###" value="${l.saleprice}" /> VND

                                        </div>
                                        <div class="product-price">
                                            <span><fmt:formatNumber pattern="###,###,###" value="${l.price}" /> VND</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Women Banner Section End -->

        <!-- Deal Of The Week Section Begin-->
        <!--        <section class="deal-of-week set-bg spad" data-setbg="img/time-bg.jpg">
                    <div class="container">
                        <div class="col-lg-6 text-center">
                            <div class="section-title">
                                <h2>Deal Of The Week</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed<br /> do ipsum dolor sit amet,
                                    consectetur adipisicing elit </p>
                                <div class="product-price">
                                    $35.00
                                    <span>/ HanBag</span>
                                </div>
                            </div>
                            <div class="countdown-timer" id="countdown">
                                <div class="cd-item">
                                    <span>56</span>
                                    <p>Days</p>
                                </div>
                                <div class="cd-item">
                                    <span>12</span>
                                    <p>Hrs</p>
                                </div>
                                <div class="cd-item">
                                    <span>40</span>
                                    <p>Mins</p>
                                </div>
                                <div class="cd-item">
                                    <span>52</span>
                                    <p>Secs</p>
                                </div>
                            </div>
                            <a href="#" class="primary-btn">Shop Now</a>
                        </div>
                    </div>
                </section>-->
        <!-- Deal Of The Week Section End -->

        <!-- Man Banner Section Begin -->
        <section class="man-banner spad">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="filter-control">
                            <ul>
                                <li class="active">New Product</li>
                                <!--                                <li>HandBag</li>
                                                                <li>Shoes</li>
                                                                <li>Accessories</li>-->
                            </ul>
                        </div>
                        <div class="product-slider owl-carousel">
                            <c:forEach items="${requestScope.listNew}" var="l">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <a href="productdetail?id=${l.id}"><img src="img/${l.imgURL}" alt=""></a>
                                        <div class="sale">New</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a href="buy?id=${l.id}&num=1&p=home"><i class="icon_bag_alt"></i></a></li>
                                            <!--                                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                                                                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>-->
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">${l.category.getName()}</div>
                                        <a href="productdetail?id=${l.id}">
                                            <h5>${l.name}</h5>
                                        </a>
                                        <div class="product-price">
                                            <fmt:formatNumber pattern="###,###,###" value="${l.saleprice}" /> VND

                                        </div>
                                        <div class="product-price">
                                            <span><fmt:formatNumber pattern="###,###,###" value="${l.price}" /> VND</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="product-large set-bg m-large" data-setbg="https://cdn.pixabay.com/photo/2015/09/05/22/40/macbook-925856_1280.jpg">
                            <h2>Top Trending</h2>
                            <a href="product">Discover More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Man Banner Section End -->

        <!-- Instagram Section Begin -->
        <!--        <div class="instagram-photo">
                    <div class="insta-item set-bg" data-setbg="img/insta-1.jpg">
                        <div class="inside-text">
                            <i class="ti-instagram"></i>
                            <h5><a href="#">colorlib_Collection</a></h5>
                        </div>
                    </div>
                    <div class="insta-item set-bg" data-setbg="img/insta-2.jpg">
                        <div class="inside-text">
                            <i class="ti-instagram"></i>
                            <h5><a href="#">colorlib_Collection</a></h5>
                        </div>
                    </div>
                    <div class="insta-item set-bg" data-setbg="img/insta-3.jpg">
                        <div class="inside-text">
                            <i class="ti-instagram"></i>
                            <h5><a href="#">colorlib_Collection</a></h5>
                        </div>
                    </div>
                    <div class="insta-item set-bg" data-setbg="img/insta-4.jpg">
                        <div class="inside-text">
                            <i class="ti-instagram"></i>
                            <h5><a href="#">colorlib_Collection</a></h5>
                        </div>
                    </div>
                    <div class="insta-item set-bg" data-setbg="img/insta-5.jpg">
                        <div class="inside-text">
                            <i class="ti-instagram"></i>
                            <h5><a href="#">colorlib_Collection</a></h5>
                        </div>
                    </div>
                    <div class="insta-item set-bg" data-setbg="img/insta-6.jpg">
                        <div class="inside-text">
                            <i class="ti-instagram"></i>
                            <h5><a href="#">colorlib_Collection</a></h5>
                        </div>
                    </div>
                </div>-->
        <!-- Instagram Section End -->

        <!-- Latest Blog Section Begin -->
        <section class="man-banner spad">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>From The Blog</h2>
                        </div>
                    </div>
                </div>
                <div class="row" >
                    <div class="col-lg-12">
                        <div class="product-slider owl-carousel">
                            <c:forEach items="${requestScope.blog}" var="b">
                                <div class="single-latest-blog">
                                    <img src="img/${b.imgURL}" alt="">
                                    <div class="latest-text">
                                        <div class="tag-list">
                                            <div class="tag-item">
                                                <i class="fa fa-calendar-o"></i>
                                                May 4,2019
                                            </div>
                                            <div class="tag-item">
                                                <i class="fa fa-comment-o"></i>
                                                5
                                            </div>
                                        </div>
                                            <a href="blogdetail?id=${b.id}">
                                                <h4>${b.title}</h4>
                                            </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Latest Blog Section End -->

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

        <!--        <script>
                    function myFunction() {
                        var element = document.body;
                        element.classList.toggle("dark-mode");
                    }
                </script>-->

    </body>
</html>
