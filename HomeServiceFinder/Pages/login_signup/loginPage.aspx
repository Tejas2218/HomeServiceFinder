<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs"
    Inherits="HomeServiceFinder.login_signup.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Home Service Finder</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        /* 1. Background Setup - Matching the SignUp vibe */
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            /* Using a gradient that works well with glass */
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%), 
                        url('<%= ResolveUrl("~/background_img.png") %>') no-repeat center center fixed;
            background-blend-mode: overlay;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* 2. Glassmorphic Card */
        .login-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 380px;
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.6s ease-out;
            color: #fff;
        }

        .title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 30px;
            font-weight: 300; /* Modern thin font weight */
            color: #fff;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        /* 3. Glass Inputs */
        .input-row {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin-bottom: 5px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            transition: all 0.3s ease;
        }

        .input-row:focus-within {
            background: rgba(255, 255, 255, 0.2);
            border-color: #FF8C00;
            box-shadow: 0 0 10px rgba(255, 140, 0, 0.3);
        }

        .input-icon {
            width: 20px;
            height: 20px;
            margin-right: 15px;
            /* Inverts black icons to white for glass visibility */
            filter: brightness(0) invert(1);
            opacity: 0.8;
        }

        .textbox {
            flex: 1;
            border: none;
            outline: none;
            font-size: 15px;
            background: transparent;
            color: #fff;
        }

        .textbox::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        /* 4. Orange Glass Button */
        .signup-btn {
            width: 100%;
            background: #FF8C00;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 15px;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            cursor: pointer;
            margin-top: 25px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(255, 140, 0, 0.4);
        }

        .signup-btn:hover {
            background: #E67E00;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 140, 0, 0.6);
        }

        /* 5. Extras */
        .validation-error {
            color: #ff6b6b;
            font-size: 12px;
            margin-top: 5px;
            margin-left: 5px;
            display: block;
            font-weight: 500;
        }

        .footer-text {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.8);
        }

        .footer-text a {
            color: #FF8C00;
            text-decoration: none;
            font-weight: 600;
            margin-left: 5px;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="login-card">

            <div class="title">Login</div>

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


            <div class="input-row" style="margin-top: 15px;">
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


            <asp:Button ID="btnlogin" runat="server"
                CssClass="signup-btn"
                Text="Sign In"
                ValidationGroup="login"
                OnClick="btnlogin_Click" />


            <div class="footer-text">
                Don't have an account?
                <a href="User_SignUp.aspx">Join Now</a>
            </div>

            <div style="text-align:center; margin-top: 10px;">
                <asp:Label ID="lblMessage" runat="server"
                    CssClass="validation-error"
                    EnableViewState="false" />
            </div>

        </div>

    </form>

</body>
</html>