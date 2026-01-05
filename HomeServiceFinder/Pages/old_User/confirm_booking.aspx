<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm_booking.aspx.cs" Inherits="HomeServiceFinder.Pages.User.service_provider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Booking Confirmed - Apex</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* --- APEX THEME --- */
        :root {
            --apex-orange: #FF4500;
            --apex-dark: #1a1a1a;
            --apex-light: #f8f9fa;
        }

        body {
            background-color: var(--apex-light);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* CARD CONTAINER */
        .success-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
            overflow: hidden;
            text-align: center;
            border-top: 6px solid var(--apex-orange);
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* CHECKMARK ANIMATION */
        .icon-box {
            background: #e6ffed;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 40px auto 20px auto;
            position: relative;
        }
        .icon-box i {
            font-size: 40px;
            color: #28a745;
            z-index: 2;
        }
        /* Pulse Effect */
        .icon-box::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: #28a745;
            opacity: 0.2;
            z-index: 1;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.3; }
            100% { transform: scale(1.5); opacity: 0; }
        }

        /* TEXT STYLES */
        h2 { font-weight: 800; color: var(--apex-dark); margin-bottom: 5px; }
        .sub-text { color: #666; margin-bottom: 30px; }

        /* RECEIPT DETAILS */
        .receipt-box {
            background: #fdfdfd;
            border-top: 1px dashed #ddd;
            border-bottom: 1px dashed #ddd;
            padding: 20px 40px;
            margin-bottom: 30px;
            text-align: left;
        }
        .row-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 0.95rem;
        }
        .row-item span:first-child { color: #888; }
        .row-item span:last-child { font-weight: 600; color: var(--apex-dark); }
        .row-item.total {
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #eee;
            font-size: 1.1rem;
        }
        .row-item.total span:last-child { color: var(--apex-orange); font-weight: 800; }

        /* BUTTONS */
        .btn-home {
            background-color: var(--apex-orange);
            color: white;
            font-weight: 700;
            border-radius: 50px;
            padding: 12px 30px;
            border: none;
            width: 80%;
            margin-bottom: 15px;
            transition: 0.3s;
        }
        .btn-home:hover { background-color: #e03e00; color: white; transform: translateY(-2px); }

        .btn-outline {
            background: transparent;
            color: #777;
            font-weight: 600;
            border: none;
            text-decoration: underline;
        }
        .btn-outline:hover { color: var(--apex-dark); }

    </style>
</head>
<body>
    <form id="form1" runat="server" class="w-100 d-flex justify-content-center">
        
        <div class="success-card">
            
            <div class="icon-box">
                <i class="fa fa-check"></i>
            </div>

            <h2>Booking Confirmed!</h2>
            <p class="sub-text">Your expert is scheduled to arrive.</p>

            <div class="receipt-box">
                <div class="row-item">
                    <span>Booking ID</span>
                    <asp:Label ID="lblBookingID" runat="server" Text="..."></asp:Label>
                </div>
                <div class="row-item">
                    <span>Provider</span>
                    <asp:Label ID="lblProvider" runat="server" Text="..."></asp:Label>
                </div>
                <div class="row-item">
                    <span>Date</span>
                    <asp:Label ID="lblDate" runat="server" Text="..."></asp:Label>
                </div>
                <div class="row-item">
                    <span>Time Slot</span>
                    <asp:Label ID="lblTime" runat="server" Text="..."></asp:Label>
                </div>
                
                <div class="row-item total">
                    <span>Total Amount</span>
                    <asp:Label ID="lblAmount" runat="server" Text="..."></asp:Label>
                </div>
            </div>

            <div class="pb-4">
                <a href="user_dashboard.aspx" class="btn btn-home">Go to Dashboard</a>
                <br />
                <button type="button" class="btn-outline" onclick="window.print()">Download Receipt</button>
            </div>

        </div>

    </form>
</body>
</html>
