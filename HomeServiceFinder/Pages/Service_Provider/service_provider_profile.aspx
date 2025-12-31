<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_profile.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .section-title {
            grid-column: span 2;
            font-size: 16px;
            font-weight: 700;
            color: #333;
            padding-bottom: 6px;
            border-bottom: 2px solid #e5e7eb;
            margin-top: 10px;
        }

        .profile-card {
            background: #fff;
            padding: 25px;
            width: 100%;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px 24px;
            width: 100%;
        }

        .profile-item {
            display: flex;
            flex-direction: column;
        }

            .profile-item.full-width {
                grid-column: span 2;
            }

        @media (max-width: 768px) {
            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-item.full-width {
                grid-column: span 1;
            }
        }

        .error {
            color: red;
            font-size: 12px;
            margin-top: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="margin-bottom: 20px;">Service Provider Profile</h2>

    <div class="profile-card">

        <div class="profile-grid">

            <!-- PERSONAL INFO TITLE -->
            <div class="section-title full-width">
                Personal Information
            </div>

            <!-- Name -->
            <div class="profile-item">
                <label>Name</label>
                <asp:TextBox ID="UserName" runat="server" CssClass="profile-value" />
                <asp:RequiredFieldValidator ControlToValidate="UserName"
                    ErrorMessage="Name is required" Display="Dynamic"
                    CssClass="error" runat="server" />
            </div>

            <!-- Email -->
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

            <!-- Contact -->
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

            <!-- WORKING INFO TITLE -->
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

            <!-- SECURITY INFO TITLE -->
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
                OnClick="btnEdit_Click" />
            <asp:Button ID="btnUpdate" runat="server"
                Text="Save Changes"
                CssClass="btn btn-edit"
                OnClick="btnUpdate_Click"
                Visible="false" />
        </div>
</asp:Content>
