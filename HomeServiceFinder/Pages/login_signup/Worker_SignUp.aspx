<%@ Page Title="Worker Sign Up" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" AutoEventWireup="true" CodeBehind="Worker_SignUp.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.Worker_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        /* --- 1. GLOBAL RESET & BACKGROUND --- */
        body, form {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            background-attachment: fixed !important;
            min-height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            /* Flexbox to center the main container vertically and horizontally */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Clean up Master Page interference */
        .container, .card, .main-content, #ContentPlaceHolder1 {
            background: transparent !important;
            box-shadow: none !important;
            border: none !important;
            width: 100%; /* Ensure full width availability */
            display: flex;
            justify-content: center; /* Center the glass card */
        }

        /* --- 2. THE MAIN BIG GLASS CONTAINER --- */
        .main-glass-container {
            /* Glass Effect Applied Here */
            background: rgba(255, 255, 255, 0.1); 
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            
            /* Borders and Depth */
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-top: 1px solid rgba(255, 255, 255, 0.5);
            border-left: 1px solid rgba(255, 255, 255, 0.5);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            
            border-radius: 25px;
            padding: 40px;
            
            /* Size and Positioning */
            width: 100%;
            max-width: 800px;
            margin: 20px; /* Spacing on mobile */
            color: #fff;
            position: relative;
            z-index: 10;
        }

        /* --- 3. PROGRESS INDICATOR --- */
        .progress-indicator {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 30px;
            gap: 20px;
        }

        .progress-step {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0.2); /* Darker background inside glass */
            color: rgba(255,255,255,0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.4s ease;
        }

        .progress-step.active {
            background: #fff;
            color: #764ba2;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.6);
            transform: scale(1.1);
            border-color: #fff;
        }

        /* --- 4. STEP WRAPPER (No Glass Here, just structure) --- */
        .form-step {
            display: none; /* Controlled by JS */
            animation: fadeIn 0.5s ease;
        }

        /* Simple Fade In Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        #step1 { display: block; }

        h3 {
            color: #fff;
            margin: 0 0 30px 0;
            text-align: center;
            font-size: 26px;
            font-weight: 700;
            text-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        /* --- 5. GRID LAYOUT --- */
        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            text-align: left;
        }

        .grid-item {
            flex: 1 1 calc(50% - 25px);
            min-width: 250px;
        }

        .full-row { flex: 1 1 100%; }

        /* --- 6. INPUT STYLING --- */
        .field-label {
            font-weight: 600;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 8px;
            display: block;
            margin-left: 5px;
        }

        .input-row { position: relative; }

        .textbox {
            width: 100%;
            padding: 12px 15px 12px 45px;
            height: 50px;
            border-radius: 12px;
            
            /* Inner Glass for Inputs */
            background: rgba(0, 0, 0, 0.15); /* Slightly darker for contrast */
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            
            box-sizing: border-box;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .textbox::placeholder { color: rgba(255, 255, 255, 0.5); }

        .textbox:focus {
            background: rgba(0, 0, 0, 0.25);
            border-color: #FF8C00;
            outline: none;
            box-shadow: 0 0 10px rgba(255, 140, 0, 0.3);
        }

        select.textbox option { 
            background: #333; 
            color: #fff; 
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            filter: brightness(0) invert(1);
            opacity: 0.8;
            z-index: 2;
        }

        /* --- 7. BUTTONS --- */
        .step-navigation {
            display: flex;
            margin-top: 35px;
            gap: 20px;
        }

        .nav-btn {
            padding: 14px 25px;
            border-radius: 50px;
            border: none;
            font-weight: 700;
            cursor: pointer;
            flex: 1;
            font-size: 15px;
            transition: all 0.3s ease;
            text-transform: uppercase;
        }

        .prev-btn {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .prev-btn:hover { background: rgba(255, 255, 255, 0.2); }

        .next-btn, .signup-btn {
            background: linear-gradient(90deg, #FF8C00, #FF5F6D);
            color: white;
            box-shadow: 0 5px 15px rgba(255, 95, 109, 0.4);
        }

        .next-btn:hover, .signup-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(255, 95, 109, 0.6);
        }

        .validation-error {
            color: #ffcccc;
            font-size: 12px;
            margin-top: 6px;
            display: block;
            font-weight: 600;
        }

        #togglePwd, #toggleCPwd {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #fff;
            cursor: pointer;
            z-index: 5;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="CurrentStep" runat="server" Value="1" />

    <div class="main-glass-container">
        
        <div class="progress-indicator">
            <div id="pStep1" class="progress-step active">1</div>
            <div id="pStep2" class="progress-step">2</div>
            <div id="pStep3" class="progress-step">3</div>
            <div id="pStep4" class="progress-step">4</div>
        </div>

        <div id="step1" class="form-step">
            <h3>Personal Details</h3>
            <div class="form-grid">
                <div class="grid-item full-row">
                    <label class="field-label">Full Name</label>
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
                        <asp:TextBox ID="Worker_Name_TextBox" runat="server" CssClass="textbox" placeholder="Jane Doe"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ControlToValidate="Worker_Name_TextBox" CssClass="validation-error" ErrorMessage="Full name is required." runat="server" Display="Dynamic" ValidationGroup="Step1" />
                </div>

                <div class="grid-item">
                    <label class="field-label">Phone Number</label>
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
                        <asp:TextBox ID="Worker_Phone_TextBox" runat="server" CssClass="textbox" TextMode="Phone" MaxLength="10" placeholder="10-digit mobile number"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ControlToValidate="Worker_Phone_TextBox" CssClass="validation-error" ErrorMessage="Phone is required." runat="server" Display="Dynamic" ValidationGroup="Step1" />
                    <asp:RegularExpressionValidator ControlToValidate="Worker_Phone_TextBox" CssClass="validation-error" ErrorMessage="Invalid phone." ValidationExpression="^\d{10}$" runat="server" Display="Dynamic" ValidationGroup="Step1" />
                </div>

                <div class="grid-item">
                    <label class="field-label">Age</label>
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server" ImageUrl="~/Assests/Login_SignUp/Worker_Age_Icon.png" />
                        <asp:TextBox ID="Worker_Age_TextBox" runat="server" CssClass="textbox" TextMode="Number" placeholder="Min 18"></asp:TextBox>
                    </div>
                    <asp:RangeValidator ControlToValidate="Worker_Age_TextBox" MinimumValue="18" MaximumValue="70" Type="Integer" CssClass="validation-error" ErrorMessage="Age 18-70 only" runat="server" Display="Dynamic" ValidationGroup="Step1" />
                </div>

                <div class="grid-item full-row">
                    <label class="field-label">Email Address</label>
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                        <asp:TextBox ID="Worker_Email_TextBox" runat="server" CssClass="textbox" TextMode="Email" placeholder="jane@example.com"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ControlToValidate="Worker_Email_TextBox" CssClass="validation-error" ErrorMessage="Email is required." runat="server" Display="Dynamic" ValidationGroup="Step1" />
                </div>
            </div>
            <div class="step-navigation">
                <button type="button" class="nav-btn next-btn" onclick="nextStep(1)">Next: Address</button>
            </div>
        </div>

        <div id="step2" class="form-step">
            <h3>Address Details</h3>
            <div class="form-grid">
                <div class="grid-item">
                    <label class="field-label">State</label>
                    <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" OnSelectedIndexChanged="StateList_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="grid-item">
                    <label class="field-label">City</label>
                    <asp:DropDownList ID="CityList" runat="server" CssClass="textbox"></asp:DropDownList>
                </div>
                <div class="grid-item">
                    <label class="field-label">Home Address</label>
                    <asp:TextBox ID="Worker_Address_TextBox" runat="server" CssClass="textbox" placeholder="Residence Address"></asp:TextBox>
                </div>
                <div class="grid-item">
                    <label class="field-label">Shop/Work Address</label>
                    <asp:TextBox ID="Worker_ShopAddress_TextBox" runat="server" CssClass="textbox" placeholder="Business Address"></asp:TextBox>
                </div>
            </div>
            <div class="step-navigation">
                <button type="button" class="nav-btn prev-btn" onclick="prevStep(2)">Back</button>
                <button type="button" class="nav-btn next-btn" onclick="nextStep(2)">Next: Services</button>
            </div>
        </div>

        <div id="step3" class="form-step">
            <h3>Experience & Pricing</h3>
            <div class="form-grid">
                <div class="grid-item">
                    <label class="field-label">Service Type</label>
                    <asp:DropDownList ID="Worker_ServiceType_DropDown" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="Worker_ServiceType_DropDown_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="grid-item">
                    <label class="field-label">Equipment Status</label>
                    <asp:DropDownList ID="Worker_Equipment_DropDown" runat="server" CssClass="textbox"></asp:DropDownList>
                </div>
                <div class="grid-item">
                    <label class="field-label">Experience (Years)</label>
                    <asp:TextBox ID="Worker_Experience_TextBox" runat="server" CssClass="textbox" TextMode="Number" placeholder="Years of work"></asp:TextBox>
                </div>
                <div class="grid-item">
                    <label class="field-label">Minimum Price (₹)</label>
                    <asp:TextBox ID="Worker_MinimumPrice_TextBox" runat="server" CssClass="textbox" TextMode="Number" placeholder="Base Rate"></asp:TextBox>
                </div>
            </div>
            <div class="step-navigation">
                <button type="button" class="nav-btn prev-btn" onclick="prevStep(3)">Back</button>
                <button type="button" class="nav-btn next-btn" onclick="nextStep(3)">Next: Security</button>
            </div>
        </div>

        <div id="step4" class="form-step">
            <h3>Account Security</h3>
            <div class="form-grid">
                <div class="grid-item">
                    <label class="field-label">Password</label>
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                        <asp:TextBox ID="Worker_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........"></asp:TextBox>
                        <i id="togglePwd" class="fa-solid fa-eye"></i>
                    </div>
                    <asp:RequiredFieldValidator ControlToValidate="Worker_Password_TextBox" CssClass="validation-error" ErrorMessage="Password is required." runat="server" Display="Dynamic" ValidationGroup="Step4" />
                </div>

                <div class="grid-item">
                    <label class="field-label">Confirm Password</label>
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server" ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                        <asp:TextBox ID="Worker_Confirm_Password_TextBox" runat="server" CssClass="textbox" TextMode="Password" placeholder="........"></asp:TextBox>
                        <i id="toggleCPwd" class="fa-solid fa-eye"></i>
                    </div>
                    <asp:CompareValidator ControlToValidate="Worker_Confirm_Password_TextBox" ControlToCompare="Worker_Password_TextBox" CssClass="validation-error" ErrorMessage="Passwords do not match." runat="server" Display="Dynamic" ValidationGroup="Step4" />
                </div>

                <div class="grid-item full-row" style="text-align: center;">
                    <asp:Label ID="ErrorLabel" runat="server" CssClass="validation-error" Style="font-size: 14px; font-weight: bold;"></asp:Label>
                </div>
            </div>

            <div class="step-navigation">
                <button type="button" class="nav-btn prev-btn" onclick="prevStep(4)">Back</button>
                <asp:Button ID="Worker_Signup_Button" runat="server" CssClass="nav-btn signup-btn" Text="Complete Registration" OnClick="Worker_Signup_Button_Click" ValidationGroup="Step4" />
            </div>
        </div>

    </div> 
    <script>
        function showStep(step) {
            document.getElementById('<%= CurrentStep.ClientID %>').value = step;
            document.querySelectorAll('.form-step').forEach(s => s.style.display = 'none');
            document.getElementById('step' + step).style.display = 'block';

            document.querySelectorAll('.progress-step').forEach((el, index) => {
                if (index + 1 <= step) el.classList.add('active');
                else el.classList.remove('active');
            });
        }

        function nextStep(current) {
            if (typeof (Page_ClientValidate) == 'function') {
                if (!Page_ClientValidate('Step' + current)) return false;
            }
            showStep(current + 1);
        }

        function prevStep(current) { showStep(current - 1); }

        function initToggles() {
            const setup = (txtId, iconId) => {
                const txt = document.getElementById(txtId);
                const icon = document.getElementById(iconId);
                if (icon && txt) {
                    icon.onclick = function () {
                        const isPwd = txt.getAttribute("type") === "password";
                        txt.setAttribute("type", isPwd ? "text" : "password");
                        this.classList.toggle("fa-eye");
                        this.classList.toggle("fa-eye-slash");
                    };
                }
            };
            setup("<%= Worker_Password_TextBox.ClientID %>", "togglePwd");
            setup("<%= Worker_Confirm_Password_TextBox.ClientID %>", "toggleCPwd");
        }

        window.onload = function() {
            initToggles();
            const savedStep = parseInt(document.getElementById('<%= CurrentStep.ClientID %>').value);
            if (savedStep > 1) showStep(savedStep);
        };
    </script>
</asp:Content>