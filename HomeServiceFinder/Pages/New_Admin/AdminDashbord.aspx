<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashbord.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.AdminDashbord" MasterPageFile="~/MasterPage/AdminMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- PAGE TITLE -->
    <h2 style="margin-bottom: 20px;">Dashboard</h2>

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

    <!-- CHART JS -->
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
                    fill: true
                }]
            },
            options: { scales: { y: { beginAtZero: true } } }
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
                    fill: true
                }]
            },
            options: { scales: { y: { beginAtZero: true } } }
        });
    </script>

</asp:Content>
