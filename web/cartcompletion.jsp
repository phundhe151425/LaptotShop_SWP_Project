<%-- 
    Document   : cartcompletion
    Created on : Jun 17, 2022, 2:28:11 AM
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
            .successfull{
                text-align: center;
            }
            .successfull img{
                height: 50px;
                width: 50px;
            }
            .successfull h3{
                color: green; 
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <%@include file="Components/header.jsp" %>
        <c:set value="${sessionScope.temp_ac}" var="ta"/>
        <div class="successfull">
            <div>
                <img  src="img\tick-xanh.png" alt="">
            </div>
            <div>
                <h3>Successfull Order</h3>
            </div>
        </div>
        <!--<img style="height: 50px; width: 50px;  margin-left: 820px; margin-top: 30px"src="img\tick-xanh.png" alt="">-->
        <!--<h3 style="color: green; font-weight: bold; text-align: center">Successfull Order</h3>-->
        <h5 style="margin-left: 10px">Thank you for choosing to buy products from our store!</h5>
        <h4 style="background-color: #E5E5E5; margin-top: 20px; margin-left: 10px;margin-right: 10px">Your Order Information</h4>
        <div style="font-weight: bold; margin-left: 30px; margin-top: 20px">
            OrderID: ${requestScope.orderid}<br>
            Name: ${ta.name}<br>
            Address: ${ta.address}<br>
            Email: ${ta.email}<br>
            Phone: ${ta.phone}
        </div>
        <p style="color: red;margin-left: 30px;font-weight: bold">Total Price: <fmt:formatNumber pattern="###,###,###" value="${requestScope.totalprice}" /> VND</p>


        <h4 style="background-color: #E5E5E5; margin-top: 20px; margin-bottom: 20px; margin-left: 10px;margin-right: 10px">Purchased Products</h4>
        <div class="cart-table">
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th> 
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listorder}" var="o">
                        <tr>
                            <td class="first-row" style="width: 200px ;height: 200px"><img src="img/${o.imgURL}" alt=""></td>
                            <td >
                                <h5>${o.nameProduct}</h5>
                            </td>
                            <td class="p-price first-row"><fmt:formatNumber pattern="###,###,###" value="${o.price}" />VND</td>
                            <td class="qua-col first-row">
                                <div class="quantity">

                                    <div class="">

                                        <strong>${o.quantity}</strong>

                                    </div>
                                </div>
                            </td>
                            <td class="total-price first-row"><fmt:formatNumber pattern="###,###,###" value="${o.price*o.quantity}" />VND</td>



                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="cart-buttons">
                <a href="home" class="primary-btn continue-shop">Continue shopping</a>
            </div>
        </div>
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
    </body>
</html>