<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" AutoEventWireup="true" CodeBehind="Worker_SignUp.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.Worker_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        .validation-error {
            color: red;
            font-size: 13px;
            margin-top: -10px;
            margin-bottom: 10px;
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

        <div class="title">Service Provider Sign Up</div>

        <!-- Full Name -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
            <asp:TextBox ID="Worker_Name_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Full Name"></asp:TextBox>


        </div>
        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Name_TextBox"
            CssClass="validation-error"
            ErrorMessage="Full name is required."
            runat="server" Display="Dynamic" />
        <!-- Email -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
            <asp:TextBox ID="Worker_Email_TextBox" runat="server" CssClass="textbox"
                TextMode="Email" placeholder="Enter Email"></asp:TextBox>


        </div>
        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Email_TextBox"
            CssClass="validation-error"
            ErrorMessage="Email is required."
            runat="server" Display="Dynamic" />
        <asp:RegularExpressionValidator
            ControlToValidate="Worker_Email_TextBox"
            CssClass="validation-error"
            ErrorMessage="Invalid email format."
            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
            runat="server" Display="Dynamic" />

        <!-- Phone -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
            <asp:TextBox ID="Worker_Phone_TextBox" runat="server" CssClass="textbox"
                TextMode="Phone" MaxLength="10" placeholder="Enter Mobile Number"></asp:TextBox>


        </div>
        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Phone_TextBox"
            CssClass="validation-error"
            ErrorMessage="Phone number is required."
            runat="server" Display="Dynamic" />

        <asp:RegularExpressionValidator
            ControlToValidate="Worker_Phone_TextBox"
            CssClass="validation-error"
            ErrorMessage="Phone must be 10 digits."
            ValidationExpression="^\d{10}$"
            runat="server" Display="Dynamic" />
        <!-- Age -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Worker_Age_Icon.png" />
            <asp:TextBox ID="Worker_Age_TextBox" runat="server" CssClass="textbox"
                TextMode="Number" placeholder="Enter Age"></asp:TextBox>


        </div>
        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Age_TextBox"
            CssClass="validation-error"
            ErrorMessage="Age is required."
            runat="server" Display="Dynamic" />

        <asp:RangeValidator
            ControlToValidate="Worker_Age_TextBox"
            CssClass="validation-error"
            ErrorMessage="Age must be between 18 and 70."
            MinimumValue="18"
            MaximumValue="70"
            Type="Integer"
            runat="server" Display="Dynamic" />

        <!-- State -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

            <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="StateList_SelectedIndexChanged">
                <asp:ListItem Text="Select State" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:RequiredFieldValidator
            ControlToValidate="StateList"
            InitialValue=""
            CssClass="validation-error"
            ErrorMessage="Please select a state."
            runat="server" Display="Dynamic" />

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
            runat="server" Display="Dynamic" />


        <!-- Address -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
            <asp:TextBox ID="Worker_Address_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter House Address"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Address_TextBox"
            CssClass="validation-error"
            ErrorMessage="Home address is required."
            runat="server" Display="Dynamic" />


        <!-- Address -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
            <asp:TextBox ID="Worker_ShopAddress_TextBox" runat="server" CssClass="textbox"
                placeholder="Enter Shop / Work Address"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="Worker_ShopAddress_TextBox"
            CssClass="validation-error"
            ErrorMessage="Shop / Work address is required."
            runat="server" Display="Dynamic" />

        <!-- Service Type -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Worker_Services_Icon.png" />

            <asp:DropDownList ID="Worker_ServiceType_DropDown" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="Worker_ServiceType_DropDown_SelectedIndexChanged">
               
            </asp:DropDownList>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="Worker_ServiceType_DropDown"
            InitialValue=""
            CssClass="validation-error"
            ErrorMessage="Please select a service type."
            runat="server" Display="Dynamic" />

        <!---Equipment ---->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Worker_Services_Icon.png" />

            <asp:DropDownList ID="Worker_Equipment_DropDown" runat="server" CssClass="textbox">
               
            </asp:DropDownList>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="Worker_ServiceType_DropDown"
            InitialValue=""
            CssClass="validation-error"
            ErrorMessage="Please select a service type."
            runat="server" Display="Dynamic" />


        <!-- Experience -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/Worker_Experience_Icon.png" />
            <asp:TextBox ID="Worker_Experience_TextBox" runat="server" CssClass="textbox"
                TextMode="Number" placeholder="Experience (in years)"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Experience_TextBox"
            CssClass="validation-error"
            ErrorMessage="Experience is required."
            runat="server" Display="Dynamic" />

        <asp:RangeValidator
            ControlToValidate="Worker_Experience_TextBox"
            CssClass="validation-error"
            ErrorMessage="Experience must be between 0 and 50 years."
            MinimumValue="0"
            MaximumValue="50"
            Type="Integer"
            runat="server" Display="Dynamic" />


        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/317830.png" />
            <asp:TextBox ID="Worker_MinimumPrice_TextBox" runat="server" CssClass="textbox"
                TextMode="Number" placeholder="Minimum Price (in Rupees)"></asp:TextBox>
        </div>

        <asp:RequiredFieldValidator
            ControlToValidate="Worker_MinimumPrice_TextBox"
            CssClass="validation-error"
            ErrorMessage="Minimum service price is required."
            runat="server" Display="Dynamic" />





        <!-- Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="Worker_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <i id="togglePwd" class="fa-solid fa-eye"
                style="position: absolute; right: 10px; top: 10px; cursor: pointer;"></i>
        </div>
        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Password_TextBox"
            CssClass="validation-error"
            ErrorMessage="Password is required."
            runat="server" Display="Dynamic" />

        <!-- Confirm Password -->
        <div class="input-row">
            <asp:Image CssClass="input-icon" runat="server"
                ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
            <asp:TextBox ID="Worker_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                TextMode="Password" placeholder="Re-enter Password"></asp:TextBox>
            <i id="toggleCPwd" class="fa-solid fa-eye"
                style="position: absolute; right: 10px; top: 10px; cursor: pointer;"></i>
        </div>



        <asp:RequiredFieldValidator
            ControlToValidate="Worker_Confirm_Password_TextBox"
            CssClass="validation-error"
            ErrorMessage="Please confirm your password."
            runat="server" Display="Dynamic" />

        <asp:CompareValidator
            ControlToValidate="Worker_Confirm_Password_TextBox"
            ControlToCompare="Worker_Password_TextBox"
            CssClass="validation-error"
            ErrorMessage="Passwords do not match."
            runat="server" Display="Dynamic" />

        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Enabled="false"></asp:Label>


        <!-- Button -->
        <asp:Button ID="Worker_Signup_Button" runat="server" CssClass="signup-btn" Text="Sign Up" OnClick="Worker_Signup_Button_Click" />

    </div>
    <script>
        // MAIN PASSWORD
        const pwd = document.getElementById("<%= Worker_Password_TextBox.ClientID %>");
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
        const cpwd = document.getElementById("<%= Worker_Confirm_Password_TextBox.ClientID %>");
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
