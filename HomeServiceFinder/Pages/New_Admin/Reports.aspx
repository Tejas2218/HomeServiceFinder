<%@ Page Language="C#" 
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="HomeServiceFinder.Pages.New_Admin.Reports" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">

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

            <table class="admin-table">
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
</asp:Content>

