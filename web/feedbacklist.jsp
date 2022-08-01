<%-- 
    Document   : feedbacklist
    Created on : Jun 20, 2022, 9:54:44 PM
    Author     : MSI
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/JNKKKK/MoreToggles.css@0.2.1/output/moretoggles.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

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




            .inner-header{
                display: none;
            }


            /*css button on/off*/
            /*            .switch {
                            position: relative;
                            display: inline-block;
                            width: 60px;
                            height: 34px;
                            margin: 20px;
                        }
            
                        .switch input {display:none;}
            
                        .slider {
                            position: absolute;
                            cursor: pointer;
                            top: 0;
                            left: 0;
                            right: 0;
                            bottom: 0;
                            background-color: #ccc;
                            -webkit-transition: .4s;
                            transition: .4s;
                        }
            
                        .slider:before {
                            position: absolute;
                            content: "";
                            height: 26px;
                            width: 26px;
                            left: 4px;
                            bottom: 4px;
                            background-color: white;
                            -webkit-transition: .4s;
                            transition: .4s;
                        }
            
                        input:checked + .slider {
                            background-color:  #e7ab3c;
                        }
            
                        input:focus + .slider {
                            box-shadow: 0 0 1px #2196F3;
                        }
            
                        input:checked + .slider:before {
                            -webkit-transform: translateX(26px);
                            -ms-transform: translateX(26px);
                            transform: translateX(26px);
                        }
            
                         Rounded sliders 
                        .slider.round {
                            border-radius: 34px;
                        }
            
                        .slider.round:before {
                            border-radius: 50%;
                        }*/
            /*end button*/

            .myorder{
                color: green;
                text-align: center;
                margin-top: 30px;
                margin-bottom: 30px;
            }
            .table{
                width: 100%;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                border-collapse: collapse;
                border: 50px;
                border-color: black;
                border-width: 10px;
            }
            .clearfix{
                margin-left:   1000px;
                margin-top: 20px;
                margin-bottom: 50px;
            }

            .aaa{
                color: black;
                padding-top: 10px;
                padding-bottom: 70px;
                alignment-baseline: hanging;

            }
            a:hover{
                color: #e7ab3c;
            }




            input[type="radio"] {
                display:none;
            }
            input[type="radio"] + label {
                font-family:Arial, sans-serif;
                font-size:14px;
            }
            input[type="radio"] + label span {
                display:inline-block;
                width:19px;
                height:19px;
                margin:-1px 4px 0 0;
                vertical-align:middle;
                cursor:pointer;
                -moz-border-radius:  50%;
                border-radius:  50%;
            }

            input[type="radio"] + label span {
                background-color:#a3a19b;
            }

            input[type="radio"]:checked + label span{
                background-color:#54cc54;
            }

            input[type="radio"] + label span,
            input[type="radio"]:checked + label span {
                -webkit-transition:background-color 0.4s linear;
                -o-transition:background-color 0.4s linear;
                -moz-transition:background-color 0.4s linear;
                transition:background-color 0.4s linear;
            }


            /* search */
            .searchbar{
                margin-bottom: auto;
                margin-top: auto;
                height: 60px;
                background-color: #e7ab3c;
                border-radius: 30px;
                padding: 10px;
            }

            .search_input{
                color: white;
                border: 0;
                outline: 0;
                background: none;
                width: 0;
                caret-color:transparent;
                line-height: 40px;
                transition: width 0.4s linear;
            }

            .searchbar:hover > .search_input{
                padding: 0 10px;
                width: 450px;
                caret-color:red;
                transition: width 0.4s linear;
            }

            .searchbar:hover > .search_icon{
                background: white;
                color: #e74c3c;
            }

            .search_icon{
                height: 40px;
                width: 40px;
                float: right;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                color:white;
                text-decoration:none;
            }


        </style>
        
        <script>
            function doChange() {
                if (confirm("Are you sure to change status of this Feedback?")) {
                    document.getElementById("status").submit();
                }
            }
        </script>

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
        <!--        <div class="breacrumb-section">
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
                </div>-->

        <!-- Breadcrumb Section Begin -->
        <div style="text-align: center; padding: 16px; margin-top: 20px; margin-left: 40%;margin-right: 40%; background-color: #e7ab3c;">
            <h3 style="font-weight: 800; color: white">FEEDBACK LIST</h3>
        </div>

        <!-- Product Shop Section Begin -->
        <section class="product-shop spad">
            <div class="container">
                <!--<div class="row">-->
                <!--<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">-->



                <!--</div>-->
                <!--<div class="col-lg-9 order-1 order-lg-2">-->
                <div class="product-show-option">
                    <div class="row">
                        <div class="col-lg-7 col-md-7">

                            <div class="select-option">
                                <form action="sortfb" id="filter">
                                    <select class="sorting" name="sort" onchange="document.getElementById('filter').submit()">
                                        <option value="">Default Sorting</option>
                                        <option value="1" <c:if test="${requestScope.sort.equals('1')}">selected</c:if>  >Sort ascending by Product ID</option>
                                        <option value="2" <c:if test="${requestScope.sort.equals('2')}">selected</c:if> >Sort descending by Product ID</option>
                                        <option value="3" <c:if test="${requestScope.sort.equals('3')}">selected</c:if> >Sort ascending by Date</option>
                                        <option value="4" <c:if test="${requestScope.sort.equals('4')}">selected</c:if> >Sort descending by Date</option>
                                        </select>
                                    </form>

                                    <form  action="filterstatus" id="filterstatus">

                                        <select class="sorting" name="fstatus" onchange="document.getElementById('filterstatus').submit()">
                                            <option value="">Status</option>
                                            <option value="1" <c:if test="${requestScope.fstatus.equals('1')}">selected</c:if> >Display</option>
                                        <option value="2" <c:if test="${requestScope.fstatus.equals('2')}">selected</c:if> >Hide</option>

                                        </select>
                                    </form> 

                                </div>

                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                                <div class="container h-100">
                                    <div class="d-flex justify-content-center h-100">
                                        <form action="searchfb" id="search" >
                                            <div class="searchbar">                 
                                                <input class="search_input" type="text" name="search" value="${requestScope.search}" placeholder="Search...">
                                            <a onclick="document.getElementById('search').submit()" class="search_icon"><i class="fas fa-search"></i></a>
                                            <!--<button type="submit" class="search_icon fas fa-search"></button>-->
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-list">
                    <div class="row">

                        <!--<div class="col-lg-4 col-sm-6">-->
                        <table  style="border-width: 10px;" class="table table-striped table-hover" >
                            <thead>
                                <tr> 

                                    <!--<th>Feedback ID</th>-->
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <!--<th>Account ID</th>-->
                                    <th>Account Name</th>
                                    <th>Phone</th>
                                    <th>Content</th>
                                    <th>Created Date</th>
                                    <th>Display</th>

                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${requestScope.listFeedback}" var="fb">
                                    <tr>
                                        <td>${fb.product.id}</td>
                                        <td><a class="aaa"  href="feedbackdetail?id=${fb.feedbackID}">${fb.product.name}</a></td>
                                    <!--<td>${fb.account.accountID}</td>-->
                                        <td><a class="aaa" href="feedbackdetail?id=${fb.feedbackID}">${fb.account.name}</a></td>
                                        <td><a class="aaa" href="feedbackdetail?id=${fb.feedbackID}">${fb.account.phone}</a></td>
                                        <td><a class="aaa" href="feedbackdetail?id=${fb.feedbackID}">${fb.content}</a></td>
                                        <td><a class="aaa" href="feedbackdetail?id=${fb.feedbackID}">${fb.createdDate}</a></td>
                                        <td>
                                            <form action="feedbacklist" method="post" id="status" >
                                                <c:if test="${fb.status==true}">
                                                    <input type="hidden" value="0" name="status">
                                                    <input type="hidden" value="${fb.feedbackID}" name="id">
                                                    <button onclick="doChange()" type="submit" class="site-btn login-btn"> Hide </button>
                                                </c:if>
                                                <c:if test="${fb.status==false}">
                                                    <input type="hidden" value="1" name="status">
                                                    <input type="hidden" value="${fb.feedbackID}" name="id">
                                                    <button onclick="doChange()" type="submit" class="site-btn login-btn">Display</button>
                                                </c:if>
                                            </form>


                                        </td>

                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <!--</div>-->
                    </div>
                    <!--</div>-->
                    <div class="clearfix">
                        <c:if test="${requestScope.check.equals('list')}">
                            <ul class="pagination">
                                <c:if test="${requestScope.index>1}">
                                    <li class="page-item"><a href="feedbacklist?index=${index-1}" class="page-link">Previous</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${requestScope.page}" var="i">
                                    <li class="page-item" class="${i==index?"active":""}"><a href="feedbacklist?index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${requestScope.index < requestScope.page}">
                                    <li class="page-item"><a href="feedbacklist?index=${index+1}" class="page-link">Next</a></li>
                                    </c:if>
                            </ul>
                        </c:if>
                        <c:if test="${requestScope.check.equals('sort')}">
                            <ul class="pagination">
                                <c:if test="${requestScope.index>1}">
                                    <li class="page-item"><a href="sortfb?sort=${requestScope.sort}&index=${index-1}" class="page-link">Previous</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${requestScope.page}" var="i">
                                    <li class="page-item" class="${i==index?"active":""}"><a href="sortfb?sort=${requestScope.sort}&index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${requestScope.index < requestScope.page}">
                                    <li class="page-item"><a href="sortfb?sort=${requestScope.sort}&index=${index+1}" class="page-link">Next</a></li>
                                    </c:if>
                            </ul>
                        </c:if>
                        <c:if test="${requestScope.check.equals('fstatus')}">
                            <ul class="pagination">
                                <c:if test="${requestScope.index>1}">
                                    <li class="page-item"><a href="filterstatus?fstatus=${requestScope.fstatus}&index=${index-1}" class="page-link">Previous</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${requestScope.page}" var="i">
                                    <li class="page-item" class="${i==index?"active":""}"><a href="filterstatus?fstatus=${requestScope.fstatus}&index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${requestScope.index < requestScope.page}">
                                    <li class="page-item"><a href="filterstatus?fstatus=${requestScope.fstatus}&index=${index+1}" class="page-link">Next</a></li>
                                    </c:if>
                            </ul>
                        </c:if>
                        <c:if test="${requestScope.check.equals('search')}">
                            <ul class="pagination">
                                <c:if test="${requestScope.index>1}">
                                    <li class="page-item"><a href="searchfb?search=${requestScope.search}&index=${index-1}" class="page-link">Previous</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${requestScope.page}" var="i">
                                    <li class="page-item" class="${i==index?"active":""}"><a href="searchfb?search=${requestScope.search}&index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${requestScope.index < requestScope.page}">
                                    <li class="page-item"><a href="searchfb?search=${requestScope.search}&index=${index+1}" class="page-link">Next</a></li>
                                    </c:if>
                            </ul>
                        </c:if>
                    </div>
                </div>
                <!--</div>-->
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
