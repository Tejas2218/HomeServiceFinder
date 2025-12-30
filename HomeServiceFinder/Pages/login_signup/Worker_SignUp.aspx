<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SignUp_Master.Master" AutoEventWireup="true" CodeBehind="Worker_SignUp.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.Worker_SignUp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        /* 1. Grid Layout System */
        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 5px 20px;
            text-align: left;
            padding: 5px;
        }

        .grid-item {
            flex: 1 1 calc(50% - 25px);
            min-width: 250px;
            margin-bottom: 2px;
        }

        .full-row {
            flex: 1 1 100%;
        }

        /* 2. Modern Input Styling - Orange Theme */
        .field-label {
            font-weight: 600;
            font-size: 12px;
            color: #444;
            margin-bottom: 3px;
            display: block;
            margin-left: 2px;
        }

        .input-row {
            position: relative;
            display: flex;
            align-items: center;
        }

        .textbox {
            width: 100%;
            padding: 6px 12px 6px 40px;
            height: 34px;
            border-radius: 8px;
            border: 1px solid #dcdcdc;
            background: #fdfdfd;
            box-sizing: border-box;
            font-size: 13px;
            transition: all 0.2s ease;
        }

        select.textbox {
            height: 34px !important;
            padding-top: 0px !important;
            padding-bottom: 0px !important;
        }

        /* Orange Focus Effect */
        .textbox:focus {
            border-color: #FF8C00;
            background: #fff;
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 140, 0, 0.1);
        }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            width: 16px;
            height: 16px;
            object-fit: contain;
            opacity: 0.7;
        }

        /* 3. Headers & Progress - Orange Accent */
        h3 {
            color: #222;
            margin: 5px 0 10px 0;
            border-left: 5px solid #FF8C00; /* Changed from Blue to Orange */
            padding-left: 12px;
            font-size: 17px;
        }

        .progress-indicator {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 5px 0 15px 0;
            gap: 0;
        }

        .progress-step {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #f0f0f0;
            color: #999;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 13px;
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
            position: relative;
            z-index: 2;
        }

            /* Active Progress - Orange */
            .progress-step.active {
                background: #FF8C00;
                color: #ffffff;
                border-color: #E67E00;
                box-shadow: 0 0 8px rgba(255, 140, 0, 0.4);
            }

        /* 4. Navigation & Buttons - Vibrant Orange */
        .step-navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            padding-top: 10px;
            border-top: 1px solid #f0f0f0;
            gap: 15px;
        }

        .nav-btn {
            padding: 10px 20px;
            border-radius: 10px;
            border: none;
            font-weight: 700;
            cursor: pointer;
            flex: 1;
            font-size: 14px;
            transition: all 0.2s ease;
            text-transform: uppercase;
        }

        .prev-btn {
            background: #f8f9fa;
            color: #6c757d;
            border: 1px solid #dee2e6;
        }

        .next-btn {
            background: #FF8C00; /* Vibrant Orange */
            color: white;
        }

            .next-btn:hover {
                background: #E67E00;
            }

        .signup-btn {
            background: #FF8C00;
            color: #fff;
            box-shadow: 0 4px 10px rgba(255, 140, 0, 0.3);
        }

            .signup-btn:hover {
                background: #E67E00;
            }

        /* 5. Validation & Extras */
        .validation-error {
            color: #e74c3c;
            font-size: 10px;
            margin-top: 1px;
            display: block;
            line-height: 1.1;
        }

        #togglePwd, #toggleCPwd {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            cursor: pointer;
            font-size: 14px;
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
>