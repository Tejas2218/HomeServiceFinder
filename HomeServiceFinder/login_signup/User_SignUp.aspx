<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_SignUp.aspx.cs" Inherits="HomeServiceFinder.login_signup.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Sign Up</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url(https://media.istockphoto.com/id/1203195982/vector/relocation-service-relocating-people-moving-company-isometric-icons.jpg?s=2048x2048&w=is&k=20&c=1Gvv4b0LmEFNQZhqkd7aD6CwGwbY4ceStkCE2nJGcG4=);               /* Light blue background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .signup-card {
            background: #ffffff;
            width: 380px;
            padding: 35px 40px;
            border-radius: 14px;
            /*box-shadow: 0 10px 25px rgba(0, 85, 255, 0.25);*/ /* Blue shadow */
            /*border-top: 4px solid #0066ff;*/   /* Blue top border */
        }

        .title {
            text-align: center;
            font-size: 26px;
            margin-bottom: 25px;
            font-weight: bold;
            color: #0047b3;       /* Deep blue text */
        }

        .input-row {
            display: flex;
            align-items: center;
            padding-bottom: 12px;
            margin-bottom: 20px;
            border-bottom: 1px solid #7aa7ff;  /* Light blue underline */
            transition: 0.3s;
        }

        .input-row:focus-within {
            border-bottom: 2px solid #0066ff;  /* Strong blue underline on focus */
        }

        .input-icon {
            width: 26px;
            height: 26px;
            margin-right: 10px;
            filter: hue-rotate(200deg); /* Makes icons blue-ish */
        }

        .textbox {
            flex: 1;
            border: none;
            outline: none;
            font-size: 15px;
            padding: 6px 2px;
            background: transparent;
            color: #003c99;
        }

        .textbox::placeholder {
            color: #6e8cd7;        /* bluish placeholder */
        }

        .signup-btn {
            width: 100%;
            background: #0066ff;
            padding: 13px;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
            transition: 0.25s;
        }

        .signup-btn:hover {
            background: #0047cc;   /* Dark blue hover */
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="signup-card">
            <div class="title">Create Account</div>

            <!-- Name -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Name_Icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
                <asp:TextBox ID="User_Name_TextBox" runat="server" CssClass="textbox"
                    placeholder="Enter Your Name"></asp:TextBox>
            </div>

            <!-- Email -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox"
                    TextMode="Email" placeholder="Enter Your Email"></asp:TextBox>
            </div>

            <!-- Address -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Address_Icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
                <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox"
                    placeholder="Enter Your Address"></asp:TextBox>
            </div>

            <!-- Phone -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Contact_Icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
                <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox"
                    TextMode="Phone" MaxLength="10" placeholder="Enter Phone Number"></asp:TextBox>
            </div>

            <!-- Password -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Password_Icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox"
                    TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            </div>

            <!-- Confirm Password -->
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Confirm_Password_Icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                    TextMode="Password" placeholder="Re-enter Password"></asp:TextBox>
            </div>

            <!-- Button -->
            <asp:Button ID="SignupButton" runat="server" CssClass="signup-btn" Text="Sign Up" />

        </div>

    </form>
</body>
</html>
