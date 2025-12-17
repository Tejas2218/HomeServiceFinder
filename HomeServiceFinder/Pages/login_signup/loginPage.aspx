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
            /* Background remains the same */
            background: url('<%= ResolveUrl("~/background_img.png") %>') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .signup-card {
            background: #ffffff;
            width: 380px;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }

        .title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
            font-weight: bold;
            color: #FF8C00; /* Neutral dark for title */
        }

        /* Input Rows with Orange Accent */
        .input-row {
            display: flex;
            align-items: center;
            padding: 10px 0;
            margin-bottom: 5px;
            border-bottom: 2px solid #f0f0f0;
            transition: 0.3s;
        }

            .input-row:focus-within {
                border-bottom: 2px solid #FF8C00; /* Vibrant Orange Underline */
            }

        .input-icon {
            width: 22px;
            height: 22px;
            margin-right: 15px;
            opacity: 0.6;
            /* If icons are dark, this makes them slightly warmer */
            filter: grayscale(100%) sepia(100%) hue-rotate(10deg) saturate(500%);
        }

        .textbox {
            flex: 1;
            border: none;
            outline: none;
            font-size: 16px;
            background: transparent;
            color: #333;
        }

        /* Orange Login Button */
        .signup-btn {
            width: 100%;
            background: #FF8C00; /* Vibrant Orange */
            color: white;
            padding: 14px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            margin-top: 25px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(255, 140, 0, 0.3);
        }

            .signup-btn:hover {
                background: #E67E00; /* Darker Orange */
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(255, 140, 0, 0.4);
            }

        .validation-error {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }

        .footer-text {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

            .footer-text a {
                color: #FF8C00; /* Orange Link */
                text-decoration: none;
                font-weight: 600;
            }

                .footer-text a:hover {
                    text-decoration: underline;
                }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
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
