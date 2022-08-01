<%-- 
    Document   : feedbackdetail
    Created on : Jun 25, 2022, 11:01:25 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User Detail</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../css/manager.css" rel="stylesheet" type="text/css"/>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/JNKKKK/MoreToggles.css@0.2.1/output/moretoggles.min.css">
        <style>
            img{
                width: 200px;
                height: 120px;
            }
            div{
                text-align: center;
            }
            table{
                text-align: center;
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
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Feedback Detail</h1>
            <div>
                <c:set value="${requestScope.feedback}" var="fb"></c:set>
                    <form action="feedbackdetail" method="post">
                        <div>
                            <table style="border-width: 10px;" class="table table-striped table-hover">
                                <tr>
                                    <td>Feedback ID</td>
                                    <td>${fb.feedbackID}
                                    <input name="id" value="${fb.feedbackID}" hidden=""/></td>
                            </tr>
                            <tr>
                                <td>Product ID</td>
                                <td>${fb.product.id}</td>
                            </tr>
                            <tr>
                                <td>Product Name</td>
                                <td>${fb.product.name}</td>
                            </tr>
                            <tr>
                                <td>Account Name</td>
                                <td>${fb.account.name}</td>
                            </tr>
                            <tr>
                                <td>Account Phone</td>
                                <td>${fb.account.phone}</td>
                            </tr>
                            <tr>
                                <td>Feedback Content</td>
                                <td>${fb.content}</td>
                            </tr>
                            <tr>
                                <td>Created Date</td>
                                <td>${fb.createdDate}</td>
                            </tr>


                            <tr>
                                <td>Status</td>
                                <td>
                                    <select name="status">
                                        <c:if test="${fb.status==true}">
                                            <option value="1">Display</option>
                                            <option value="0">Hide</option>               
                                        </c:if>
                                        <c:if test="${fb.status==false}">
                                            <option value="0">Hide</option>
                                            <option value="1">Display</option>
                                        </c:if>

                                    </select>
                                </td>
                            </tr>
                        </table>  
                    </div>
                    <!--<input type="submit" value="Save Change" /><br/>-->
                    <div>
                        <button type="submit" class="site-btn login-btn">Save Change</button>
                    </div>
                    <br>


                </form>
                <div>
                    <a href="feedbacklist" ><button type="submit" class="site-btn login-btn">Back Feedback List</button></a>
                </div>
            </div>
        </div>

        <script src="../js/manager.js" type="text/javascript"></script>
    </body>
</html>
