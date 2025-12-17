<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" AutoEventWireup="true" CodeBehind="Worker_SignUp.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.Worker_SignUp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        /* Grid Layout System */
        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px 30px; /* Increased horizontal gap for better breathing room */
            text-align: left;
            padding: 10px 5px;
        }

        .grid-item {
            flex: 1 1 calc(50% - 30px);
            min-width: 280px;
            margin-bottom: 5px; /* Space for validation messages so they don't push layout */
        }

        .full-row {
            flex: 1 1 100%;
        }

        /* Modern Input Styling */
        .field-label {
            font-weight: 600;
            font-size: 13px;
            color: #444;
            margin-bottom: 8px; /* More space between label and input */
            display: block;
            margin-left: 2px;
        }

        .input-row {
            position: relative;
            display: flex;
            align-items: center; /* Vertically centers items in the row */
        }

        .textbox {
            width: 100%;
            padding: 13px 15px 13px 45px; /* Increased left padding for icon room */
            border-radius: 10px;
            border: 1px solid #dcdcdc;
            background: #fdfdfd;
            box-sizing: border-box;
            font-size: 14px;
            transition: all 0.2s ease;
        }

            .textbox:focus {
                border-color: #0066ff;
                background: #fff;
                outline: none;
                box-shadow: 0 0 0 3px rgba(0, 102, 255, 0.1);
            }

        /* Adjusted Icon Logic */
        .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%); /* Precisely centers the image icon */
            width: 18px;
            height: 18px;
            object-fit: contain; /* Prevents icon distortion */
            opacity: 0.7;
        }

        /* Validation Spacing */
        .validation-error {
            color: #e74c3c;
            font-size: 11px;
            margin-top: 5px;
            font-weight: 500;
            display: block;
        }

        /* Step Header Styling */
        h3 {
            color: #222;
            margin: 10px 0 25px 0;
            border-left: 5px solid #0066ff;
            padding-left: 15px;
            font-size: 19px;
            letter-spacing: 0.5px;
        }

        /* Password Eye Icon Adjustment */
        #togglePwd, #toggleCPwd {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            cursor: pointer;
            font-size: 16px;
        }

        /* Progress Indicator Spacing */
        .progress-indicator {
            display: flex;
            justify-content: center;
            margin: 10px 0 35px 0;
            gap: 20px;
        }

        /* Navigation Buttons */
        .step-navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 40px; /* Clear separation from form fields */
            padding-top: 20px;
            border-top: 1px solid #f0f0f0;
            gap: 20px;
        }

        .nav-btn {
            padding: 14px 30px;
            border-radius: 50px; /* Rounder buttons for modern look */
            border: none;
            font-weight: 700;
            cursor: pointer;
            flex: 1;
            font-size: 15px;
            transition: transform 0.2s;
        }

            .nav-btn:active {
                transform: scale(0.98);
            }

        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px 30px;
            text-align: left;
            padding: 10px 5px;
        }

        .grid-item {
            flex: 1 1 calc(50% - 30px);
            min-width: 280px;
        }

        .full-row {
            flex: 1 1 100%;
        }

        /* --- Progress Indicator Styles (Restored) --- */
        .progress-indicator {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 10px 0 40px 0;
            gap: 0; /* Gap handled by lines */
        }

        .progress-step {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #f0f0f0;
            color: #999;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 16px;
            border: 3px solid #e0e0e0;
            transition: all 0.3s ease;
            position: relative;
            z-index: 2;
        }

            .progress-step.active {
                background: #0066ff;
                color: #ffffff;
                border-color: #0047b3;
                box-shadow: 0 0 10px rgba(0, 102, 255, 0.4);
            }

        /* Modern Input Styling */
        .field-label {
            font-weight: 600;
            font-size: 13px;
            color: #444;
            margin-bottom: 8px;
            display: block;
        }

        .input-row {
            position: relative;
        }

        .textbox {
            width: 100%;
            padding: 13px 15px 13px 45px;
            border-radius: 10px;
            border: 1px solid #dcdcdc;
            background: #fdfdfd;
            box-sizing: border-box;
            font-size: 14px;
        }

        .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            width: 18px;
            height: 18px;
            object-fit: contain;
        }

        /* --- Navigation Button Styles (Restored & Fixed) --- */
        .step-navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
            padding-top: 25px;
            border-top: 1px solid #eee;
            gap: 15px;
        }

        .nav-btn {
            padding: 14px 25px;
            border-radius: 12px;
            border: none;
            font-weight: 700;
            cursor: pointer;
            flex: 1;
            font-size: 14px;
            transition: all 0.2s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Previous Button (Gray) */
        .prev-btn {
            background: #f8f9fa;
            color: #6c757d;
            border: 1px solid #dee2e6;
        }

            .prev-btn:hover {
                background: #e2e6ea;
                color: #343a40;
            }

        /* Next Button (Blue) */
        .next-btn {
            background: #0066ff;
            color: white;
            box-shadow: 0 4px 12px rgba(0, 102, 255, 0.2);
        }

            .next-btn:hover {
                background: #0052cc;
                transform: translateY(-1px);
            }

        /* Sign Up Button (Yellow/Theme) */
        .signup-btn {
            background: #ffcc00;
            color: #000;
            font-weight: 800;
            box-shadow: 0 4px 12px rgba(255, 204, 0, 0.3);
        }

            .signup-btn:hover {
                background: #e6b800;
            }

        .validation-error {
            color: #e74c3c;
            font-size: 11px;
            margin-top: 5px;
            display: block;
        }

        h3 {
            color: #333;
            margin-bottom: 25px;
            border-left: 4px solid #0066ff;
            padding-left: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="CurrentStep" runat="server" Value="1" />

    <div class="progress-indicator">
        <div id="pStep1" class="progress-step active">1</div>
        <div id="pStep2" class="progress-step">2</div>
        <div id="pStep3" class="progress-step">3</div>
        <div id="pStep4" class="progress-step">4</div>
    </div>

    <div id="step1" class="form-step">
        <h3>1. Personal Details</h3>
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
            <button type="button" class="nav-btn next-btn" onclick="nextStep(1)">Next: Address Details</button>
        </div>
    </div>

    <div id="step2" class="form-step">
        <h3>2. Address Details</h3>
        <div class="form-grid">
            <div class="grid-item">
                <label class="field-label">State</label>
                <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" OnSelectedIndexChanged="StateList_SelectedIndexChanged" AutoPostBack="true" Style="padding-left: 15px;"></asp:DropDownList>
            </div>
            <div class="grid-item">
                <label class="field-label">City</label>
                <asp:DropDownList ID="CityList" runat="server" CssClass="textbox" Style="padding-left: 15px;"></asp:DropDownList>
            </div>
            <div class="grid-item">
                <label class="field-label">Home Address</label>
                <asp:TextBox ID="Worker_Address_TextBox" runat="server" CssClass="textbox" placeholder="Residence Address" Style="padding-left: 15px;"></asp:TextBox>
            </div>
            <div class="grid-item">
                <label class="field-label">Shop/Work Address</label>
                <asp:TextBox ID="Worker_ShopAddress_TextBox" runat="server" CssClass="textbox" placeholder="Business Address" Style="padding-left: 15px;"></asp:TextBox>
            </div>
        </div>
        <div class="step-navigation">
            <button type="button" class="nav-btn prev-btn" onclick="prevStep(2)">Back</button>
            <button type="button" class="nav-btn next-btn" onclick="nextStep(2)">Next: Services</button>
        </div>
    </div>

    <div id="step3" class="form-step">
        <h3>3. Experience & Pricing</h3>
        <div class="form-grid">
            <div class="grid-item">
                <label class="field-label">Service Type</label>
                <asp:DropDownList ID="Worker_ServiceType_DropDown" runat="server" CssClass="textbox" AutoPostBack="true" Style="padding-left: 15px;" OnSelectedIndexChanged="Worker_ServiceType_DropDown_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="grid-item">
                <label class="field-label">Equipment Status</label>
                <asp:DropDownList ID="Worker_Equipment_DropDown" runat="server" CssClass="textbox" Style="padding-left: 15px;"></asp:DropDownList>
            </div>
            <div class="grid-item">
                <label class="field-label">Experience (Years)</label>
                <asp:TextBox ID="Worker_Experience_TextBox" runat="server" CssClass="textbox" TextMode="Number" placeholder="Years of work" Style="padding-left: 15px;"></asp:TextBox>
            </div>
            <div class="grid-item">
                <label class="field-label">Minimum Price (₹)</label>
                <asp:TextBox ID="Worker_MinimumPrice_TextBox" runat="server" CssClass="textbox" TextMode="Number" placeholder="Base Rate" Style="padding-left: 15px;"></asp:TextBox>
            </div>
        </div>
        <div class="step-navigation">
            <button type="button" class="nav-btn prev-btn" onclick="prevStep(3)">Back</button>
            <button type="button" class="nav-btn next-btn" onclick="nextStep(3)">Next: Security</button>
        </div>
    </div>

    <div id="step4" class="form-step">
        <h3>4. Account Security</h3>
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

    <script>
        function showStep(step) {
            document.getElementById('<%= CurrentStep.ClientID %>').value = step;
            document.querySelectorAll('.form-step').forEach(s => s.style.display = 'none');
            document.getElementById('step' + step).style.display = 'block';

            // Update progress bubbles
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

        // Run on load
        window.onload = initToggles;

        // Existing Password Toggle logic remains same...
    </script>
</asp:Content>
