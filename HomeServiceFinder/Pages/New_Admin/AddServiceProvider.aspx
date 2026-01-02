<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="AddServiceProvider.aspx.cs"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.AddServiceProvider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8);
            z-index: 9999;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .spinner {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #3498db;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>

    <div id="overlay">
        <div class="spinner"></div>
        <p style="margin-top: 10px; font-weight: bold; color: #333;">Processing, please wait...</p>
    </div>

    <h2 style="margin-bottom: 20px;">Service Provider Profile</h2>

    <div class="profile-card">

        <div class="profile-grid">

            <div class="section-title full-width">
                Personal Information
            </div>

            <div class="profile-item">
                <label>Name</label>
                <asp:TextBox ID="UserName" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator ControlToValidate="UserName"
                    ErrorMessage="Name is required" Display="Dynamic"
                    CssClass="error" runat="server" />
            </div>

            <div class="profile-item">
                <label>Email</label>
                <asp:TextBox ID="UserEmail" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator Display="Dynamic"
                    ControlToValidate="UserEmail"
                    ErrorMessage="Email is required"
                    CssClass="error" runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="UserEmail"
                    Display="Dynamic"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="Invalid email format"
                    CssClass="error" runat="server" />
            </div>

            <div class="profile-item">
                <label>Contact Number</label>
                <asp:TextBox ID="UserContact" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator ControlToValidate="UserContact"
                    Display="Dynamic"
                    ErrorMessage="Contact number is required"
                    CssClass="error" runat="server" />
            </div>

            <div class="profile-item">
                <label>State</label>
                <div class="input-row">
                    <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList" Style="padding-left: 15px;">
                        <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="StateList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a state" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="profile-item">
                <label>City</label>
                <div class="input-row">
                    <asp:DropDownList ID="CityList" runat="server" CssClass="textbox" Style="padding-left: 15px;">
                        <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="CityList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a city" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="profile-item full-width">
                <label>Address</label>
                <asp:TextBox ID="UserAddress" runat="server" CssClass="profile-value" />
            </div>

            <div class="section-title full-width">
                Working Information
            </div>

            <div class="profile-item">
                <label>Service</label>
                <div class="input-row">
                    <asp:DropDownList ID="ServiceList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindEquipmentList" Style="padding-left: 15px;">
                        <asp:ListItem Text="Select Service" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="ServiceList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a Service" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="profile-item">
                <label>Equipment</label>
                <div class="input-row">
                    <asp:DropDownList ID="EquipmentList" runat="server" CssClass="textbox" Style="padding-left: 15px;">
                        <asp:ListItem Text="Select Equipment" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="EquipmentList" InitialValue="" CssClass="validation-error" ErrorMessage="Select a Equipment" ValidationGroup="signup" Display="Dynamic" runat="server" />
            </div>

            <div class="profile-item">
                <label>Age</label>
                <asp:TextBox ID="SPAge" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="SPAge"
                    ErrorMessage="Age is required"
                    ForeColor="Red" />
                <asp:RangeValidator runat="server"
                    ControlToValidate="SPAge"
                    MinimumValue="18"
                    MaximumValue="100"
                    Type="Integer"
                    ErrorMessage="Age must be between 18 and 100"
                    ForeColor="Red" />
            </div>

            <div class="profile-item">
                <label>Experience (Years)</label>
                <asp:TextBox ID="SPExperience" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="SPExperience"
                    ErrorMessage="Experience is required"
                    ForeColor="Red" />
                <asp:RangeValidator runat="server"
                    ControlToValidate="SPExperience"
                    MinimumValue="0"
                    MaximumValue="50"
                    Type="Integer"
                    ErrorMessage="Experience must be between 0 and 50 years"
                    ForeColor="Red" />
            </div>

            <div class="profile-item">
                <label>Minimum Price</label>
                <asp:TextBox ID="SPMinimumPrice" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="SPMinimumPrice"
                    ErrorMessage="Minimum price is required"
                    ForeColor="Red" />
                <asp:CompareValidator runat="server"
                    ControlToValidate="SPMinimumPrice"
                    Operator="DataTypeCheck"
                    Type="Double"
                    ErrorMessage="Enter a valid price"
                    ForeColor="Red" />
            </div>

            <div class="profile-item full-width">
                <label>Shop Address</label>
                <asp:TextBox ID="SPShopAddress" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="SPShopAddress"
                    ErrorMessage="Shop address is required"
                    ForeColor="Red" />
            </div>

            <div class="section-title full-width">
                Security Information
            </div>

            <div class="profile-item full-width">
                <label>Password</label>
                <asp:TextBox ID="Password" runat="server"
                    CssClass="profile-value" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="Password"
                    ErrorMessage="Password is required"
                    ForeColor="Red" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="Password"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"
                    ErrorMessage="Password must be at least 6 characters with letters and numbers"
                    ForeColor="Red" />
            </div>

        </div>


        <div style="text-align: center; margin-top: 20px;">
            <asp:Button ID="btnBack" runat="server" Text="← Back"
                CssClass="btn btn-view"
                OnClientClick="history.back(); return false;" />

            <asp:Button ID="btnEdit" runat="server"
                Text="Add Service Provider"
                CssClass="btn btn-edit"
                OnClick="btnEdit_Click"
                OnClientClick="return showLoader();" />

            <asp:Button ID="btnUpdate" runat="server"
                Text="Save Changes"
                CssClass="btn btn-edit"
                OnClick="btnUpdate_Click"
                Visible="false"
                OnClientClick="return showLoader();" />
        </div>
    </div>

    <script type="text/javascript">
        function showLoader() {
            // Check if client-side validation passes before showing the loader
            if (typeof (Page_ClientValidate) == 'function') {
                var isValid = Page_ClientValidate();
                if (isValid) {
                    document.getElementById('overlay').style.display = 'flex';
                }
                return isValid;
            }
            // Fallback if no validators are present
            document.getElementById('overlay').style.display = 'flex';
            return true;
        }
    </script>
</asp:Content>