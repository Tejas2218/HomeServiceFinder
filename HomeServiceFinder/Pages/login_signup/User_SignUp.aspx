<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master"
    AutoEventWireup="true" CodeBehind="User_SignUp.aspx.cs"
    Inherits="HomeServiceFinder.Pages.login_signup.User_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        .validation-error {
            color: red;
            font-size: 13px;
            margin: 4px 0 10px 46px;
            display: block;
        }

        .input-row {
            position: relative;
        }

        #togglePwd, #toggleCPwd {
            position: absolute;
            right: 10px;
            top: 12px;
            cursor: pointer;
            font-size: 18px;
            color: #555;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="signup-card">
        <div class="title">Create Account</div>

        <!-- Name -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Name_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
            <asp:TextBox ID="User_Name_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Your Name"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="User_Name_TextBox"
            CssClass="validation-error"
            ErrorMessage="Name is required."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- Email -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
            <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox"
                TextMode="Email" placeholder="Enter Your Email"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="User_Email_TextBox"
            CssClass="validation-error"
            ErrorMessage="Email is required."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />

        <asp:RegularExpressionValidator
            ControlToValidate="User_Email_TextBox"
            CssClass="validation-error"
            ErrorMessage="Invalid email format."
            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- State -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

            <asp:DropDownList ID="StateList" runat="server" CssClass="textbox"
                AutoPostBack="true" OnSelectedIndexChanged="BindCityList">
                <asp:ListItem Text="Select State" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="StateList"
            InitialValue=""
            CssClass="validation-error"
            ErrorMessage="Please select a state."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- City -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

            <asp:DropDownList ID="CityList" runat="server" CssClass="textbox">
                <asp:ListItem Text="Select City" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="CityList"
            InitialValue=""
            CssClass="validation-error"
            ErrorMessage="Please select a city."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- Address -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Address_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
            <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Your Address"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="User_Address_TextBox"
            CssClass="validation-error"
            ErrorMessage="Address is required."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- Phone -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Contact_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
            <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox"
                TextMode="Phone" MaxLength="10" placeholder="Enter Phone Number"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="User_Contact_TextBox"
            CssClass="validation-error"
            ErrorMessage="Phone number is required."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />

        <asp:RegularExpressionValidator
            ControlToValidate="User_Contact_TextBox"
            CssClass="validation-error"
            ErrorMessage="Phone must be 10 digits."
            ValidationExpression="^\d{10}$"
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Password_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <i id="togglePwd" class="fa-solid fa-eye"
                style="position: absolute; right: 10px; top: 10px; cursor: pointer;"></i>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="User_Password_TextBox"
            CssClass="validation-error"
            ErrorMessage="Password is required."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- Confirm Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Confirm_Password_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Re-enter Password"></asp:TextBox>
            <i id="toggleCPwd" class="fa-solid fa-eye"
                style="position: absolute; right: 10px; top: 10px; cursor: pointer;"></i>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="User_Confirm_Password_TextBox"
            CssClass="validation-error"
            ErrorMessage="Please confirm your password."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />

        <asp:CompareValidator
            ControlToValidate="User_Confirm_Password_TextBox"
            ControlToCompare="User_Password_TextBox"
            CssClass="validation-error"
            ErrorMessage="Passwords do not match."
            ValidationGroup="signup"
            Display="Dynamic"
            runat="server" />


        <!-- SignUp Button -->
        <asp:Button ID="SignupButton" runat="server"
            CssClass="signup-btn"
            Text="Sign Up"
            ValidationGroup="signup"
            OnClick="btnSignup_Click" />

    </div>
    <script>
        // MAIN PASSWORD
        const pwd = document.getElementById("<%= User_Password_TextBox.ClientID %>");
        const icon = document.getElementById("togglePwd");

        icon.onclick = function () {
            if (pwd.type === "password") {
                pwd.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                pwd.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }

        // CONFIRM PASSWORD
        const cpwd = document.getElementById("<%= User_Confirm_Password_TextBox.ClientID %>");
        const cicon = document.getElementById("toggleCPwd");

        cicon.onclick = function () {
            if (cpwd.type === "password") {
                cpwd.type = "text";
                cicon.classList.remove("fa-eye");
                cicon.classList.add("fa-eye-slash");
            } else {
                cpwd.type = "password";
                cicon.classList.remove("fa-eye-slash");
                cicon.classList.add("fa-eye");
            }
        }
    </script>
</asp:Content>
