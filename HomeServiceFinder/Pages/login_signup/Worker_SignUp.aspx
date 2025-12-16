<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" AutoEventWireup="true" CodeBehind="Worker_SignUp.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.Worker_SignUp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        /* Base styles from your original code */
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

        /* --- New styles for multi-step form --- */
        .form-step {
            display: none; /* Hide all steps by default */
            padding: 20px 0;
            border-top: 1px solid #ccc; /* Visual separation for steps */
            margin-top: 10px;
        }

        .step-navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .step-navigation button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .next-btn {
            background-color: #007bff; /* Example: Blue */
            color: white;
        }

        .prev-btn {
            background-color: #6c757d; /* Example: Gray */
            color: white;
        }

        /* Ensure the first step is visible on page load */
        #step1 {
            display: block;
            border-top: none; /* No top border for the first step */
        }

        /* Progress indicator styles (Optional but recommended) */
        .progress-indicator {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .progress-step {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #ddd;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 10px;
            font-weight: bold;
        }
        .progress-step.active {
            background-color: #007bff;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="CurrentStep" runat="server" Value="1" />

    <div class="signup-card">

        <div class="title">Service Provider Sign Up</div>

        <div class="progress-indicator">
            <div id="pStep1" class="progress-step active">1</div>
            <div id="pStep2" class="progress-step">2</div>
            <div id="pStep3" class="progress-step">3</div>
            <div id="pStep4" class="progress-step">4</div>
        </div>

        <div id="step1" class="form-step">
            <h3>1. Personal Details</h3>

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
                runat="server" Display="Dynamic" ValidationGroup="Step1" />

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
                runat="server" Display="Dynamic" ValidationGroup="Step1" />
            <asp:RegularExpressionValidator
                ControlToValidate="Worker_Email_TextBox"
                CssClass="validation-error"
                ErrorMessage="Invalid email format."
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                runat="server" Display="Dynamic" ValidationGroup="Step1" />

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
                runat="server" Display="Dynamic" ValidationGroup="Step1" />
            <asp:RegularExpressionValidator
                ControlToValidate="Worker_Phone_TextBox"
                CssClass="validation-error"
                ErrorMessage="Phone must be 10 digits."
                ValidationExpression="^\d{10}$"
                runat="server" Display="Dynamic" ValidationGroup="Step1" />

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
                runat="server" Display="Dynamic" ValidationGroup="Step1" />
            <asp:RangeValidator
                ControlToValidate="Worker_Age_TextBox"
                CssClass="validation-error"
                ErrorMessage="Age must be between 18 and 70."
                MinimumValue="18"
                MaximumValue="70"
                Type="Integer"
                runat="server" Display="Dynamic" ValidationGroup="Step1" />

            <div class="step-navigation">
                <button type="button" class="next-btn" onclick="nextStep(1)">Next: Address</button>
            </div>
        </div>


        <div id="step2" class="form-step">
            <h3>2. Address Details</h3>

            <div class="input-row">
                <asp:Image CssClass="input-icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

                <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" OnSelectedIndexChanged="StateList_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator
                ControlToValidate="StateList"
                InitialValue=""
                CssClass="validation-error"
                ErrorMessage="Please select a state."
                runat="server" Display="Dynamic" ValidationGroup="Step2" />

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
                runat="server" Display="Dynamic" ValidationGroup="Step2" />


            <div class="input-row">
                <asp:Image CssClass="input-icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
                <asp:TextBox ID="Worker_Address_TextBox" runat="server" CssClass="textbox"
                    placeholder="Enter Home Address"></asp:TextBox>
            </div>

            <asp:RequiredFieldValidator
                ControlToValidate="Worker_Address_TextBox"
                CssClass="validation-error"
                ErrorMessage="Home address is required."
                runat="server" Display="Dynamic" ValidationGroup="Step2" />

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
                runat="server" Display="Dynamic" ValidationGroup="Step2" />

            <div class="step-navigation">
                <button type="button" class="prev-btn" onclick="prevStep(2)">Previous: Personal</button>
                <button type="button" class="next-btn" onclick="nextStep(2)">Next: Service Info</button>
            </div>
        </div>


        <div id="step3" class="form-step">
            <h3>3. Service and Experience Details</h3>

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
                runat="server" Display="Dynamic" ValidationGroup="Step3" />

            <div class="input-row">
                <asp:Image CssClass="input-icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/Worker_Services_Icon.png" />

                <asp:DropDownList ID="Worker_Equipment_DropDown" runat="server" CssClass="textbox">
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator
                ControlToValidate="Worker_Equipment_DropDown"
                InitialValue=""
                CssClass="validation-error"
                ErrorMessage="Please select equipment details."
                runat="server" Display="Dynamic" ValidationGroup="Step3" />


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
                runat="server" Display="Dynamic" ValidationGroup="Step3" />
            <asp:RangeValidator
                ControlToValidate="Worker_Experience_TextBox"
                CssClass="validation-error"
                ErrorMessage="Experience must be between 0 and 50 years."
                MinimumValue="0"
                MaximumValue="50"
                Type="Integer"
                runat="server" Display="Dynamic" ValidationGroup="Step3" />


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
                runat="server" Display="Dynamic" ValidationGroup="Step3" />

            <div class="step-navigation">
                <button type="button" class="prev-btn" onclick="prevStep(3)">Previous: Address</button>
                <button type="button" class="next-btn" onclick="nextStep(3)">Next: Security</button>
            </div>
        </div>


        <div id="step4" class="form-step">
            <h3>4. Account Security</h3>

            <div class="input-row">
                <asp:Image CssClass="input-icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                <asp:TextBox ID="Worker_Password_TextBox" runat="server" CssClass="textbox"
                    TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                <i id="togglePwd" class="fa-solid fa-eye"></i>
            </div>
            <asp:RequiredFieldValidator
                ControlToValidate="Worker_Password_TextBox"
                CssClass="validation-error"
                ErrorMessage="Password is required."
                runat="server" Display="Dynamic" ValidationGroup="Step4" />

            <div class="input-row">
                <asp:Image CssClass="input-icon" runat="server"
                    ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                <asp:TextBox ID="Worker_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                    TextMode="Password" placeholder="Re-enter Password"></asp:TextBox>
                <i id="toggleCPwd" class="fa-solid fa-eye"></i>
            </div>
            <asp:RequiredFieldValidator
                ControlToValidate="Worker_Confirm_Password_TextBox"
                CssClass="validation-error"
                ErrorMessage="Please confirm your password."
                runat="server" Display="Dynamic" ValidationGroup="Step4" />
            <asp:CompareValidator
                ControlToValidate="Worker_Confirm_Password_TextBox"
                ControlToCompare="Worker_Password_TextBox"
                CssClass="validation-error"
                ErrorMessage="Passwords do not match."
                runat="server" Display="Dynamic" ValidationGroup="Step4" />

            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Enabled="false"></asp:Label>


            <div class="step-navigation">
                <button type="button" class="prev-btn" onclick="prevStep(4)">Previous: Service Info</button>
                <asp:Button ID="Worker_Signup_Button" runat="server" CssClass="signup-btn" Text="Sign Up" OnClick="Worker_Signup_Button_Click" ValidationGroup="Step4" />
            </div>
        </div>


    </div>

    <script>
        // Store the current step globally (Starts at 1)
        let currentStep = 1;

        // Function to update the step visibility and progress indicator
        function showStep(step) {

            // ⭐ STORE STEP FOR POSTBACK
            document.getElementById('<%= CurrentStep.ClientID %>').value = step;

            // existing logic
            document.querySelectorAll('.form-step')
                .forEach(s => s.style.display = 'none');

            document.getElementById('step' + step).style.display = 'block';
        }

        // Function to handle the 'Next' button click
        function nextStep(current) {
            // Perform client-side validation for the current step's validation group
            if (typeof (Page_ClientValidate) == 'function') {
                if (!Page_ClientValidate('Step' + current)) {
                    // If validation fails, stop and show error messages
                    return false;
                }
            }

            // If validation passes, move to the next step
            showStep(current + 1);
            return true;
        }

        // Function to handle the 'Previous' button click
        function prevStep(current) {
            showStep(current - 1);
        }

        // --- Password Toggle Scripts (Copied from your original code) ---
        // MAIN PASSWORD
        const pwd = document.getElementById("<%= Worker_Password_TextBox.ClientID %>");
        const icon = document.getElementById("togglePwd");

        if (icon) { // Check if the element exists
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
        }

        // CONFIRM PASSWORD
        const cpwd = document.getElementById("<%= Worker_Confirm_Password_TextBox.ClientID %>");
        const cicon = document.getElementById("toggleCPwd");

        if (cicon) { // Check if the element exists
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
        }
    </script>
</asp:Content>