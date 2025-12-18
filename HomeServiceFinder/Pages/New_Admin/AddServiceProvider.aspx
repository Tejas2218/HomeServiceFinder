<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddServiceProvider.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.AddServiceProvider" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin | Add Service Provider</title>

    <style>
        :root {
            --primary: #FDA12B;
            --secondary: #8D9297;
            --light: #F8F9FA;
            --dark: #182333;
        }

        body {
            margin: 0;
            background: var(--light);
            font-family: 'Segoe UI', sans-serif;
            color: var(--dark);
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background: var(--dark);
            height: 100vh;
            position: fixed;
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            color: var(--primary);
            margin-bottom: 30px;
        }

        .menu-item {
            padding: 14px 25px;
        }

        .menu-item a {
            color: var(--light);
            text-decoration: none;
            display: block;
        }

        .menu-item:hover {
            background: var(--primary);
        }

        .menu-item:hover a {
            color: var(--dark);
            font-weight: 600;
        }

        /* Topbar */
        .topbar {
            margin-left: 240px;
            height: 65px;
            background: #fff;
            border-bottom: 3px solid var(--primary);
            display: flex;
            align-items: center;
            padding: 0 25px;
            position: fixed;
            width: calc(100% - 240px);
        }

        /* Content */
        .content {
            margin-left: 240px;
            padding: 100px 30px 30px;
        }

        /* Form Card */
        .form-box {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            max-width: 700px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn-group {
            margin-top: 25px;
        }

        .btn {
            padding: 10px 18px;
            border-radius: 6px;
            font-weight: 600;
            text-decoration: none;
            margin-right: 10px;
            border: none;
            cursor: pointer;
        }

        .btn-save {
            background: var(--primary);
            color: var(--dark);
        }

        .btn-cancel {
            background: var(--secondary);
            color: #fff;
        }

        .btn-save:hover {
            background: #e38c1f;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>

        <div class="menu-item"><a href="AdminDashbord.aspx">🏠 Dashboard</a></div>
        <div class="menu-item"><a href="User.aspx">👥 Users</a></div>
        <div class="menu-item"><a href="ServiceProvider.aspx">🛠 Service Providers</a></div>
        <div class="menu-item"><a href="#">📅 Bookings</a></div>
        <div class="menu-item"><a href="#">📊 Reports</a></div>
        <div class="menu-item"><a href="#">⚙ Settings</a></div>
    </div>

    <!-- Topbar -->
    <div class="topbar">
        <h3>Add Service Provider</h3>
    </div>

    <!-- Content -->
    <div class="content">

        <div class="form-box">
            <h3>Service Provider Details</h3>
            <hr />

            <div class="form-group">
                <label>Full Name</label>
                <asp:TextBox ID="txtName" runat="server" />
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <asp:TextBox ID="txtMobile" runat="server" />
            </div>

            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>

            <div class="form-group">
                <label>Service Type</label>
                <asp:DropDownList ID="ddlService" runat="server">
                    <asp:ListItem Text="-- Select Service --" Value="" />
                    <asp:ListItem Text="Plumber" />
                    <asp:ListItem Text="Electrician" />
                    <asp:ListItem Text="AC Repair" />
                    <asp:ListItem Text="Cleaning" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Experience (Years)</label>
                <asp:TextBox ID="txtExperience" runat="server" />
            </div>

            <div class="form-group">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Text="Active" />
                    <asp:ListItem Text="Inactive" />
                </asp:DropDownList>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnSave" runat="server" Text="Save"
                    CssClass="btn btn-save" />
                <a href="ServiceProvider.aspx" class="btn btn-cancel">Cancel</a>
            </div>
        </div>

    </div>

</form>
</body>
</html>
