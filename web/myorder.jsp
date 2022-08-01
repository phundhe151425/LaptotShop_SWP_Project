<%-- 
    Document   : myorder
    Created on : Jun 15, 2022, 9:44:06 AM
    Author     : Pham Minh Giang
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
            .myorder{
                color: green;
                text-align: center;
                margin-top: 30px;
                margin-bottom: 30px;
            }
            .table{
                width: 85%;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            .clearfix{
                margin-left:   1200px;
                margin-top: 20px;
                margin-bottom: 50px;
            }

        </style>
    </head>
    <body>
        <!--header-->
        <%@include file="Components/header.jsp" %>
        <!--end header-->

        <!--body-->
        <h2 class="myorder">My Order</h2>
        <div class="row">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Total money</th>
                        <th>Note</th>
                        <th>Status</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.orderList}" var="o">
                        <tr>
                            <td>${o.getOrderID()}</td>
                            <td>${o.getDate()}</td>
                            <td>${o.getName()}</td>
                            <td>${o.getAddress()}</td>
                            <td>${o.getPhone()}</td>
                            <td>${o.getEmail()}</td>
                            <td><fmt:formatNumber pattern="###,###,###" value="${o.getMoney()}" /> VND</td>
                            <td>${o.getNote()}</td>
                            <td>
                                <c:if test="${o.isStatus()== true}">Successful</c:if>
                                <c:if test="${o.isStatus()== false}">Fail</c:if>
                                </td>
                                <td> <a href="orderdetail?id=${o.getOrderID()}">Detail</a> </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="clearfix">
                <ul class="pagination">
                    <c:if test="${requestScope.index>1}">
                        <li class="page-item"><a href="myorder?AccountID=${sessionScope.account.accountID}&index=${index-1}" class="page-link">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${requestScope.page}" var="i">
                        <li class="page-item"><a href="myorder?AccountID=${sessionScope.account.accountID}&index=${i}" class="page-link">${i}</a></li>
                        </c:forEach>
                        <c:if test="${requestScope.index < requestScope.page}">
                        <li class="page-item"><a href="myorder?AccountID=${sessionScope.account.accountID}&index=${index+1}" class="page-link">Next</a></li>
                        </c:if>
                </ul>
            </div>
        </div>

        <!--end body-->

        <!--footer-->
        <%@include file="Components/footer.jsp" %>
        <!--end footer-->

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
        <script src="js/manager.js" type="text/javascript"></script>

    </body>
</html>
