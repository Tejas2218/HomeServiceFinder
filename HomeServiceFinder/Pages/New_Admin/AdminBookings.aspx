<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminBookings.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.AdminBookings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin | Bookings</title>

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

        /* Header */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        /* Stats */
        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
        }

        .stat-card {
            flex: 1;
            background: #fff;
            padding: 22px;
            border-radius: 12px;
            border-left: 5px solid var(--primary);
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .stat-card h3 {
            color: var(--secondary);
            margin-bottom: 8px;
        }

        /* Table */
        .table-box {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background: var(--dark);
            color: #fff;
        }

        tr:nth-child(even) {
            background: #f2f2f2;
        }

        /* Status badge */
        .badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }

        .pending {
            background: #fff3cd;
            color: #856404;
        }

        .completed {
            background: #d4edda;
            color: #155724;
        }

        .cancelled {
            background: #f8d7da;
            color: #721c24;
        }

        /* Buttons */
        .btn {
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            margin-right: 5px;
        }

        .btn-view {
            background: var(--primary);
            color: var(--dark);
        }

        .btn-update {
            background: #0d6efd;
            color: #fff;
        }

        .btn-cancel {
            background: #dc3545;
            color: #fff;
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
        <div class="menu-item"><a href="AdminBookings.aspx">📅 Bookings</a></div>
        <div class="menu-item"><a href="Reports.aspx">📊 Reports</a></div>
        <div class="menu-item"><a href="Settings.aspx">⚙ Settings</a></div>
    </div>

    <!-- Topbar -->
    <div class="topbar">
        <h3>Bookings</h3>
    </div>

    <!-- Content -->
    <div class="content">

        <!-- Stats -->
        <div class="stats">
            <div class="stat-card">
                <h3>Total Bookings</h3>
                <h2>120</h2>
            </div>

            <div class="stat-card">
                <h3>Today’s Bookings</h3>
                <h2>8</h2>
            </div>

            <div class="stat-card">
                <h3>Pending</h3>
                <h2>25</h2>
            </div>
        </div>

        <!-- Table -->
        <div class="table-box">
            <h3>Booking List</h3>
            <br />

            <table>
                <tr>
                    <th>#</th>
                    <th>User</th>
                    <th>Service</th>
                    <th>Provider</th>
                    <th>Date & Time</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>Rahul Patel</td>
                    <td>Plumber</td>
                    <td>Ramesh</td>
                    <td>18 Dec 2025 | 10:30 AM</td>
                    <td><span class="badge pending">Pending</span></td>
                    <td>
                        <a class="btn btn-view">View</a>
                        <a class="btn btn-update">Update</a>
                        <a class="btn btn-cancel">Cancel</a>
                    </td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>Anita Shah</td>
                    <td>Electrician</td>
                    <td>Suresh</td>
                    <td>17 Dec 2025 | 04:00 PM</td>
                    <td><span class="badge completed">Completed</span></td>
                    <td>
                        <a class="btn btn-view">View</a>
                    </td>
                </tr>

            </table>
        </div>

    </div>

</form>
</body>
</html>
