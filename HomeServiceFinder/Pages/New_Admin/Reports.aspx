<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="HomeServiceFinder.Pages.New_Admin.Reports" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin | Reports</title>

    <!-- Chart JS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

        /* Filters */
        .filters {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            display: flex;
            gap: 15px;
            align-items: center;
            margin-bottom: 25px;
        }

        .filters select, .filters input {
            padding: 8px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-filter {
            background: var(--primary);
            color: var(--dark);
            padding: 9px 18px;
            border-radius: 6px;
            font-weight: 600;
            border: none;
            cursor: pointer;
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

        /* Charts */
        .charts {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
        }

        .chart-box {
            flex: 1;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
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
        <h3>Reports & Analytics</h3>
    </div>

    <!-- Content -->
    <div class="content">

        <!-- Filters -->
        <div class="filters">
            <select>
                <option>All Services</option>
                <option>Plumber</option>
                <option>Electrician</option>
                <option>AC Repair</option>
            </select>

            <input type="date" />
            <input type="date" />

            <button class="btn-filter">Generate Report</button>
        </div>

        <!-- Stats -->
        <div class="stats">
            <div class="stat-card">
                <h3>Total Bookings</h3>
                <h2>256</h2>
            </div>

            <div class="stat-card">
                <h3>Total Revenue</h3>
                <h2>₹78,500</h2>
            </div>

            <div class="stat-card">
                <h3>Completed Services</h3>
                <h2>210</h2>
            </div>
        </div>

        <!-- Charts -->
        <div class="charts">
            <div class="chart-box">
                <h4>Monthly Bookings</h4>
                <canvas id="monthlyChart"></canvas>
            </div>

            <div class="chart-box">
                <h4>Service-wise Distribution</h4>
                <canvas id="serviceChart"></canvas>
            </div>
        </div>

        <!-- Table -->
        <div class="table-box">
            <h3>Detailed Report</h3>
            <br />

            <table>
                <tr>
                    <th>Date</th>
                    <th>Service</th>
                    <th>User</th>
                    <th>Provider</th>
                    <th>Status</th>
                    <th>Amount</th>
                </tr>

                <tr>
                    <td>12-09-2025</td>
                    <td>Plumber</td>
                    <td>Rahul</td>
                    <td>Ramesh</td>
                    <td>Completed</td>
                    <td>₹500</td>
                </tr>

                <tr>
                    <td>13-09-2025</td>
                    <td>Electrician</td>
                    <td>Anita</td>
                    <td>Suresh</td>
                    <td>Completed</td>
                    <td>₹800</td>
                </tr>
            </table>
        </div>

    </div>

    <!-- Charts JS -->
    <script>
        new Chart(document.getElementById("monthlyChart"), {
            type: "line",
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May"],
                datasets: [{
                    label: "Bookings",
                    data: [40, 55, 60, 48, 70],
                    borderColor: "#FDA12B",
                    backgroundColor: "rgba(253,161,43,0.2)",
                    borderWidth: 3,
                    tension: 0.4,
                    fill: true
                }]
            },
            options: { scales: { y: { beginAtZero: true } } }
        });

        new Chart(document.getElementById("serviceChart"), {
            type: "doughnut",
            data: {
                labels: ["Plumber", "Electrician", "AC Repair"],
                datasets: [{
                    data: [45, 30, 25],
                    backgroundColor: ["#FDA12B", "#182333", "#8D9297"]
                }]
            }
        });
    </script>

</form>
</body>
</html>
