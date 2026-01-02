<%@ Page Title="User Sign Up" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" 
    AutoEventWireup="true" CodeBehind="User_SignUp.aspx.cs" 
    Inherits="HomeServiceFinder.Pages.login_signup.User_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            /* Changed background to a solid/cleaner look */
            background-color: #f4f7f6;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }

        /* 2. Standard Container (Glass effect removed) */
        .glass-container {
            background: #ffffff; /* Solid White */
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            max-width: 650px;
            width: 100%;
            margin: 20px;
        }

        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 15px 20px;
            text-align: left;
        }

        .grid-item {
            flex: 1 1 calc(50% - 25px);
            min-width: 250px;
        }

        .full-row {
            flex: 1 1 100%;
        }

        .field-label {
            font-weight: 600;
            font-size: 13px;
            color: #444; /* Darker text for readability on white */
            margin-bottom: 6px;
            display: block;
            margin-left: 5px;
        }

        .input-row {
            position: relative;
        }

        /* 3. Standard Input Styling */
        .textbox {
            width: 100%;
            padding: 10px 12px 10px 40px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background: #fff;
            color: #333;
            box-sizing: border-box;
            font-size: 14px;
            height: 42px;
            transition: all 0.3s ease;
        }

        .textbox::placeholder {
            color: #999;
        }

        .textbox:focus {
            background: #fff;
            border-color: #FF8C00 !important;
            outline: none;
            box-shadow: 0 0 5px rgba(255, 140, 0, 0.2);
        }

        /* Dropdown specific styling */
        select.textbox {
            padding-left: 10px !important;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 1em;
        }

        select.textbox option {
            background: #fff;
            color: #333;
        }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            width: 16px;
            filter: none; /* Removed inversion - icons will show original color */
            opacity: 0.6;
            z-index: 2;
        }

        .validation-error {
            color: #d9534f;
            font-size: 11px;
            margin-top: 4px;
            display: block;
            font-weight: 600;
        }

        /* 4. Button Styling (Kept identical but removed glass shadow) */
        .signup-btn {
            width: 100%;
            background: #FF8C00;
            color: #fff;
            font-weight: bold;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            transition: all 0.3s ease;
        }

        .signup-btn:hover {
            background: #E67E00;
            transform: translateY(-1px);
        }

        #togglePwd, #toggleCPwd {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 14px;
            color: #777;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="glass-container">
        <h2 style="color: #333; text-align: center; margin-bottom: 25px; font-weight: 600; letter-spacing: 1px;">USER SIGN UP</h2>
        
        <div class="form-grid">
            <div class="grid-item full-row">
                <label class="field-label">Full Name</label>
                <div class="input-row">
                    <asp:Image CssClass="input-icon" ID="User_Name_Icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
                    <asp:TextBox ID="User_Name_TextBox" runat="server" CssClass="textbox" placeholder="Enter Your Name"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="User_Name_TextBox" CssClass="validation-error" ErrorMessage="Name is required" ValidationGroup="signup" Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="User_Name_TextBox" CssClass="validation-error" ErrorMessage="Only letters allowed" ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item full-row">
                <label class="field-label">Email Address</label>
                <div class="input-row">
                    <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                    <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox" TextMode="Email" placeholder="jane@example.com"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="User_Email_TextBox" CssClass="validation-error" ErrorMessage="Email is required" ValidationGroup="signup" Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="User_Email_TextBox" CssClass="validation-error" ErrorMessage="Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item">
                <label class="field-label">State</label>
                <div class="input-row">
                    <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList">
                        <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="StateList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a state" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item">
                <label class="field-label">City</label>
                <div class="input-row">
                    <asp:DropDownList ID="CityList" runat="server" CssClass="textbox">
                        <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="CityList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a city" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item">
                <label class="field-label">Phone Number</label>
                <div class="input-row">
                    <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox" placeholder="10-digit number" Style="padding-left: 15px;"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="User_Contact_TextBox" CssClass="validation-error" ErrorMessage="Phone required" ValidationGroup="signup" Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="User_Contact_TextBox" CssClass="validation-error" ErrorMessage="Enter 10 digits" ValidationExpression="^[0-9]{10}$" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item">
                <label class="field-label">Address</label>
                <div class="input-row">
                    <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox" placeholder="Street Address" Style="padding-left: 15px;"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="User_Address_TextBox" CssClass="validation-error" ErrorMessage="Address required" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item">
                <label class="field-label">Password</label>
                <div class="input-row">
                    <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" Style="padding-left: 15px;"></asp:TextBox>
                    <i id="togglePwd" class="fa-solid fa-eye"></i>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="User_Password_TextBox" CssClass="validation-error" ErrorMessage="Password required" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item">
                <label class="field-label">Confirm Password</label>
                <div class="input-row">
                    <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" Style="padding-left: 15px;"></asp:TextBox>
                    <i id="toggleCPwd" class="fa-solid fa-eye"></i>
                </div>
                <asp:CompareValidator ControlToCompare="User_Password_TextBox" ControlToValidate="User_Confirm_Password_TextBox" CssClass="validation-error" ErrorMessage="Passwords do not match" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="grid-item full-row" style="text-align: center;">
                <asp:Label ID="ErrorLabel" runat="server" CssClass="validation-error" Style="font-size: 14px; font-weight: bold;"></asp:Label>
            </div>
        </div>

        <asp:Button ID="SignupButton" runat="server" CssClass="signup-btn" Text="Create Account" ValidationGroup="signup" OnClick="btnSignup_Click" />
    </div>

    <script>
        document.getElementById('togglePwd').addEventListener('click', function () {
            const pwdInput = document.getElementById('<%= User_Password_TextBox.ClientID %>');
            const type = pwdInput.getAttribute('type') === 'password' ? 'text' : 'password';
            pwdInput.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });

        document.getElementById('toggleCPwd').addEventListener('click', function () {
            const cpwdInput = document.getElementById('<%= User_Confirm_Password_TextBox.ClientID %>');
            const type = cpwdInput.getAttribute('type') === 'password' ? 'text' : 'password';
            cpwdInput.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</asp:Content>