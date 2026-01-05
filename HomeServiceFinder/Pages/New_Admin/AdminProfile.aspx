<%@ Page Language="C#"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    AutoEventWireup="true"
    CodeBehind="AdminProfile.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .page-title {
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 20px;
        }

        .card {
            background: #ffffff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .profile-card {
            grid-column: span 2;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
        }

        .profile-img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            border: 2px solid #ddd;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            margin-top: 10px;
            display: block;
        }

        .input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
            font-size: 14px;
        }

        .toggle {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 12px 0;
            font-size: 14px;
        }

        .btn-primary {
            width: 100%;
            padding: 10px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            margin-top: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-warning {
            width: 100%;
            padding: 10px;
            background: #f59e0b;
            color: white;
            border: none;
            border-radius: 8px;
            margin-top: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-warning:hover {
            background: #d97706;
        }
    </style>
    <h2 class="page-title">Admin Profile</h2>

    <div class="profile-grid">

        <!-- Profile Card -->
        <div class="card profile-card">
            <div class="profile-header">
                <img src="../../Assets/admin.png" class="profile-img" />
                <h3>Admin Details</h3>
            </div>

            <label>Full Name</label>
            <asp:TextBox runat="server" CssClass="input" Placeholder="Admin Name" />

            <label>Email</label>
            <asp:TextBox runat="server" CssClass="input" TextMode="Email" Placeholder="admin@email.com" />

            <label>Phone Number</label>
            <asp:TextBox runat="server" CssClass="input" Placeholder="9876543210" />

            <label>Role</label>
            <asp:TextBox runat="server" CssClass="input" Text="Administrator" ReadOnly="true" />

            <label>Address</label>
            <asp:TextBox runat="server" CssClass="input" TextMode="MultiLine" Rows="3"
                Placeholder="Office Address" />

            <label>Last Login</label>
            <asp:TextBox runat="server" CssClass="input" Text="05 Jan 2026, 10:30 AM" ReadOnly="true" />

            <asp:Button runat="server" Text="Save Profile" CssClass="btn-primary" />
        </div>

        <!-- Change Password -->
        <div class="card">
            <h3>Change Password</h3>

            <label>Current Password</label>
            <asp:TextBox runat="server" CssClass="input" TextMode="Password" />

            <label>New Password</label>
            <asp:TextBox runat="server" CssClass="input" TextMode="Password" />

            <label>Confirm Password</label>
            <asp:TextBox runat="server" CssClass="input" TextMode="Password" />

            <asp:Button runat="server" Text="Update Password" CssClass="btn-warning" />
        </div>

        <!-- System Settings -->
        <div class="card">
            <h3>System Settings</h3>

            <div class="toggle">
                <asp:CheckBox runat="server" Checked="true" />
                <span>Email Notifications</span>
            </div>

            <div class="toggle">
                <asp:CheckBox runat="server" />
                <span>SMS Notifications</span>
            </div>

            <div class="toggle">
                <asp:CheckBox runat="server" />
                <span>Maintenance Mode</span>
            </div>

            <asp:Button runat="server" Text="Save Settings" CssClass="btn-primary" />
        </div>

    </div>

</asp:Content>
