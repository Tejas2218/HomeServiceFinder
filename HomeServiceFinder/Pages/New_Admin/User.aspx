<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="HomeServiceFinder.Pages.New_Admin.User" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin | Users</title>

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
            top: 0;
            left: 0;
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
            top: 0;
        }

        /* Content */
        .content {
            margin-left: 240px;
            padding: 100px 30px 30px;
        }

        /* Cards */
        .stat-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            border-left: 5px solid var(--primary);
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            width: 250px;
            margin-bottom: 25px;
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

        .badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }

        .active {
            background: #d4edda;
            color: #155724;
        }

        .blocked {
            background: #f8d7da;
            color: #721c24;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            margin-right: 5px;
        }

        .btn-view {
            background: var(--primary);
            color: var(--dark);
        }

        .btn-delete {
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
        <div class="menu-item"><a href="AdminUsers.aspx">👥 Users</a></div>
        <div class="menu-item"><a href="ServiceProvider.aspx">🛠 Service Providers</a></div>
        <div class="menu-item"><a href="#">📅 Bookings</a></div>
        <div class="menu-item"><a href="#">📊 Reports</a></div>
        <div class="menu-item"><a href="#">⚙ Settings</a></div>
    </div>

    <!-- Topbar -->
    <div class="topbar">
        <h3>Users Management</h3>
    </div>

    <!-- Content -->
    <div class="content">

        <!-- Stats -->
        <div class="stat-card">
            <h3>Total Users</h3>
            <h2>11</h2>
        </div>

        <!-- Users Table -->
        <div class="table-box">
            <h3>User List</h3>
            <br />

            <table>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>Rahul Patel</td>
                    <td>rahul@gmail.com</td>
                    <td>9876543210</td>
                    <td><span class="badge active">Active</span></td>
                    <td>
                        <a class="btn btn-view">View</a>
                        <a class="btn btn-delete">Delete</a>
                    </td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>Anita Shah</td>
                    <td>anita@gmail.com</td>
                    <td>9123456780</td>
                    <td><span class="badge blocked">Blocked</span></td>
                    <td>
                        <a class="btn btn-view">View</a>
                        <a class="btn btn-delete">Delete</a>
                    </td>
                </tr>
            </table>
        </div>

    </div>

</form>
</body>
</html>
