<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashbord.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.AdminDashbord" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard | Service Finder</title>

    <!-- Chart JS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* ================= THEME COLORS ================= */
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

        /* ================= SIDEBAR ================= */
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
            color: var(--light);
            cursor: pointer;
        }

            .menu-item:hover {
                background: var(--primary);
                color: var(--dark);
            }

        /* ================= TOPBAR ================= */
        .topbar {
            margin-left: 240px;
            height: 65px;
            background: #fff;
            border-bottom: 3px solid var(--primary);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 25px;
            position: fixed;
            width: calc(100% - 240px);
            top: 0;
        }

        /* ================= CONTENT ================= */
        .content {
            margin-left: 240px;
            padding: 100px 30px 30px;
        }

        /* ================= STATS ================= */
        .stats {
            display: flex;
            gap: 20px;
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
                margin-bottom: 10px;
            }

        /* ================= CHARTS ================= */
        .charts {
            display: flex;
            gap: 20px;
            margin-top: 25px;
        }

        .chart-box {
            flex: 1;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        /* ================= BOOKINGS ================= */
        .bookings-box {
            margin-top: 25px;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .booking-item {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid var(--secondary);
        }

        .btn-view {
            background: var(--primary);
            color: var(--dark);
            padding: 6px 14px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
        }

            .btn-view:hover {
                background: #e38c1f;
            }
        a {
            text-decoration-line:none;
            color:white;
        }
    </style>
</head>

<body>
    <form runat="server">

        <!-- SIDEBAR -->
        <div class="sidebar">
            <h2>Admin Panel</h2>
 
            <div class="menu-item"><a href="AdminDashbord.aspx">🏠 Dashboard</a></div>
            <div class="menu-item"><a href="User.aspx">👥 Users</a></div>
            <div class="menu-item"><a href="">🛠 Service Providers</a></div>
            <div class="menu-item"><a href="">🧰 Services</a></div>
            <div class="menu-item"><a href="">📅 Bookings</a></div>
            <div class="menu-item"><a href="">📊 Reports</a></div>
            <div class="menu-item"><a href="">⚙ Settings</a></div>
        </div>

        <!-- TOPBAR -->
        <div class="topbar">
            <h3>Service Finder - Admin Dashboard</h3>
        </div>

        <!-- MAIN CONTENT -->
        <div class="content">

            <!-- STATS -->
            <div class="stats">
                <div class="stat-card">
                    <h3>Total Users</h3>
                    <h2>
                        <asp:Label ID="lblUserCount" runat="server"></asp:Label>
                    </h2>
                </div>

                <div class="stat-card">
                    <h3>Service Providers</h3>
                    <h2>
                        <asp:Label ID="lblWorkerCount" runat="server"></asp:Label>
                    </h2>
                </div>

                <div class="stat-card">
                    <h3>Today's Bookings</h3>
                    <h2>
                        <asp:Label ID="lblTodayBookingCount" runat="server"></asp:Label>
                    </h2>
                </div>

                <div class="stat-card">
                    <h3>Total Bookings</h3>
                    <h2>
                        <asp:Label ID="lblTotalBookingCount" runat="server"></asp:Label>
                    </h2>
                </div>
            </div>

            <!-- CHARTS -->
            <div class="charts">
                <div class="chart-box">
                    <h4>Bookings by Service</h4>
                    <canvas id="serviceChart"></canvas>
                </div>

                <div class="chart-box">
                    <h4>Monthly Bookings</h4>
                    <canvas id="bookingChart"></canvas>
                </div>
            </div>

            <!-- RECENT BOOKINGS -->
            <div class="bookings-box">
                <h3>Recent Bookings</h3>

                <div class="booking-item">
                    <span>Rahul | Plumber | Ramesh | 10:30 AM</span>
                    <a href="#" class="btn-view">View</a>
                </div>

                <div class="booking-item">
                    <span>Anita | Electrician | Suresh | 12:00 PM</span>
                    <a href="#" class="btn-view">View</a>
                </div>

                <div class="booking-item">
                    <span>Neha | AC Repair | Mohan | 4:00 PM</span>
                    <a href="#" class="btn-view">View</a>
                </div>
            </div>

        </div>

        <!-- CHART JS CODE -->
        <script>
            new Chart(document.getElementById("serviceChart"), {
                type: "line",
                data: {
                    labels: ["Plumber", "Electrician", "AC Repair", "Cleaning"],
                    datasets: [{
                        label: "Bookings",
                        data: [30, 25, 20, 15],
                        borderColor: "#FDA12B",
                        backgroundColor: "rgba(253,161,43,0.2)",
                        borderWidth: 3,
                        tension: 0.4,
                        pointRadius: 5,
                        fill: true
                    }]
                },
                options: {
                    scales: {
                        y: { beginAtZero: true }
                    }
                }
            });

            new Chart(document.getElementById("bookingChart"), {
                type: "line",
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May"],
                    datasets: [{
                        label: "Total Bookings",
                        data: [120, 150, 180, 140, 200],
                        borderColor: "#182333",
                        backgroundColor: "rgba(24,35,51,0.15)",
                        borderWidth: 3,
                        tension: 0.4,
                        pointRadius: 5,
                        fill: true
                    }]
                },
                options: {
                    scales: {
                        y: { beginAtZero: true }
                    }
                }
            });
        </script>

    </form>
</body>
</html>
