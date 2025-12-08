<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="HomeServiceFinder.login_signup.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Home Service Finder</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('<%= ResolveUrl("~/background_img.png") %>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            width: 420px;
            background: rgba(255, 255, 255, 0.95);
            padding: 35px 40px;
            border-radius: 15px;
        }

        .login-title {
            text-align: center;
            font-size: 28px;
            color: #1e90ff;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 17px;
        }

        label {
            font-weight: 600;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #888;
            border-radius: 8px;
            margin-top: 5px;
            font-size: 15px;
        }

            input:focus {
                border-color: #1e90ff;
                outline: none;
                box-shadow: 0px 0px 6px rgba(30, 144, 255, 0.5);
            }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #1e90ff;
            color: #fff;
            font-size: 17px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: .3s;
        }

            .btn-login:hover {
                background: #187bcd;
            }

        .footer-text {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

            .footer-text a {
                color: #1e90ff;
                font-weight: 600;
                text-decoration: none;
            }

        #lblMessage {
            display: block;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-container">

            <div class="login-title">Login</div>

            <div class="form-group">
                <asp:Label runat="server" Text="Email or Phone Number" />
                <asp:TextBox ID="txtContact" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label runat="server" Text="Password" />
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" />
            </div>

            <asp:Button
                ID="btnlogin"
                runat="server"
                Text="Login"
                CssClass="btn-login"
                OnClick="btnlogin_Click" />



            <div class="footer-text">
                Don’t have an account?
                <a href="User_SignUp.aspx">Sign Up</a>
            </div>

        </div>
        <asp:Label
            ID="lblMessage"
            runat="server"
            ForeColor="Red" />
    </form>
</body>
</html>
