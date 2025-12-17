<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master"
    AutoEventWireup="true" CodeBehind="User_SignUp.aspx.cs"
    Inherits="HomeServiceFinder.Pages.login_signup.User_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 15px 25px; /* Vertical and Horizontal spacing */
            text-align: left; /* Align labels to the left */
            margin-top: 20px;
        }

        /* Grid Items */
        .grid-item {
            flex: 1 1 calc(50% - 25px); /* Creates two columns */
            min-width: 280px;
        }

        .full-row {
            flex: 1 1 100%; /* Spans across both columns */
        }

        .field-label {
            font-weight: 600;
            font-size: 14px;
            color: #444;
            margin-bottom: 5px;
            display: block;
        }

        .input-row {
            position: relative;
        }

        .textbox {
            width: 100%;
            padding: 12px 15px 12px 45px; /* Left padding for icon */
            border-radius: 12px;
            border: 1px solid #ddd;
            background: #fcfcfc;
            box-sizing: border-box;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            width: 18px;
        }

        .validation-error {
            color: red;
            font-size: 12px;
            margin-top: 4px;
            display: block;
        }

        .signup-btn {
            width: 100%;
            background: #ffff00; /* Yellow button from your image */
            color: #000;
            font-weight: bold;
            padding: 15px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            margin-top: 25px;
            font-size: 16px;
            box-shadow: 0 4px 10px rgba(255, 255, 0, 0.3);
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-grid">
        
        <div class="grid-item full-row">
            <label class="field-label">Full Name</label>
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Name_Icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
                <asp:TextBox ID="User_Name_TextBox" runat="server" CssClass="textbox" placeholder="Enter Your Name"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Name_TextBox" CssClass="validation-error" ErrorMessage="Required" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <div class="grid-item full-row">
            <label class="field-label">Email Address</label>
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox" TextMode="Email" placeholder="jane@example.com"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Email_TextBox" CssClass="validation-error" ErrorMessage="Required" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <div class="grid-item">
            <label class="field-label">State</label>
            <div class="input-row">
                <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList" style="padding-left:15px;">
                    <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">City</label>
            <div class="input-row">
                <asp:DropDownList ID="CityList" runat="server" CssClass="textbox" style="padding-left:15px;">
                    <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Phone Number</label>
            <div class="input-row">
                <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox" TextMode="Phone" placeholder="Phone" style="padding-left:15px;"></asp:TextBox>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Address</label>
            <div class="input-row">
                <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox" placeholder="Street Address" style="padding-left:15px;"></asp:TextBox>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Password</label>
            <div class="input-row">
                <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" style="padding-left:15px;"></asp:TextBox>
                <i id="togglePwd" class="fa-solid fa-eye" style="position:absolute; right:15px; top:12px; cursor:pointer;"></i>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Confirm Password</label>
            <div class="input-row">
                <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" style="padding-left:15px;"></asp:TextBox>
                <i id="toggleCPwd" class="fa-solid fa-eye" style="position:absolute; right:15px; top:12px; cursor:pointer;"></i>
            </div>
        </div>

    </div> <asp:Button ID="SignupButton" runat="server" CssClass="signup-btn" Text="Create Account" ValidationGroup="signup" OnClick="btnSignup_Click" />
</asp:Content>