<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" AutoEventWireup="true" CodeBehind="User_SignUp.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.User_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="signup-card">
        <div class="title">Create Account</div>

        <!-- Name -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Name_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
            <asp:TextBox ID="User_Name_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Your Name">
            </asp:TextBox>
        </div>

        <!-- Email -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
            <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox"
                TextMode="Email" placeholder="Enter Your Email">
            </asp:TextBox>
        </div>

        <!-- State -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

            <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList">
                <asp:ListItem Text="Select State" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- City -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

            <asp:DropDownList ID="CityList" runat="server" CssClass="textbox">
                <asp:ListItem Text="Select City" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Address -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Address_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
            <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Your Address">
            </asp:TextBox>
        </div>

        <!-- Phone -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Contact_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
            <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox"
                TextMode="Phone" MaxLength="10" placeholder="Enter Phone Number">
            </asp:TextBox>
        </div>

        <!-- Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Password_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Enter Password">
            </asp:TextBox>
        </div>

        <!-- Confirm Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" ID="User_Confirm_Password_Icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Re-enter Password">
            </asp:TextBox>
        </div>

        <!-- Button -->
        <asp:Button ID="SignupButton" runat="server" CssClass="signup-btn" Text="Sign Up" OnClick="btnSignup_Click" />

    </div>

</asp:Content>
