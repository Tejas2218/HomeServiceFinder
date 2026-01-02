<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_booking.aspx.cs" Inherits="HomeServiceFinder.Pages.User.user_booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Apex - Appointment History</title>
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <style>
        .history-card {
            border: 1px solid #eee;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            transition: 0.3s;
            background-color: #fff;
        }

            .history-card:hover {
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            }

        .status-badge {
            font-size: 0.85rem;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }

        .status-completed {
            background-color: #d4edda;
            color: #155724;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .loader-overlay {
            display: none;
            position: fixed;
            z-index: 9999;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.7);
            justify-content: center;
            align-items: center;
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
            <a href="index.aspx" class="navbar-brand d-flex align-items-center">
                <h1 class="m-0"><i class="fa fa-building text-primary me-3"></i>APEX</h1>
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-3 py-lg-0">
                    <a href="user_dashboard.aspx" class="nav-item nav-link">Home</a>
                    <a href="service.aspx" class="nav-item nav-link">Our Services</a>
                    <a href="service_provider.aspx" class="nav-item nav-link">providers</a>
                    <a href="profile.aspx" class="nav-item nav-link">Profile</a>
                    <a href="user_booking.aspx" class="nav-item nav-link active">Booking History</a>
                    <a href="about_us.aspx" class="nav-item nav-link">About Us</a>
                </div>
            </div>
        </nav>
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-4 text-white animated slideInDown mb-4">Booking History</h1>
            </div>
        </div>
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="border-start border-5 border-primary ps-4 mb-5">
                            <h6 class="text-body text-uppercase mb-2">Past & Current Bookings</h6>
                            <h1 class="display-6 mb-0">Your Appointment History</h1>
                        </div>

                        <div class="history-card rounded p-4">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead class="table-dark">
                                        <tr>
                                            <th scope="col">Booking ID</th>
                                            <th scope="col">Service Name</th>
                                            <th scope="col">Date & Time</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptBookings" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <strong>#BK-<%# Eval("Booking_ID") %></strong>
                                                    </td>

                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <div class="btn-square bg-light rounded-circle me-2">
                                                                <i class="fa fa-tools text-primary"></i>
                                                            </div>
                                                            <span>Service ID: <%# Eval("Equipment_ID") %></span>
                                                        </div>
                                                    </td>

                                                    <td>
                                                        <%# Convert.ToDateTime(Eval("Visiting_DateTime")).ToString("dd MMM yyyy") %>,
                                    <%# Eval("Time_Slot") %>
                                                    </td>


                                                    <td>
                                                        <span class='status-badge <%# Eval("StatusClass") %>'>
                                                            <%# Eval("Booking_Status") %>
                                                        </span>
                                                    </td>
                                                    <td>

                                                        <asp:Button
                                                            ID="btnAction"
                                                            runat="server"
                                                            Text='<%# Eval("ActionText") %>'
                                                            CssClass='<%# Eval("ActionClass") %>'
                                                            CommandArgument='<%# Eval("Booking_ID") %>'
                                                            OnCommand="btnAction_Command"
                                                            OnClientClick="return confirmCancel();" />


                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                        <asp:Label ID="lblMessage2" runat="server"></asp:Label>
                                    </tbody>

                                </table>
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
                        <a class="btn btn-link" href="contact.aspx">Contact Us</a>
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
        <div id="loaderOverlay" class="loader-overlay">
            <div class="spinner-border text-danger" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="js/main.js"></script>

    <script>
        function confirmCancel() {
            if (!confirm("Are you sure you want to cancel this booking?")) {
                return false;
            }

            document.getElementById("loaderOverlay").style.display = "flex";
            return true; // allow postback
        }
    </script>


    <script type="text/javascript">
        function confirmCancel(button) {
            // Check if the button is actually a 'Cancel' button based on its text
            if (button.value === "Cancel") {
                if (button.dataset.confirmed) {
                    return true;
                }

                Swal.fire({
                    title: 'Are you sure?',
                    text: "You want to cancel this booking!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, cancel it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        button.dataset.confirmed = "true";
                        button.click(); // Trigger the postback
                    }
                });
                return false;
            }
            return true; // For other actions like 'Pay' or 'View' if any
        }
    </script>
</body>
</html>
