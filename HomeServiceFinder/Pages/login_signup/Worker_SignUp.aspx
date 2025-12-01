<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" AutoEventWireup="true" CodeBehind="Worker_SignUp.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.Worker_SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="signup-card">

        <div class="title">Service Provider Sign Up</div>

        <!-- Full Name -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
            <asp:TextBox ID="Worker_Name_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Full Name"></asp:TextBox>
        </div>

        <!-- Email -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
            <asp:TextBox ID="Worker_Email_TextBox" runat="server" CssClass="textbox"
                TextMode="Email" placeholder="Enter Email"></asp:TextBox>
        </div>

        <!-- Phone -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
            <asp:TextBox ID="Worker_Phone_TextBox" runat="server" CssClass="textbox"
                TextMode="Phone" MaxLength="10" placeholder="Enter Mobile Number"></asp:TextBox>
        </div>

        <!-- Age -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Worker_Age_Icon.png" />
            <asp:TextBox ID="Worker_Age_TextBox" runat="server" CssClass="textbox"
                TextMode="Number" placeholder="Enter Age"></asp:TextBox>
        </div>

        <!-- Gender -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Gender_Icon.png" />

            <asp:DropDownList ID="Worker_Gender_DropDown" runat="server" CssClass="textbox">
                <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Address -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
            <asp:TextBox ID="Worker_Address_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Shop / Work Address"></asp:TextBox>
        </div>

        <!-- Service Type -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Worker_Services_Icon.png" />

            <asp:DropDownList ID="Worker_ServiceType_DropDown" runat="server" CssClass="textbox">
                <asp:ListItem Text="Select Service Type" Value=""></asp:ListItem>
                <asp:ListItem Text="Plumbing"></asp:ListItem>
                <asp:ListItem Text="Electrician"></asp:ListItem>
                <asp:ListItem Text="Carpenter"></asp:ListItem>
                <asp:ListItem Text="AC Repair"></asp:ListItem>
                <asp:ListItem Text="Painter"></asp:ListItem>
                <asp:ListItem Text="Appliance Repair"></asp:ListItem>
                <asp:ListItem Text="Cleaning Service"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Experience -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Worker_Experience_Icon.png" />
            <asp:TextBox ID="Worker_Experience_TextBox" runat="server" CssClass="textbox"
                TextMode="Number" placeholder="Experience (in years)"></asp:TextBox>
        </div>


        <!-- Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="Worker_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Enter Password"></asp:TextBox>
        </div>

        <!-- Confirm Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="Worker_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Re-enter Password"></asp:TextBox>
        </div>

        <!-- Button -->
        <asp:Button ID="Worker_Signup_Button" runat="server" CssClass="signup-btn" Text="Sign Up" />

    </div>

</asp:Content>
