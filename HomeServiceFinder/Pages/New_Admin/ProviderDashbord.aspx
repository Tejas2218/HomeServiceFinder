<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_Provider.aspx.cs" Inherits="Appointement_Booking.Dashboard_Provider" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Provider Dashboard</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>

        body {
            margin: 0;
            background: #f6f7fb;
            font-family: 'Segoe UI', sans-serif;
        }

        /* -----------------------------
           SIDEBAR
        --------------------------------*/
        .sidebar {
            width: 230px;
            background: #ffffff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0 6px rgba(0,0,0,0.1);
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
            font-weight: 700;
            color: #4a4a4a;
        }

        .menu-item {
            padding: 15px 25px;
            font-size: 15px;
            color: #333;
            cursor: pointer;
        }

        .menu-item:hover {
            background: #f1f1f1;
        }

        /*
           TOP NAVBAR
      */
        .topbar {
            margin-left: 230px;
            height: 65px;
            background: #ffffff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 25px;
            position: fixed;
            width: calc(100% - 230px);
            top: 0;
        }

        .top-right {
            display: flex;
            gap: 20px;
            align-items: center;
            font-size: 14px;
        }

        .profile-pic {
            height: 32px;
            width: 32px;
            border-radius: 50%;
            background: #ddd;
        }

        /* -----------------------------
           MAIN CONTENT
        --------------------------------*/
        .content {
            margin-left: 230px;
            padding: 100px 30px 30px 30px;
        }

        .stats {
            display: flex;
            gap: 20px;
        }

        .stat-card {
            flex: 1;
            background: #fff;
            padding: 22px;
            border-radius: 12px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.06);
            position: relative;
        }

        .stat-icon {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 26px;
        }

        .charts {
            display: flex;
            margin-top: 25px;
            gap: 20px;
        }

        .chart-box {
            flex: 1;
            padding: 20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.06);
        }

        /* Appointment list */
        .appointments-box {
            margin-top: 25px;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.06);
        }

        .appointment-item {
            padding: 12px 0;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
        }

        .appointment-item:last-child {
            border: none;
        }

        .btn-view {
            background: #007bff;
            padding: 6px 12px;
            border-radius: 5px;
            color: #fff;
            font-size: 14px;
            text-decoration: none;
        }

    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <h2>Provider</h2>
        <div class="menu-item">🏠 Dashboard</div>
        <div class="menu-item">📅 Appointments</div>
        <div class="menu-item">🕒 Time Slots</div>
        <div class="menu-item">🛎 Services</div>
        <div class="menu-item">👤 Profile</div>
        <div class="menu-item">⚙ Settings</div>
    </div>

    <!-- TOP BAR -->
    <div class="topbar">
        <h3>Dashboard</h3>

        <div class="top-right">
            <span>🔔</span>
            <span>💬</span>
            <div class="profile-pic"></div>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="content">

        <!-- 3 TOP CARDS -->
        <div class="stats">

            <div class="stat-card">
                <div class="stat-icon">📅</div>
                <h3>Today's Appointments</h3>
                <h2>8</h2>
                <p>2 in progress</p>
            </div>

            <div class="stat-card">
                <div class="stat-icon">⏰</div>
                <h3>Upcoming</h3>
                <h2>15</h2>
                <p>Next 7 days</p>
            </div>

            <div class="stat-card">
                <div class="stat-icon">✅</div>
                <h3>Completed</h3>
                <h2>142</h2>
                <p>This Month</p>
            </div>
        </div>

        <!-- CHARTS -->
        <div class="charts">

            <div class="chart-box">
                <h4>Weekly Appointments</h4>
                <canvas id="weeklyChart"></canvas>
            </div>

            <div class="chart-box">
                <h4>Monthly Revenue</h4>
                <canvas id="revenueChart"></canvas>
            </div>

        </div>

        <!-- APPOINTMENTS LIST -->
        <div class="appointments-box">
            <h3>Today's Upcoming Appointments</h3>

            <div class="appointment-item">
                <span>Sara — Hair Cut — 10:00 AM</span>
                <a href="#" class="btn-view">View</a>
            </div>

            <div class="appointment-item">
                <span>Michael — Massage — 11:30 AM</span>
                <a href="#" class="btn-view">View</a>
            </div>

            <div class="appointment-item">
                <span>James — Consultation — 2:00 PM</span>
                <a href="#" class="btn-view">View</a>
            </div>
        </div>

    </div>

    <!-- CHART JS -->
    <script>
        new Chart(document.getElementById("weeklyChart"), {
            type: "line",
            data: {
                labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                datasets: [{
                    label: "Appointments",
                    data: [5, 8, 7, 9, 6, 10, 4],
                    borderColor: "#4A7CF5",
                    borderWidth: 3,
                    tension: 0.4,   
                    pointRadius: 4,
                    fill: false
                }]
            }
        });

        new Chart(document.getElementById("revenueChart"), {
            type: "bar",
            data: {
                labels: ["Jul", "Aug", "Sep", "Oct", "Nov"],
                datasets: [{
                    label: "Revenue",
                    data: [1500, 2500, 1700, 3000, 3200],
                    backgroundColor: "rgba(120, 90, 250, 0.8)"
                }]
            }
        });
    </script>
</form>
</body>
</html>
