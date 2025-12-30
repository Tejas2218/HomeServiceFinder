<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change_password.aspx.cs" Inherits="HomeServiceFinder.Pages.User.change_password" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Apex - Change Password</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Poppins:wght@600;700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: none;
        }

        .password-card {
            border-top: 5px solid var(--primary);
        }

        .otp-input {
            width: 45px;
            height: 55px;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            border: 2px solid #ced4da;
            border-radius: 8px;
            margin: 0 5px;
        }

            .otp-input:focus {
                border-color: var(--primary);
                outline: none;
            }

        .password-toggle {
            cursor: pointer;
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
            color: #6c757d;
        }

        #otpVerificationArea, #passwordResetFields, #btnVerifyOtp {
            display: none;
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
                    <a href="appointment.aspx" class="nav-item nav-link">Appointment</a>
                    <a href="profile.aspx" class="nav-item nav-link active">Profile</a>
                    <a href="user_booking.aspx" class="nav-item nav-link">Booking History</a>
                    <a href="about_us.aspx" class="nav-item nav-link">About Us</a>
                </div>
            </div>
        </nav>

        <div class="container-fluid page-header py-5 mb-5">
            <div class="container text-center py-5">
                <h1 class="display-4 text-white animated slideInDown mb-4">Change Password</h1>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="bg-light p-5 rounded password-card shadow-sm text-start">
                            <div class="text-center mb-5">
                                <div class="d-inline-flex align-items-center justify-content-center bg-white rounded-circle mb-3" style="width: 65px; height: 65px;">
                                    <i class="fa fa-lock fa-2x text-primary"></i>
                                </div>
                                <h4 class="text-uppercase">Update Security</h4>
                            </div>

                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating position-relative">
                                        <asp:TextBox ID="txtCurrentPass" runat="server" CssClass="form-control" placeholder="Current" TextMode="Password"></asp:TextBox>
                                        <label>Current Password</label>
                                        <i class="fa fa-eye password-toggle" onclick="togglePasswordVisibility('txtCurrentPass', this)"></i>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating position-relative">
                                        <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" placeholder="New" TextMode="Password"></asp:TextBox>
                                        <label>New Password</label>
                                        <i class="fa fa-eye password-toggle" onclick="togglePasswordVisibility('txtNewPass', this)"></i>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating position-relative">
                                        <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" placeholder="Confirm" TextMode="Password"></asp:TextBox>
                                        <label>Confirm New Password</label>
                                        <i class="fa fa-eye password-toggle" onclick="togglePasswordVisibility('txtConfirmPass', this)"></i>
                                    </div>
                                    <div class="text-end mt-2">
                                        <a href="#" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal" class="small text-primary text-decoration-none fw-bold">Forgot Password?</a>
                                    </div>
                                </div>
                                <div class="col-12 mt-4">
                                    <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn btn-primary w-100 py-3" OnClientClick="return confirmAction(this, 'Update Password?');" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title text-white">Reset Password</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body p-4 text-center">
                        <div id="getOtpArea">
                            <i class="fa fa-paper-plane fa-3x text-primary mb-3"></i>
                            <h6>Need to reset your password?</h6>
                            <p class="small text-muted mb-4">We will send a 6-digit code to your email.</p>
                            <button type="button" class="btn btn-primary px-5 py-2" onclick="startOtpFlow()">Get OTP</button>
                        </div>

                        <div id="otpVerificationArea">
                            <h6 class="text-uppercase">Verify OTP</h6>
                            <p class="small text-muted" id="timerContainer">Code expires in: <span id="timer" class="text-danger fw-bold">01:00</span></p>

                            <div class="d-flex justify-content-center mb-4">
                                <input type="text" class="otp-input" maxlength="1" id="otp1" oninput="validateInput(this)" onkeyup="moveFocus(this, 'otp2')" onkeydown="handleBackspace(this, '')" autocomplete="off" />
                                <input type="text" class="otp-input" maxlength="1" id="otp2" oninput="validateInput(this)" onkeyup="moveFocus(this, 'otp3')" onkeydown="handleBackspace(this, 'otp1')" autocomplete="off" />
                                <input type="text" class="otp-input" maxlength="1" id="otp3" oninput="validateInput(this)" onkeyup="moveFocus(this, 'otp4')" onkeydown="handleBackspace(this, 'otp2')" autocomplete="off" />
                                <input type="text" class="otp-input" maxlength="1" id="otp4" oninput="validateInput(this)" onkeyup="moveFocus(this, 'otp5')" onkeydown="handleBackspace(this, 'otp3')" autocomplete="off" />
                                <input type="text" class="otp-input" maxlength="1" id="otp5" oninput="validateInput(this)" onkeyup="moveFocus(this, 'otp6')" onkeydown="handleBackspace(this, 'otp4')" autocomplete="off" />
                                <input type="text" class="otp-input" maxlength="1" id="otp6" oninput="validateInput(this)" onkeyup="moveFocus(this, '')" onkeydown="handleBackspace(this, 'otp5')" autocomplete="off" />
                            </div>

                            <button type="button" id="btnVerifyOtp" class="btn btn-primary w-100 py-3" onclick="verifyAndStopTimer()">Verify & Proceed</button>

                            <div id="passwordResetFields" class="row g-3 text-start">
                                <hr />
                                <div class="col-12">
                                    <div class="form-floating position-relative">
                                        <asp:TextBox ID="txtForgotNewPass" runat="server" CssClass="form-control" placeholder="New" TextMode="Password"></asp:TextBox>
                                        <label>New Password</label>
                                        <i class="fa fa-eye password-toggle" onclick="togglePasswordVisibility('txtForgotNewPass', this)"></i>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating position-relative">
                                        <asp:TextBox ID="txtForgotConfirmPass" runat="server" CssClass="form-control" placeholder="Confirm" TextMode="Password"></asp:TextBox>
                                        <label>Confirm Password</label>
                                        <i class="fa fa-eye password-toggle" onclick="togglePasswordVisibility('txtForgotConfirmPass', this)"></i>
                                    </div>
                                </div>
                                <div class="col-12 mt-4">
                                    <asp:Button ID="btnResetSubmit" runat="server" Text="Reset Password" CssClass="btn btn-primary w-100 py-2" OnClientClick="return confirmAction(this, 'Reset Password?');" />
                                </div>
                            </div>

                            <button type="button" id="resendBtn" class="btn btn-link btn-sm mt-2 text-decoration-none" onclick="resetOtpView()">Didn't get code? Resend</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(window).on('load', function () {
            if ($('#spinner').length > 0) $('#spinner').removeClass('show');
        });

        // SweetAlert2 Confirmation Logic
        function confirmAction(button, titleText) {
            if (button.dataset.confirmed === "true") {
                return true;
            }

            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#198754',
                cancelButtonColor: '#dc3545',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        icon: 'success',
                        confirmButtonColor: '#198754'
                    }).then(() => {
                        button.dataset.confirmed = "true";
                        button.click();
                    });
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire({
                        title: 'Cancelled',
                        text: 'Your imaginary file is safe :)',
                        icon: 'error',
                        confirmButtonColor: '#198754'
                    });
                }
            });
            return false;
        }

        let timerInterval;

        function startOtpFlow() {
            $('#getOtpArea').hide();
            $('#otpVerificationArea').show();
            startTimer(60);
        }

        function validateInput(input) {
            input.value = input.value.replace(/[^0-9]/g, '');
        }

        function moveFocus(current, nextId) {
            if (current.value.length >= 1 && nextId !== "") {
                document.getElementById(nextId).focus();
            }
            checkOtpStatus();
        }

        function handleBackspace(current, prevId) {
            if (event.key === "Backspace") {
                if (current.value === "" && prevId !== "") {
                    document.getElementById(prevId).focus();
                }
            }
        }

        function checkOtpStatus() {
            let fullOtp = "";
            for (let i = 1; i <= 6; i++) {
                fullOtp += document.getElementById('otp' + i).value;
            }
            if (fullOtp.length === 6) {
                $('#btnVerifyOtp').fadeIn();
            } else {
                $('#btnVerifyOtp').fadeOut();
                $('#passwordResetFields').fadeOut();
            }
        }

        function verifyAndStopTimer() {
            clearInterval(timerInterval);
            document.getElementById('timerContainer').innerHTML = '<span class="text-primary fw-bold"><i class="fa fa-check-circle"></i> OTP Verified</span>';
            for (let i = 1; i <= 6; i++) {
                document.getElementById('otp' + i).disabled = true;
            }
            $('#btnVerifyOtp').fadeOut(200, function () {
                $('#passwordResetFields').fadeIn();
                $('#resendBtn').hide();
            });
        }

        function startTimer(duration) {
            let timer = duration, minutes, seconds;
            const display = document.querySelector('#timer');
            clearInterval(timerInterval);
            timerInterval = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);
                display.textContent = (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);
                if (--timer < 0) {
                    clearInterval(timerInterval);
                    display.textContent = "Expired";
                    for (let i = 1; i <= 6; i++) document.getElementById('otp' + i).disabled = true;
                }
            }, 1000);
        }

        function resetOtpView() {
            $('#getOtpArea').show();
            $('#otpVerificationArea, #passwordResetFields, #btnVerifyOtp').hide();
            $('#resendBtn').show();
            document.getElementById('timerContainer').innerHTML = 'Code expires in: <span id="timer" class="text-danger fw-bold">01:00</span>';
            for (let i = 1; i <= 6; i++) {
                let el = document.getElementById('otp' + i);
                el.value = '';
                el.disabled = false;
            }
            clearInterval(timerInterval);
        }

        function togglePasswordVisibility(fieldId, icon) {
            var passInput = document.getElementById(fieldId);
            if (passInput.type === "password") {
                passInput.type = "text";
                icon.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                passInput.type = "password";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            }
        }
    </script>
</body>
</html>
