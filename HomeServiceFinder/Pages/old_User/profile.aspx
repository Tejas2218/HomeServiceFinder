<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HomeServiceFinder.Pages.User.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Apex - My Profile</title>
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
        .profile-img-container {
            position: relative;
            width: 150px;
            height: 150px;
            margin: 0 auto;
        }

            .profile-img-container img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border: 5px solid #fff;
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            }

        .profile-card {
            border-top: 5px solid var(--primary);
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary);
            box-shadow: none;
        }
        /* Style for the ReadOnly Email field to look disabled */
        .form-control[readonly] {
            background-color: #e9ecef;
            opacity: 1;
            cursor: not-allowed;
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
                        <small class="far fa-user me-2"></small>
                        <small>Welcome, User</small>
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
            <a href="user_dashboard.aspx" class="navbar-brand d-flex align-items-center">
                <h1 class="m-0"><i class="fa fa-building text-primary me-3"></i>APEX</h1>
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-3 py-lg-0">
                    <a href="user_dashboard.aspx" class="nav-item nav-link">Home</a>
                    <a href="service.aspx" class="nav-item nav-link">Our Services</a>
                    <a href="profile.aspx" class="nav-item nav-link active">Profile</a>
                    <a href="user_booking.aspx" class="nav-item nav-link">Booking History</a>
                    <a href="about_us.aspx" class="nav-item nav-link">About Us</a>
                </div>
            </div>
        </nav>
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-4 text-white animated slideInDown mb-4">My Profile</h1>

            </div>
        </div>
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">

                    <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="bg-light p-4 profile-card shadow-sm text-center h-100">
                            <div class="profile-img-container rounded-circle mb-3">
                                <img src="img/team-1.jpg" alt="User Image" class="rounded-circle" />
                            </div>
                            <h4 class="mb-1"><asp:Literal ID="ltName" runat="server"></asp:Literal></h4>

                            <div class="d-flex justify-content-center mb-4">
                                <button type="button" class="btn btn-outline-primary btn-sm me-2">Change Photo</button>
                            </div>

                            <hr />

                            <div class="text-start mt-4">
                                <p class="mb-2">
                                    <strong class="text-dark">
                                        <i class="fa fa-envelope text-primary me-2"></i>Email:
                                    </strong>
                                    <asp:Literal ID="ltEmail" runat="server"></asp:Literal>
                                </p>

                                <p class="mb-2">
                                    <strong class="text-dark">
                                        <i class="fa fa-phone-alt text-primary me-2"></i>Phone:
                                    </strong>
                                    <asp:Literal ID="ltPhone" runat="server"></asp:Literal>
                                </p>

                                <p class="mb-2">
                                    <strong class="text-dark">
                                        <i class="fa fa-map-marker-alt text-primary me-2"></i>Location:
                                    </strong>
                                    <asp:Literal ID="ltLocation" runat="server"></asp:Literal>
                                </p>

                                <p class="mb-0">
                                    <strong class="text-dark">
                                        <i class="fa fa-calendar-alt text-primary me-2"></i>Joined:
                                    </strong>
                                    <asp:Literal ID="ltJoined" runat="server"></asp:Literal>
                                </p>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-8 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="bg-light p-5 h-100 shadow-sm border-start border-5 border-primary">
                            <div class="mb-4">
                                <h4 class="text-uppercase mb-1">Edit Profile</h4>
                                <p class="text-muted">Update your personal information</p>
                            </div>

                            <div class="row g-3">

                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Full Name" Text=""></asp:TextBox>
                                        <label for="txtName">Full Name</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Phone Number" Text=""></asp:TextBox>
                                        <label for="txtContact">Phone Number</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" Text="" ReadOnly="true"></asp:TextBox>
                                        <label for="txtEmail">Email Address (Cannot be changed)</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address" Text=""></asp:TextBox>
                                        <label for="txtAddress">Address</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:DropDownList ID="StateList" runat="server" CssClass="form-select" Enabled="False">
                                        </asp:DropDownList>
                                        <label for="ddlState">State</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:DropDownList ID="CityList" runat="server" CssClass="form-select">
                                        </asp:DropDownList>
                                        <label for="ddlCity">City</label>
                                    </div>
                                </div>

                                <div class="col-12 mt-4 mb-4">
                                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn btn-primary py-3 px-5" OnClick="btnUpdate_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary py-3 px-5 ms-2" />
                                </div>

                                <hr class="my-2" />

                                <div class="col-12 mt-2">
                                    <a href="change_password.aspx" class="fw-bold"><i class="fa fa-key me-2"></i>Change Password</a>
                                </div>

                                <div>
                                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                                </div>

                            </div>
                        </div>
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
</body>
</html>
