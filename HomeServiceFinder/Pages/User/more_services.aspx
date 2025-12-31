<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="more_services.aspx.cs" Inherits="HomeServiceFinder.Pages.User.more_services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Apex - All Services</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <link href="img/favicon.ico" rel="icon" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Poppins:wght@600;700&display=swap" rel="stylesheet" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <link href="css/style.css" rel="stylesheet" />

    <style>
        .service-link {
            text-decoration: none;
            color: inherit;
            display: block;
            height: 100%;
        }

        .service-item {
            cursor: pointer;
            transition: transform 0.3s;
        }

            .service-item:hover {
                transform: translateY(-5px);
            }
        /* Hide Page 2 initially */
        #service-page-2 {
            display: none;
        }

        .page-link {
            cursor: pointer;
            color: var(--primary);
        }

        .page-item.active .page-link {
            background-color: var(--primary);
            border-color: var(--primary);
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <div class="container-fluid bg-light p-0">
            <div class="row gx-0 d-none d-lg-flex">
                <div class="col-lg-7 px-5 text-start">
                    <div class="h-100 d-inline-flex align-items-center border-start border-end px-3">
                        <small class="fa fa-phone-alt me-2"></small>
                        <small>+012 345 6789</small>
                    </div>
                    <div class="h-100 d-inline-flex align-items-center border-end px-3">
                        <small class="far fa-envelope-open me-2"></small>
                        <small>info@example.com</small>
                    </div>
                    <div class="h-100 d-inline-flex align-items-center border-end px-3">
                        <small class="far fa-clock me-2"></small>
                        <small>Mon - Fri : 09 AM - 09 PM</small>
                    </div>
                </div>
                <div class="col-lg-5 px-5 text-end">
                    <div class="h-100 d-inline-flex align-items-center">
                        <a class="btn btn-square border-end border-start" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square border-end" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-square border-end" href=""><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-square border-end" href=""><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
            <a href="index.aspx" class="navbar-brand d-flex align-items-center">
                <h1 class="m-0"><i class="fa fa-building text-primary me-3"></i>APEX</h1>
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-3 py-lg-0">
                    <a href="user_dashboard.aspx" class="nav-item nav-link">Home</a>
                    <a href="service.aspx" class="nav-item nav-link active">Our Services</a>
                    <a href="service_provider.aspx" class="nav-item nav-link">providers</a>
                    <a href="profile.aspx" class="nav-item nav-link">Profile</a>
                    <a href="user_booking.aspx" class="nav-item nav-link">Booking History</a>
                    <a href="about_us.aspx" class="nav-item nav-link">About Us</a>
                </div>
            </div>
        </nav>
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-4 text-white animated slideInDown mb-4">Explore All Services</h1>

            </div>
        </div>
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <div class="border-start border-5 border-primary ps-4 mb-5" style="display: inline-block; text-align: left;">
                        <h6 class="text-body text-uppercase mb-2">Our Services</h6>
                        <h1 class="display-6 mb-0">We Provide 12+ Professional Services</h1>
                    </div>
                </div>

                <div id="service-page-1" class="row g-4 justify-content-center">
                    <asp:Repeater ID="rptWorkers" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="<%# (Container.ItemIndex % 3) * 0.2 %>s">
                                <a href="equipment.aspx?sid=<%# Eval("Service_ID") %>" class="service-link">
                                    <div class="service-item bg-light overflow-hidden h-100">
                                        <img class="img-fluid" src="img/service-1.jpg" alt="" />
                                        <div class="service-text position-relative text-center h-100 p-4">
                                            <h4 class="mb-3">
                                                <%# Eval("Service_Name") %>
                                            </h4>
                                            <div class="btn btn-primary py-2 px-4">View Equipments</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Label ID="lblMessage" Text="" runat="server"></asp:Label>
                </div>

                <div class="row wow fadeInUp" data-wow-delay="0.8s">
                    <div class="col-12 text-center mt-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <li class="page-item" id="btn-prev">
                                    <a class="page-link" onclick="switchPage(1)">Previous</a>
                                </li>
                                <li class="page-item active" id="btn-1">
                                    <a class="page-link" onclick="switchPage(1)">1</a>
                                </li>
                                <li class="page-item" id="btn-2">
                                    <a class="page-link" onclick="switchPage(2)">2</a>
                                </li>
                                <li class="page-item" id="btn-next">
                                    <a class="page-link" onclick="switchPage(2)">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>

            </div>
        </div>
        <div class="container-fluid bg-dark footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h1 class="text-white mb-4"><i class="fa fa-building text-primary me-3"></i>APEX</h1>
                        <p>Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-square btn-outline-primary me-1" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-square btn-outline-primary me-1" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-square btn-outline-primary me-1" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-square btn-outline-primary me-0" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-light mb-4">Address</h4>
                        <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-light mb-4">Quick Links</h4>
                        <a class="btn btn-link" href="about.aspx">About Us</a>
                        <a class="btn btn-link" href="profile.aspx">Profile</a>
                        <a class="btn btn-link" href="service.aspx">Our Services</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Newsletter</h4>
                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email" />
                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a href="#">Your Site Name</a>, All Right Reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                    </div>
                </div>
            </div>
        </div>
        </div>

    </form>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <script src="js/main.js"></script>

    <script>
        function switchPage(pageNum) {
            if (pageNum === 1) {
                // Show Page 1, Hide Page 2
                document.getElementById('service-page-1').style.display = 'flex';
                document.getElementById('service-page-2').style.display = 'none';

                // Update Buttons
                document.getElementById('btn-1').classList.add('active');
                document.getElementById('btn-2').classList.remove('active');

                // Manage Prev/Next state
                document.getElementById('btn-prev').classList.add('disabled');
                document.getElementById('btn-next').classList.remove('disabled');
            } else {
                // Show Page 2, Hide Page 1
                document.getElementById('service-page-1').style.display = 'none';
                document.getElementById('service-page-2').style.display = 'flex';

                // Update Buttons
                document.getElementById('btn-1').classList.remove('active');
                document.getElementById('btn-2').classList.add('active');

                // Manage Prev/Next state
                document.getElementById('btn-prev').classList.remove('disabled');
                document.getElementById('btn-next').classList.add('disabled');
            }

            // Optional: Scroll back to top of list smoothly
            // window.scrollTo({ top: 300, behavior: 'smooth' });
        }
    </script>
</body>
</html>
