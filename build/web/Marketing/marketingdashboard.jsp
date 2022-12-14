<%-- 
    Document   : marketingdashboard
    Created on : May 30, 2022, 11:54:52 PM
    Author     : DUC THINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Marketing Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-warning sidebar sidebar-dark accordion" id="accordionSidebar" style="color: gold">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="mktDashboard">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Marketing Dashboard </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="mktDashboard">
                        <span>Dashboard</span></a>
                </li>
                <!-- Divider -->
<!--                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="mktDashboard_Chart">
                        <span>Chart</span></a>
                </li>-->
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="productmanage">
                        <span>Manage Product</span></a>
                </li>
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="postmanage">
                        <span>Manage Post</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="customermanage">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>Manage Customer</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="slidermanage">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>Manage Slider</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="feedbacklist">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>Manage Feedback</span></a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="home">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>Home Page</span></a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="logout">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>LogOut</span></a>
                </li>

                <!-- Heading -->


            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->


                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>


                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.account.name}</span>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>

                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

                        </div>


                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <!--                                <div class="card border-left-success shadow h-100 py-2">
                                                                    <div class="card-body">
                                                                        <div class="row no-gutters align-items-center">
                                                                            <div class="col mr-2">
                                                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                                                    Earnings </div>
                                                                                <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                                                            </div>
                                                                            <div class="col-auto">
                                                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <!--                                <div class="card border-left-info shadow h-100 py-2">
                                                                    <div class="card-body">
                                                                        <div class="row no-gutters align-items-center">
                                                                            <div class="col mr-2">
                                                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                                                                </div>
                                                                                <div class="row no-gutters align-items-center">
                                                                                    <div class="col-auto">
                                                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                                                    </div>
                                                                                    <div class="col">
                                                                                        <div class="progress progress-sm mr-2">
                                                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                                                 style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                                                                 aria-valuemax="100"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-auto">
                                                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                            </div>

                            <!-- Pending Requests Card Example -->
                            <!--                            <div class="col-xl-3 col-md-6 mb-4">
                                                            <div class="card border-left-warning shadow h-100 py-2">
                                                                <div class="card-body">
                                                                    <div class="row no-gutters align-items-center">
                                                                        <div class="col mr-2">
                                                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                                                Total Orders Success</div>
                                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                                                        </div>
                                                                        <div class="col-auto">
                                                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>

                        <!-- Content Row -->

                        <div class="row">
                            <form action="marketingdashboard" method="post" style="display: flex ">
                                <div style="float: right">
                                    <b>Year</b>
                                    <!--onchange="this.form.submit()"-->
                                    <select name="year" >
                                        <c:forEach var="i" begin="1990" end="2026">
                                            <option ${i==year?"selected":""} value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>
                                    <b>Month</b><select name="month" >
                                        <c:forEach var="i" begin="1" end="12">
                                            <option ${i==month?"selected":""} value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>
                                    <b>Start Day</b><select name="from" >
                                        <c:forEach var="i" begin="1" end="31">
                                            <option ${i==startDay?"selected":""} value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>
                                    <b>End Day</b><select name="to" >
                                        <c:forEach var="i" begin="1" end="31">
                                            <option ${i==endDay?"selected":""} value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <input class="btn" type="submit" value="Filter">
                            </form> 
                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7" style="width: 100%">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Total Product each day</h6>
                                        <div class="dropdown no-arrow">

                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-area" >

                                            <canvas id="myChart" width="1504px" height="340px"></canvas>
                                            <script>
                                                const ctx = document.getElementById('myChart').getContext('2d');
                                                const myChart = new Chart(ctx, {
                                                    type: 'bar',
                                                    data: {
                                                        labels: ${listday},
                                                        datasets: [{
                                                                label: 'Quantity',
                                                                data: ${listquantity},
                                                                backgroundColor: [
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)'
                                                                ],
                                                                borderColor: [
                                                                    'rgba(255, 99, 132, 1)',
                                                                    'rgba(54, 162, 235, 1)',
                                                                    'rgba(255, 206, 86, 1)',
                                                                    'rgba(75, 192, 192, 1)',
                                                                    'rgba(153, 102, 255, 1)',
                                                                    'rgba(255, 159, 64, 1)'
                                                                ],
                                                                borderWidth: 1
                                                            }]
                                                    },
                                                    options: {
                                                        legend: {display: false},
                                                        scales: {
                                                            yAxes: [{ticks: {min: 6, max: 16}}],
                                                        }
                                                    }
                                                });
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pie Chart -->
                            <!--                            <div class="col-xl-4 col-lg-5">
                                                            <div class="card shadow mb-4">
                                                                 Card Header - Dropdown 
                                                                <div
                                                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                                                    <div class="dropdown no-arrow">
                                                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                                             aria-labelledby="dropdownMenuLink">
                                                                            <div class="dropdown-header">Dropdown Header:</div>
                                                                            <a class="dropdown-item" href="#">Action</a>
                                                                            <a class="dropdown-item" href="#">Another action</a>
                                                                            <div class="dropdown-divider"></div>
                                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                 Card Body 
                                                                <div class="card-body">
                                                                    <div class="chart-pie pt-4 pb-2">
                                                                        <canvas id="myPieChart"></canvas>
                                                                    </div>
                                                                    <div class="mt-4 text-center small">
                                                                        <span class="mr-2">
                                                                            <i class="fas fa-circle text-primary"></i> Direct
                                                                        </span>
                                                                        <span class="mr-2">
                                                                            <i class="fas fa-circle text-success"></i> Social
                                                                        </span>
                                                                        <span class="mr-2">
                                                                            <i class="fas fa-circle text-info"></i> Referral
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Content Column -->
                            <div class="col-lg-6 mb-4">

                                <!-- Project Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Top Customer Buy Most</h6>
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>                                                  
                                                    <th scope="col">Full Name</th>
                                                    <th scope="col">Address</th><!--
                                                    -->                                                    <th scope="col">Email</th>
                                                    <th scope="col">Phone Number</th><!--
                                                    -->                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="a" items="${listaccount}">
                                                    <tr>
                                                        <td scope="row"><b>${a.accountID}</b></td>
                                                        <td><b>${a.name}</b></td>
                                                        <td><b>${a.address}</b></td>    
                                                        <td>${a.email}</td>
                                                        <td>${a.phone}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Color System -->


                            </div>

                            <div class="col-lg-6 mb-4">

                                <!-- Project Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Top Product Bought Most</h6>
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Image</th>
                                                    <th scope="col">Product Name</th>
                                                    <th scope="col">Brand</th>
                                                    <th scope="col">Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="i" items="${listproduct}">
                                                    <tr>
                                                        <th scope="row"><b>${i.id}</b></th>
                                                        <td><img  src="img/${i.imgURL}" alt="" width="50" height="50"></td>
                                                        <td><b>${i.name}</b></td>
                                                        <td><b>${i.brand.name}</b></td>
                                                        <td><b><fmt:formatNumber pattern="###,###,###"value="${i.price}"/>VND </b></td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Color System -->


                            </div>

                            <div class="col-lg-6 mb-4">

                                <!-- Illustrations -->
                                <!--                                <div class="card shadow mb-4">
                                                                    <div class="card-header py-3">
                                                                        <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <div class="text-center">
                                                                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                                                                 src="img/undraw_posting_photo.svg" alt="...">
                                                                        </div>
                                                                        <p>Add some quality, svg illustrations to your project courtesy of <a
                                                                                target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
                                                                            constantly updated collection of beautiful svg images that you can use
                                                                            completely free and without attribution!</p>
                                                                        <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
                                                                            unDraw &rarr;</a>
                                                                    </div>
                                                                </div>-->

                                <!-- Approach -->
                                <!--                                <div class="card shadow mb-4">
                                                                    <div class="card-header py-3">
                                                                        <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                                                                            CSS bloat and poor page performance. Custom CSS classes are used to create
                                                                            custom components and custom utility classes.</p>
                                                                        <p class="mb-0">Before working with this theme, you should become familiar with the
                                                                            Bootstrap framework, especially the utility classes.</p>
                                                                    </div>
                                                                </div>-->

                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">??</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>

    </body>

</html>