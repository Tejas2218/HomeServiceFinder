<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="HomeServiceFinder.Pages.New_Admin.UserProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin | Settings</title>

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

        /* Section Box */
        .settings-box {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .settings-box h3 {
            margin-bottom: 15px;
            border-left: 4px solid var(--primary);
            padding-left: 10px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
        }

        input[type=text],
        input[type=password],
        input[type=email] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-save {
            margin-top: 20px;
            background: var(--primary);
            color: var(--dark);
            padding: 10px 22px;
            border-radius: 6px;
            border: none;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-save:hover {
            background: #e38c1f;
        }

        .toggle {
            margin-top: 10px;
        }
    </style>
</head>

<body>
<form runat="server">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>

        <div class="menu-item"><a href="AdminDashbord.aspx">🏠 Dashboard</a></div>
        <div class="menu-item"><a href="User.aspx">👥 Users</a></div>
        <div class="menu-item"><a href="ServiceProvider.aspx">🛠 Service Providers</a></div>
        <div class="menu-item"><a href="Booking.aspx">📅 Bookings</a></div>
        <div class="menu-item"><a href="Report.aspx">📊 Reports</a></div>
        <div class="menu-item"><a href="Settings.aspx">⚙ Settings</a></div>
    </div>

    <!-- Topbar -->
    <div class="topbar">
        <h3>Settings</h3>
    </div>

    <!-- Content -->
    <div class="content">

        <!-- Profile Settings -->
        <div class="settings-box">
            <h3>User Profile</h3>

            <label>Name</label>
            <input type="text" placeholder="Admin Name" />

            <label>Email</label>
            <input type="email" placeholder="admin@email.com" />

            <button class="btn-save">Save Changes</button>
        </div>

        <!-- Password Settings -->
        <div class="settings-box">
            <h3>Change Password</h3>

            <label>Current Password</label>
            <input type="password" />

            <label>New Password</label>
            <input type="password" />

            <label>Confirm New Password</label>
            <input type="password" />

            <button class="btn-save">Update Password</button>
        </div>

        <!-- System Settings -->
        <div class="settings-box">
            <h3>System Settings</h3>

            <div class="toggle">
                <input type="checkbox" checked /> Enable Email Notifications
            </div>

            <div class="toggle">
                <input type="checkbox" /> Maintenance Mode
            </div>

            <button class="btn-save">Save Settings</button>
        </div>

    </div>

</form>
</body>
</html>
