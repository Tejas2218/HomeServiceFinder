<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_profile.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary: #FDA12B;
            --secondary: #8D9297;
            --light: #F8F9FA;
            --dark: #182333;
            --success: #28a745;
            --danger: #dc3545;
            --info: #0d6efd;
        }

        .profile-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            max-width: 950px;
            margin: 30px auto;
            border: 1px solid #eef0f2;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            /* Large 60px horizontal gap to prevent columns from touching */
            gap: 25px 60px;
            width: 100%;
        }

        .section-title {
            grid-column: span 2;
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--dark);
            padding-bottom: 10px;
            border-bottom: 3px solid var(--primary); /* Using your Orange #FDA12B */
            margin: 35px 0 15px 0;
            letter-spacing: -0.01em;
        }

            .section-title:first-child {
                margin-top: 0;
            }

        .profile-item {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

            .profile-item.full-width {
                grid-column: span 2;
            }

            .profile-item label {
                font-size: 0.75rem;
                font-weight: 700;
                color: var(--secondary); /* Using your Grey #8D9297 */
                margin-bottom: 8px;
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }

        /* Modern Input Styling */
        .form-control, .textbox, select, .profile-value {
            width: 100% !important;
            box-sizing: border-box; /* Prevents padding from breaking the column width */
            padding: 12px 16px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            color: var(--dark);
            transition: all 0.2s ease;
            background-color: var(--light); /* Using your Light Grey #F8F9FA */
        }

            .form-control:focus, select:focus, .profile-value:focus {
                outline: none;
                border-color: var(--primary);
                background-color: #ffffff;
                box-shadow: 0 0 0 4px rgba(253, 161, 43, 0.15); /* Orange glow */
            }

        /* Button Group */
        .action-group {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #e5e7eb;
        }

        .btn {
            /* Set a fixed width that fits your longest text */
            width: 200px;
            /* Alternatively, use min-width if you want them to grow but start at the same size */
            /* min-width: 180px; */

            padding: 12px 0; /* Vertical padding stays, horizontal removed to let 'width' control it */
            border-radius: 8px;
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            transition: 0.3s ease;
            border: none;
            text-transform: uppercase;
            text-align: center; /* Ensures text stays in the middle of the fixed width */
            display: inline-block;
        }

        .btn-back {
            background: var(--secondary);
            color: #ffffff;
        }

            .btn-back:hover {
                background: var(--dark);
            }

        .btn-save, .btn-edit {
            background: var(--primary);
            color: var(--dark);
        }

            .btn-save:hover, .btn-edit:hover {
                background: #e08e22; /* Slightly deeper orange for hover */
                box-shadow: 0 4px 12px rgba(253, 161, 43, 0.2);
                transform: translateY(-1px);
            }

        .error, .validation-error {
            color: var(--danger); /* Using your Red #dc3545 */
            font-size: 12px;
            margin-top: 5px;
            font-weight: 600;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .profile-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .section-title, .profile-item.full-width {
                grid-column: span 1;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-card">
        <h2 style="margin-bottom: 30px; font-weight: 800; color: #111827;">Profile Settings</h2>

        <div class="profile-grid">
            <div class="section-title">Personal Information</div>

            <div class="profile-item">
                <label>Full Name</label>
                <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Enter full name" />
                <asp:RequiredFieldValidator ControlToValidate="UserName" ErrorMessage="Name is required" Display="Dynamic" CssClass="error" runat="server" />
            </div>

            <div class="profile-item">
                <label>Email Address</label>
                <asp:TextBox ID="UserEmail" runat="server" CssClass="form-control" placeholder="email@example.com" />
                <asp:RequiredFieldValidator ControlToValidate="UserEmail" ErrorMessage="Email required" Display="Dynamic" CssClass="error" runat="server" />
            </div>

            <div class="profile-item">
                <label>Contact Number</label>
                <asp:TextBox ID="UserContact" runat="server" CssClass="form-control" placeholder="+1 (555) 000-0000" />
            </div>

            <div class="profile-item">
                <label>State</label>
                <asp:DropDownList ID="StateList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="BindCityList">
                    <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="profile-item">
                <label>City</label>
                <asp:DropDownList ID="CityList" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="profile-item">
                <label>Age</label>
                <asp:TextBox ID="SPAge" runat="server" CssClass="form-control" />
            </div>

            <div class="section-title">Professional Details</div>

            <div class="profile-item">
                <label>Primary Service</label>
                <asp:DropDownList ID="ServiceList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="BindEquipmentList">
                    <asp:ListItem Text="Select Service" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="profile-item">
                <label>Equipment / Sub-Service</label>
                <asp:DropDownList ID="EquipmentList" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Equipment" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="profile-item">
                <label>Experience (Years)</label>
                <asp:TextBox ID="SPExperience" runat="server" CssClass="form-control" placeholder="e.g. 5" />
            </div>

            <div class="profile-item">
                <label>Base Price ($)</label>
                <asp:TextBox ID="SPMinimumPrice" runat="server" CssClass="form-control" placeholder="0.00" />
            </div>

            <div class="profile-item full-width">
                <label>Workshop / Shop Address</label>
                <asp:TextBox ID="SPShopAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" />
            </div>

            <div class="section-title">Security</div>

            <div class="profile-item full-width">
                <label>Account Password</label>
                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••" />
            </div>
        </div>

        <div class="action-group">
            <asp:Button ID="btnBack" runat="server" Text="Cancel" CssClass="btn btn-back" OnClientClick="history.back(); return false;" />

            <asp:Button ID="btnEdit" runat="server" Text="Register as Provider" CssClass="btn btn-save" OnClick="btnEdit_Click" />

            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-save" OnClick="btnUpdate_Click" Visible="false" />
        </div>
    </div>
</asp:Content>
