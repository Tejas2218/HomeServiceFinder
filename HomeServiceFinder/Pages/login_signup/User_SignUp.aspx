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
            gap: 2px 20px;
            text-align: left;
            margin-top: 5px;
        }

        .grid-item {
            flex: 1 1 calc(50% - 25px);
            min-width: 250px;
            margin-bottom: 3px;
        }

        .full-row {
            flex: 1 1 100%;
        }

        .field-label {
            font-weight: 600;
            font-size: 12px;
            color: #444;
            margin-bottom: 2px;
            display: block;
        }

        .input-row {
            position: relative;
        }

        .textbox {
            width: 100%;
            padding: 6px 12px 6px 40px;
            border-radius: 8px;
            border: 1px solid #ddd;
            background: #fcfcfc;
            box-sizing: border-box;
            font-size: 13px;
            height: 34px;
            transition: border-color 0.3s;
        }

            /* Orange Focus Effect */
            .textbox:focus {
                border-color: #FF8C00 !important;
                outline: none;
                box-shadow: 0 0 5px rgba(255, 140, 0, 0.2);
            }

        select.textbox {
            padding-left: 10px !important;
            height: 34px !important;
        }

        .input-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 14px;
            opacity: 0.8;
        }

        .validation-error {
            color: #e74c3c;
            font-size: 10px;
            margin-top: 0px;
            display: block;
        }

        /* 5. Orange Button Optimization */
        .signup-btn {
            width: 100%;
            background: #FF8C00; /* Solid Orange */
            color: #fff;
            font-weight: bold;
            padding: 10px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            margin-top: 12px;
            font-size: 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 10px rgba(255, 140, 0, 0.3);
            transition: background 0.3s ease;
        }

            .signup-btn:hover {
                background: #E67E00; /* Slightly darker orange */
            }

        #togglePwd, #toggleCPwd {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 13px;
            color: #888;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-grid">

        <!-- Name -->
        <div class="grid-item full-row">
            <label class="field-label">Full Name</label>
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Name_Icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
                <asp:TextBox ID="User_Name_TextBox" runat="server" CssClass="textbox" placeholder="Enter Your Name"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Name_TextBox" CssClass="validation-error" ErrorMessage="Name is required" ValidationGroup="signup" Display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator ControlToValidate="User_Name_TextBox" CssClass="validation-error" ErrorMessage="Only letters allowed" ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <!-- Email -->
        <div class="grid-item full-row">
            <label class="field-label">Email Address</label>
            <div class="input-row">
                <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox" TextMode="Email" placeholder="jane@example.com"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Email_TextBox" CssClass="validation-error" ErrorMessage="Email is required" ValidationGroup="signup" Display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator ControlToValidate="User_Email_TextBox" CssClass="validation-error" ErrorMessage="Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <!-- State -->
        <div class="grid-item">
            <label class="field-label">State</label>
            <div class="input-row">
                <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList" Style="padding-left: 15px;">
                    <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="StateList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a state" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <!-- City -->
        <div class="grid-item">
            <label class="field-label">City</label>
            <div class="input-row">
                <asp:DropDownList ID="CityList" runat="server" CssClass="textbox" Style="padding-left: 15px;">
                    <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="CityList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a city" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <!-- Phone -->
        <div class="grid-item">
            <label class="field-label">Phone Number</label>
            <div class="input-row">
                <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox" placeholder="10-digit number" Style="padding-left: 15px;"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Contact_TextBox" CssClass="validation-error" ErrorMessage="Phone required" ValidationGroup="signup" Display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator ControlToValidate="User_Contact_TextBox" CssClass="validation-error" ErrorMessage="Enter 10 digits" ValidationExpression="^[0-9]{10}$" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <!-- Address -->
        <div class="grid-item">
            <label class="field-label">Address</label>
            <div class="input-row">
                <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox" placeholder="Street Address" Style="padding-left: 15px;"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Address_TextBox" CssClass="validation-error" ErrorMessage="Address required" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <!-- Password -->
        <div class="grid-item">
            <label class="field-label">Password</label>
            <div class="input-row">
                <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" Style="padding-left: 15px;"></asp:TextBox>
                <i id="togglePwd" class="fa-solid fa-eye"></i>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Password_TextBox" CssClass="validation-error" ErrorMessage="Password required" ValidationGroup="signup" Display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator ControlToValidate="User_Password_TextBox" CssClass="validation-error" ErrorMessage="Min 6 chars, 1 letter, 1 number" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <!-- Confirm Password -->
        <div class="grid-item">
            <label class="field-label">Confirm Password</label>
            <div class="input-row">
                <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........" Style="padding-left: 15px;"></asp:TextBox>
                <i id="toggleCPwd" class="fa-solid fa-eye"></i>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="User_Confirm_Password_TextBox" CssClass="validation-error" ErrorMessage="Please confirm password" ValidationGroup="signup" Display="Dynamic" runat="server" />
            <asp:CompareValidator ControlToCompare="User_Password_TextBox" ControlToValidate="User_Confirm_Password_TextBox" CssClass="validation-error" ErrorMessage="Passwords do not match" ValidationGroup="signup" Display="Dynamic" runat="server" />
        </div>

        <div class="grid-item full-row" style="text-align: center;">
            <asp:Label ID="ErrorLabel" runat="server" CssClass="validation-error" Style="font-size: 14px; font-weight: bold;"></asp:Label>
        </div>

    </div>

    <asp:Button ID="SignupButton" runat="server" CssClass="signup-btn" Text="Create Account" ValidationGroup="signup" OnClick="btnSignup_Click" />

    <!-- JavaScript for Password Toggle -->
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
