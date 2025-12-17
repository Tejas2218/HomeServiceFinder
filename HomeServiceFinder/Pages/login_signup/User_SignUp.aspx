<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master"
    AutoEventWireup="true" CodeBehind="User_SignUp.aspx.cs"
    Inherits="HomeServiceFinder.Pages.login_signup.User_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        /* 1. Reduce padding on the main container if it's in your MasterPage */
        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 1px 20px; /* Further reduced vertical gap */
            text-align: left;
            margin-top: 5px; /* Minimal top margin */
        }

        /* 2. Make grid items tighter */
        .grid-item {
            flex: 1 1 calc(50% - 25px);
            min-width: 250px;
            margin-bottom: 2px; /* Pulls rows closer together */
        }

        .full-row {
            flex: 1 1 100%;
        }

        /* 3. Reduce Label Spacing */
        .field-label {
            font-weight: 600;
            font-size: 13px;
            color: #444;
            margin-bottom: 2px; /* Label sits right on top of the box */
            display: block;
        }

        .input-row {
            position: relative;
        }

        /* 4. Slim down the Textbox height */
        .textbox {
            width: 100%;
            padding: 6px 12px 6px 40px; /* Very compact vertical padding */
            border-radius: 8px;
            border: 1px solid #ddd;
            background: #fcfcfc;
            box-sizing: border-box;
            font-size: 13px; /* Slightly smaller text */
            height: 34px; /* Explicit height to ensure it stays small */
        }

            /* Adjusting Dropdowns and non-icon inputs */
            .textbox[style*="padding-left:15px;"],
            select.textbox {
                padding-left: 10px !important;
                padding-top: 0px !important;
                padding-bottom: 0px !important;
                height: 34px !important;
            }

        .input-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 14px; /* Smaller icons */
        }

        .validation-error {
            color: red;
            font-size: 10px;
            margin-top: 0px;
            display: block;
        }

        /* 5. Button optimization */
        .signup-btn {
            width: 100%;
            background: #ffff00;
            color: #000;
            font-weight: bold;
            padding: 10px; /* Reduced from 15px */
            border: none;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 12px; /* Pull button closer to the fields */
            font-size: 15px;
            box-shadow: 0 3px 8px rgba(255, 255, 0, 0.3);
        }

        .fa-eye {
            top: 9px !important;
            font-size: 13px;
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
                <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList" Style="padding-left: 15px;">
                    <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">City</label>
            <div class="input-row">
                <asp:DropDownList ID="CityList" runat="server" CssClass="textbox" Style="padding-left: 15px;">
                    <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Phone Number</label>
            <div class="input-row">
                <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox" TextMode="Phone" placeholder="Phone" Style="padding-left: 15px;"></asp:TextBox>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Address</label>
            <div class="input-row">
                <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox" placeholder="Street Address" Style="padding-left: 15px;"></asp:TextBox>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Password</label>
            <div class="input-row">
                <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" Style="padding-left: 15px;"></asp:TextBox>
                <i id="togglePwd" class="fa-solid fa-eye" style="position: absolute; right: 15px; top: 12px; cursor: pointer;"></i>
            </div>
        </div>

        <div class="grid-item">
            <label class="field-label">Confirm Password</label>
            <div class="input-row">
                <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" Style="padding-left: 15px;"></asp:TextBox>
                <i id="toggleCPwd" class="fa-solid fa-eye" style="position: absolute; right: 15px; top: 12px; cursor: pointer;"></i>
            </div>
        </div>

    </div>
    <asp:Button ID="SignupButton" runat="server" CssClass="signup-btn" Text="Create Account" ValidationGroup="signup" OnClick="btnSignup_Click" />
</asp:Content>
