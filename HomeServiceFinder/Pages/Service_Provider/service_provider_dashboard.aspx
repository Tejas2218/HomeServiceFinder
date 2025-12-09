<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="service_provider_dashboard.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Provider Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
        }

        .header {
            height: 65px;
            background: #1e88e5;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .title {
            font-size: 22px;
            font-weight: bold;
        }

        /* PROFILE */
        .profile-wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #1565c0;
            padding: 6px 10px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
        }

        .profile-logo {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: white;
            padding: 2px;
        }

        .profile-info {
            color: white;
            text-align: left;
        }

            .profile-info p {
                margin: 0;
                font-size: 12px;
            }

            .profile-info a {
                color: #ffd54f;
                font-size: 11px;
                font-weight: bold;
                text-decoration: none;
            }

        .container {
            padding: 20px;
        }

        .card {
            background: white;
            padding: 15px;
            border-radius: 6px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #1976d2;
            color: white;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .btn {
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }

        .accept {
            background: #2ecc71;
        }

        .reject {
            background: #e74c3c;
        }

        .view {
            background: #f39c12;
        }

        .client-box {
            margin-top: 15px;
            padding: 10px;
            background: #f9f9f9;
            border-left: 4px solid #1e88e5;
        }
    </style>
</head>

<body>
    <form runat="server">

        <!-- HEADER -->
        <div class="header">
            <div class="title">Service Provider Dashboard</div>

            <a href="view_profile.aspx" class="profile-wrapper">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="profile-logo" />
                <div class="profile-info">
                    <p><b>Raj</b></p>
                    <p>Electrician</p>
                    <p>raj@gmail.com</p>
                    <span>View Profile</span>
                </div>
            </a>
        </div>

        <!-- CONTENT -->
        <div class="container">

            <!-- CURRENT BOOKINGS -->
            <div class="card">

                <h3>Booking Requests & History</h3>

                <table>
                    <tr>
                        <th>ID</th>
                        <th>Client</th>
                        <th>Service</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>

                    <tr>
                        <td>201</td>
                        <td>Tejas</td>
                        <td>Plumbing</td>
                        <td>12 Aug 2025</td>
                        <td>Pending</td>
                        <td>
                            <button class="btn accept">Accept</button>
                            <button class="btn reject">Reject</button>
                            <button class="btn view">View</button>
                        </td>
                    </tr>

                    <tr>
                        <td>202</td>
                        <td>Anuj</td>
                        <td>Cleaning</td>
                        <td>15 Aug 2025</td>
                        <td style="color: green"><b>Accepted</b></td>
                        <td>
                            <button class="btn reject">Reject</button>
                            <button class="btn view">View</button>
                        </td>
                    </tr>

                    <tr>
                        <td>203</td>
                        <td>Dev</td>
                        <td>AC Repair</td>
                        <td>18 Aug 2025</td>
                        <td style="color: red"><b>Rejected</b></td>
                        <td>
                            <button class="btn view">View</button>
                        </td>
                    </tr>
                </table>

            </div>

            <!-- BOOKING HISTORY -->
            <div class="card">

                <h3>Booking History</h3>

                <table>
                    <tr>
                        <th>ID</th>
                        <th>Client</th>
                        <th>Service</th>
                        <th>Date</th>
                        <th>Final Status</th>
                        <th>Action</th>
                    </tr>

                    <tr>
                        <td>101</td>
                        <td>Ramesh</td>
                        <td>Electric Work</td>
                        <td>02 Aug 2025</td>
                        <td style="color: green"><b>Accepted</b></td>
                        <td>
                            <button class="btn view">View</button>
                        </td>
                    </tr>

                    <tr>
                        <td>102</td>
                        <td>Harsh</td>
                        <td>Washing Repair</td>
                        <td>04 Aug 2025</td>
                        <td style="color: red"><b>Rejected</b></td>
                        <td>
                            <button class="btn view">View</button>
                        </td>
                    </tr>

                </table>

            </div>

        </div>

    </form>
</body>
</html>
