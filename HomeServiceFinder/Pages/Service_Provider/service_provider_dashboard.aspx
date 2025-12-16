<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="service_provider_dashboard.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Service Provider - Worker Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
        }

        .header {
            height: 70px;
            background: #1565c0;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
        }

        .profile-wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #0d47a1;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
        }

        .profile-logo {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: white;
            padding: 2px;
        }

        .container {
            padding: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 25px;
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

        .grid th {
            background: #1976d2;
            color: white;
            padding: 8px;
            text-align: center;
        }

        .grid td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <!-- HEADER -->
        <div class="header">
            <div class="title">Home Service Provider - Worker Dashboard</div>

            <a href="ViewProfile.aspx" class="profile-wrapper">
                <asp:Image ID="imgProfile" runat="server"
                    ImageUrl="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                    CssClass="profile-logo" />

                <div>
                    <asp:Label ID="lblWorkerName" runat="server" Text="Worker Name" Style="display: block; font-weight: bold;"></asp:Label>
                    <asp:Label ID="lblWorkerCategory" runat="server" Text="Category"></asp:Label><br />
                    <asp:Label ID="lblWorkerEmail" runat="server" Text="email@example.com"></asp:Label><br />
                    <span style="color: #ffeb3b; font-size: 12px;">View Profile</span>
                </div>
            </a>
        </div>

        <!-- CONTENT -->
        <div class="container">

            <!-- Booking Requests -->
            <div class="card">
                <h3>Booking Request</h3>



            </div>


            <!-- Booking History -->
            <div class="card">
                <h3>Booking History</h3>



            </div>

        </div>

    </form>
</body>
</html>
