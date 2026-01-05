<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="service_provider.aspx.cs" Inherits="HomeServiceFinder.Pages.User.service_provider1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Select Provider - Apex</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Poppins:wght@600;700&display=swap" rel="stylesheet" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

    <style>
        :root {
            --apex-orange: #f27b0c;
            --apex-dark: #1a1a1a;
            --apex-light: #f8f9fa;
        }

        /* FIXED: Background Image Added */
        .page-header {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('img/carousel-1.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            padding: 80px 0;
            color: white;
            text-align: center;
            border-bottom: 5px solid var(--apex-orange);
            margin-bottom: 40px;
        }

        .provider-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            border-left: 5px solid transparent;
            margin-bottom: 20px;
        }

            .provider-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                border-left: 5px solid var(--apex-orange);
            }

        .p-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }

        .p-rating i {
            color: #ffc107;
            font-size: 0.9rem;
        }

        .btn-select {
            margin-left: auto;
            border: 2px solid var(--apex-orange);
            color: var(--apex-orange);
            background: transparent;
            border-radius: 50px;
            padding: 5px 25px;
            font-weight: 600;
            transition: 0.3s;
            text-decoration: none;
        }

            .btn-select:hover {
                background: var(--apex-orange);
                color: white;
            }
        /* =======================
   APEX BOOKING MODAL
======================= */

        .modal-content {
            border-radius: 16px;
            border: none;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
            overflow: hidden;
        }

        /* Header */
        .modal-header {
            background: linear-gradient(135deg, #1a1a1a, #2b2b2b);
            color: white;
            border-bottom: 3px solid #f27b0c;
        }

        .modal-title {
            font-weight: 700;
            color: #f27b0c;
        }

        .btn-close-white {
            filter: invert(1);
        }

        /* LEFT PROFILE PANEL */
        .modal-profile-box {
            background: linear-gradient(180deg, #f8f9fa, #eeeeee);
            padding: 30px 20px;
            text-align: center;
            height: 100%;
            border-right: 1px solid #ddd;
        }

        .modal-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #f27b0c;
            margin-bottom: 15px;
            background: white;
        }

        #mName {
            color: #1a1a1a;
        }

        #mRole {
            font-size: 0.9rem;
        }

        /* Rating badge */
        .modal-profile-box .bg-white {
            border-radius: 30px;
            font-size: 0.9rem;
        }

        /* RIGHT SIDE */
        .modal-body h5 {
            font-weight: 700;
        }

        /* TIME SLOTS */
        .time-slot-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

        .time-slot {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            font-size: 0.9rem;
            transition: all 0.25s ease;
        }

            .time-slot:hover {
                border-color: #f27b0c;
                color: #f27b0c;
            }

            .time-slot.active {
                background: #f27b0c;
                color: white;
                border-color: #f27b0c;
                box-shadow: 0 5px 15px rgba(242,123,12,0.4);
            }

        /* CONFIRM BUTTON */
        .btn-confirm {
            background: #1a1a1a;
            color: white;
            width: 100%;
            padding: 14px;
            font-weight: 700;
            border-radius: 10px;
            border: none;
            margin-top: 25px;
            transition: 0.3s;
        }

            .btn-confirm:hover {
                background: #f27b0c;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                </div>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
            <a href="index.aspx" class="navbar-brand d-flex align-items-center">
                <h1 class="m-0"><i class="fa fa-building text-primary me-3"></i>APEX</h1>
            </a>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-3 py-lg-0">
                    <a href="user_dashboard.aspx" class="nav-item nav-link">Home</a>
                    <a href="service.aspx" class="nav-item nav-link">Our Services</a>
                    <a href="service_provider.aspx" class="nav-item nav-link active">Services Proveder</a>
                    <a href="profile.aspx" class="nav-item nav-link">Profile</a>
                    <a href="service_provider.aspx" class="nav-item nav-link">Book Now</a>
                    <a href="user_booking.aspx" class="nav-item nav-link">Booking History</a>
                    <a href="about_us.aspx" class="nav-item nav-link">About Us</a>
                    <asp:LinkButton
                        ID="btnLogout"
                        runat="server"
                        CssClass="nav-item nav-link text-danger"
                        OnClick="btnLogout_Click">
                        <i class="bi bi-box-arrow-right me-1"></i> Logout
                    </asp:LinkButton>

                </div>
            </div>
        </nav>

        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-4 text-white animated slideInDown mb-4">Choose a Provider</h1>
                <p class="text-white">Select the best expert for your home needs</p>
            </div>
        </div>

        <div class="container mb-5">
            <div class="mb-4">
                <asp:DropDownList ID="ddlServices" runat="server" CssClass="form-select"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlServices_SelectedIndexChanged">
                    <asp:ListItem Text="-- All Services --" Value="0" />
                </asp:DropDownList>
            </div>


            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <div class="row">

                        <asp:Repeater ID="rptProviders" runat="server">
                            <ItemTemplate>
                                <div class="col-md-6 mb-4">
                                    <div class="provider-card wow fadeInUp" data-wow-delay="0.1s">
                                        <img src='data:image/jpeg;base64,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' class="p-img" alt="Provider"
                                            onerror="this.src='img/testimonial-1.jpg';" />
                                        <div class="p-details">
                                            <h5 class="mb-1"><%# Eval("User_Name") %></h5>
                                            <h6 class="mb-1"><%# Eval("Service_Name") %></h6>
                                            <small class="text-muted d-block mb-2">
                                                <i class="fa fa-tools me-1"></i><%# Eval("SP_Experience") %> Years Experience
                                            </small>
                                            <div class="p-rating">
                                                <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-alt"></i>
                                                <span class="text-muted ms-2">(<%# Eval("SP_AverageRating") %>)</span>
                                            </div>
                                        </div>
                                        <button type="button"
                                            class="btn btn-select"
                                            onclick="openModal(
                                                '<%# Eval("User_Name") %>',
                                                'Service Provider',
                                                '<%# Eval("SP_AverageRating") %>',
                                                'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQArAMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAAAQIEBQYDB//EADUQAAIBAgMHAgQEBgMAAAAAAAECAAMRBBIhBRMiMUFRYTJxUoGRoQYUI8EzQkOx0eEkYpL/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8A+2lFAuBYiUVi5Ck6GQGYkC5nq4AW4GsCrqKYzKLHlIQ59G1tIpks1mNx5lqnCBl0MCH/AE/TpfWSgDi7amKfFfNrIqHK1l0HiBDMUJC8hLhFYXIuTCAMoJ1mNiMVToEhqlrfyjUwPbO17faXyKBmA1mpq7XH9CiPd5jNtHFP/VsPAEDeKxZrNy9pZgEF10nPfm8T0rv9ZP53FW/jMffWBv04zxdIfgNl0E01PaldfUFb5WmZh9qUHFqwZGPflAzlAcXI1kMxRrKbCQXBsaZ4T1BnogBW51PmBAVSM1ucpnYm3TlILHNoTbtPWwtcAQIKKouNCJVWLmxOkqrMWsSSPM9HAVbjSBDgILroZTeN3EtTOZrNqLdZ6ZV7CANrG1rzyS+YXBkKpBBtPRiCpCnU8rQFS2Xh+0rT5nN95FMZWuwsJarZhw6nxAiqdRb7SN4lOkXqsAo6mVaquHpvUqmwH3mixmKqYp8z6KPSg6QMjGbSeqxFG9ND16mYJ1NzqYkQEREBERAREQPWhiKuHfNSYjuOhm1wuPXEnKeB+1+ftNLF7coHVi1uk8eLN1tea/AY3eWp1fX0Pf8A3NrmXLYEQD2y6c550xxak8usKpDXIsLy7kMtlsT4gRV0XTv0nnc+ZekMrXbTSemde4gRnU6A6meaqVYEjQRkYak/SWZw4yi9zAlyHFl1Mqv6ZJfQd4VTT1a1vEwdr4kCkKS6M+p9oGBtDFnFVdNKa+nz5mLEQEREBF5Wo600LuQqjmTNTids8xhkFvifr8oG4ic420cWTffEeAAJentXEoePLUXqGFv7QOgiYuDx9LFCy8LgXyn9u8yoCIiBNyNQbHvN1s7EHEJZvWnq8+ZpJ64ascPXWoOQ9Q7iB0hYMCo5yqKVN2FhKoNA4N1I6S5YOMoveAchxZNTKbt+0soKG7cvEtvV7GBG8vpa15GTJxX5Sd2F17SA5fhI5wJLbwZeU57GVN7ine9wNB7TeYo/l8NVqDmFNvec5AREQERPDH1TRwdVxzAt9dIGl2pjDiKpRD+kh4fJ6mYd5EQERECVJUhlJBHIidHs7FfmqFz610YfvObmfsWqUxgQ8nUi3nnA38REBERA3eyq+8wu6b1Ico9pmhd3xXmm2O+XEsO6k29puM2c5SLQJvvOHl1kbr/t9pNt3xDXpI3p7QAqMTY21klAgLcyOUsUUAm3KeasWIBOh5wMTalQnBOD1Imkm92woGCaw/mE0UBERATE2spbZ9UDwfuJlytVBVpOjcmFoHKSJerTajUamw4lNjKQEREBMzZKk7QpW6Xv9DMObfYWHtmrt14V89zA24iIgIiIGTs4/wDNpDuSPtOgZcgLCc7gdMZSI7zoFYs1m1EAp3hs3LnpLbpfP1hxkF10lN43eADm41v4l3ACnKNRLG1jqJ4pmzDNy6wPDHXfB1Rzsub6TQzqKyq1MqLai05llKOUbQg2gViIgIiIGFtHArikzrw1hyPxeDNDWpPRfJVUq3mdX/eeGIqYYLkxLUiOz6wOYibll2Re+ZB7XnthzsxGvSNLN3P+4GuwOzqmIIeoGSl929pv0UIoVQAALACAwYXDAjwbyYCIiAiIPiBl7KXNjk7C5m+awW66GarY1PhrVevpE2SXzcXKBNMlms2otPTKvYStUjLp36Ty/wDUCVVrjQ/SejFWUgHUyS4IteeaqVa5GggKYIOot7zUbYohMQKqnR/7zdOQwspuZj4jDCtQam+hPpPYwOeiSVZGKsLEGxEiBMwsZtGlhrqOOp8I6e88tq440BuqR/UYan4R/maMkkm5v57wMmvtDEV75nyj4V0ExYiAiIgXpVHpG9N2U+DNjhdrsCBiVuvxqLH6TVxA6ylUWqgemwZTyIlpzWCxb4WoGUZlOjL3E6OnUWpTV0N1YXEC0WJIABJPICPaZ+ycMXcVmF0Q6X7wNlg6JoUaakWsLk+ZkOQwspuZJZSCAdTKIuU3bQQFPhN20956Zx8QlXOcWXWU3bdoEimwNz0klw4Kgc43gbS1rwEycRPKBCrka55SWO80HSM284bWi27NzrA1+0sEXG8pjjA1HxCaSrUFKk9RuSgkzq/4p00tNPt7ZTYnC1FwxUVmFyDoGF9fnA4SrUarVao54mNzKS9Wm9KoadVGR1NirDUSkBERAREQEREB87Tb7Drm7UDy9Q8d5qOk3f4b2VisVilrquTDrcM7dfA7wN1hMK+KqZV0Xmzdpv6eSnTFOmtlAsJWgtPDoKdNLKPvLin1J8wCoQbnprJLZxlEZ83DygLu9SbiBCjdm7cuUtvV8/SRfeaDTrG6PeANOwvfl4kB8/DbnI3jHS0syBQWHMQBXdjNzgHe6crSFYubNa3iG/SAK9e8Cf4WnO8AbzXlC/qeo+1pDEobLqPMDB2ns3CY9MmJpXdRZaimzL8/2nL7Q/C2Nw4z4U/mafgWYfL/ABO3Ch1uRrILlTlH3gfLKlOpSYrWRkYcwy2IlZ9TrYajXQivTWoOzC81lXYGyqxucKqE9abMv2BtA+fxO7f8J7MAuN+PAqf6ij+F9l5rNSqN71T+0DhLzMweysbjSNxh3yX9bDKv1M76jsvAYPWhhKQPcrc/UzLUZ9TA53ZX4UoUwKuPffuP5F0Uf5nQgikAioMqjS2ksWyNlWSFzjMb38QICZuL7SN5c2t4g1CDYWtLFBzgRky8V+UK+84eUqHZjlNvlLFQi3HOAI3fFz6SN6fh+8KTUNm0HiW3S9zAnKo1A1nmrFiAToYiBZwEF10MIc54tbRECH4Dw6SUAcXYXMRAh2KkhdAJYKGUEjWIgULEm3S89CoAJAkRAojFms2ol3ARbroZEQITjuG1tD8BsugiIFkUMLsNZR2KGy6CTEC4VSASJ5hjmtfSIgXZQoJAsZVGLGzaiIgS4CC66GU3jd4iB//Z',
                                                '<%# Eval("SP_ID") %>',
                                                '<%# Eval("Equipment_ID") %>',)">
                                            Select
                                        </button>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="bookingModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content overflow-hidden">

                    <div class="modal-header">
                        <h5 class="modal-title">Book Appointment</h5>
                        <button type="button"
                            class="btn-close btn-close-white"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                        </button>
                    </div>

                    <div class="modal-body p-0">
                        <div class="row g-0">

                            <div class="col-md-4">
                                <div class="modal-profile-box">
                                    <img id="mImg" src="" class="modal-img shadow-sm" />
                                    <h4 id="mName" class="fw-bold mb-1">...</h4>
                                    <p id="mRole" class="text-muted mb-3">...</p>

                                    <div class="bg-white p-2 rounded shadow-sm d-inline-block px-4">
                                        <i class="fa fa-star text-warning"></i>
                                        <strong id="mRating"></strong>Rating
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8 p-4">
                                <h5 class="fw-bold mb-3 text-dark border-bottom pb-2">Select Schedule</h5>

                                <div class="mb-3">
                                    <label class="fw-bold small text-muted">DATE</label>
                                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" required="true"></asp:TextBox>
                                </div>

                                <label class="fw-bold small text-muted">AVAILABLE SLOTS</label>
                                <div class="time-slot-grid">
                                    <div class="time-slot" onclick="selectTime(this, '09:00 AM TO 11:00 AM')">09:00 AM TO 11:00 AM</div>
                                    <div class="time-slot" onclick="selectTime(this, '11:00 AM TO 01:00 PM')">11:00 AM TO 01:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '01:00 AM TO 03:00 PM')">01:00 PM TO 03:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '03:00 PM TO 05:00 PM')">03:00 PM TO 05:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '05:00 PM TO 07:00 PM')">05:00 PM TO 07:00 PM</div>
                                </div>
                                <small id="errTime" class="text-danger" style="display: none;">Please select a time slot.</small>


                                <asp:Button ID="btnBook" runat="server" Text="Confirm & Book" CssClass="btn btn-confirm" OnClientClick="return validate();" OnClick="btnBook_Click" />
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
                            <a class="btn btn-square btn-outline-primary me-1" href=""><i class="fab fa-twitter"></i></a>
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
        <asp:HiddenField ID="hfProviderName" runat="server" />
        <asp:HiddenField ID="hfProviderID" runat="server" />
        <asp:HiddenField ID="hfEquipmentID" runat="server" />
        <asp:HiddenField ID="hfSelectedTime" runat="server" />
        <asp:HiddenField ID="hfMinimumPrice" runat="server" />


        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            // Open Modal
            function openModal(name, role, rating, img, sid, eid) {
                document.getElementById('mName').innerText = name;
                document.getElementById('mRole').innerText = role;
                document.getElementById('mRating').innerText = rating;
                document.getElementById('mImg').src = img;

                // Set Hidden Field
                document.getElementById('<%= hfProviderName.ClientID %>').value = name;
                document.getElementById('<%= hfProviderID.ClientID %>').value = sid;
                document.getElementById('<%= hfEquipmentID.ClientID %>').value = eid;

                // Reset Time
                document.getElementById('<%= hfSelectedTime.ClientID %>').value = '';
                document.querySelectorAll('.time-slot').forEach(el => el.classList.remove('active'));

                new bootstrap.Modal(document.getElementById('bookingModal')).show();
            }

            // Select Time
            function selectTime(el, time) {
                document.querySelectorAll('.time-slot').forEach(item => item.classList.remove('active'));
                el.classList.add('active');
                document.getElementById('<%= hfSelectedTime.ClientID %>').value = time;
                document.getElementById('errTime').style.display = 'none';
            }

            // Validation
            function validate() {
                if (document.getElementById('<%= hfSelectedTime.ClientID %>').value === '') {
                    document.getElementById('errTime').style.display = 'block';
                    return false;
                }
                return true;
            }
        </script>

    </form>
</body>
</html>
