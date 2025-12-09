<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs"
    Inherits="HomeServiceFinder.login_signup.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Home Service Finder</title>

    <link href="css/style.css" rel="stylesheet" />

    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('<%= ResolveUrl("~/background_img.png") %>') no-repeat center center fixed;
            background-size: cover;
        }

        .signup-form {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-card {
            animation: fadeIn 0.5s ease-in-out;
        }

        .validation-error {
            color: red;
            font-size: 13px;
            margin: 4px 0 10px 46px;
            display: block;
        }

        .success-msg {
            color: green;
            font-size: 14px;
            text-align: center;
        }

        .footer-text {
            text-align: center; /* ✅ CENTER AND ALIGN */
            margin-top: 18px; /* ✅ SPACE FROM BUTTON */
            font-size: 14px;
        }

            .footer-text a {
                color: #1e90ff;
                text-decoration: none;
                font-weight: 600;
            }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }

            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server" class="signup-form">

        <div class="signup-card">

            <div class="title">Login Account</div>

            <!-- Email / Phone -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />

                <asp:TextBox ID="txtContact" runat="server"
                    CssClass="textbox"
                    placeholder="Email or Phone Number" />
            </div>

            <asp:RequiredFieldValidator
                ControlToValidate="txtContact"
                CssClass="validation-error"
                ErrorMessage="Email or phone is required."
                ValidationGroup="login"
                Display="Dynamic"
                runat="server" />


            <!-- Password -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />

                <asp:TextBox ID="txtPassword" runat="server"
                    CssClass="textbox"
                    TextMode="Password"
                    placeholder="Enter Password" />
            </div>

            <asp:RequiredFieldValidator
                ControlToValidate="txtPassword"
                CssClass="validation-error"
                ErrorMessage="Password is required."
                ValidationGroup="login"
                Display="Dynamic"
                runat="server" />


            <!-- Login Button -->
            <asp:Button ID="btnlogin" runat="server"
                CssClass="signup-btn"
                Text="Login"
                ValidationGroup="login"
                OnClick="btnlogin_Click" />


            <!-- Footer -->
            <div class="footer-text">
                Don't have an account?
            <a href="User_SignUp.aspx">Sign Up</a>
            </div>

            <!-- Message -->
            <asp:Label ID="lblMessage" runat="server"
                CssClass="validation-error"
                EnableViewState="false" />

        </div>

    </form>

</body>
</html>
