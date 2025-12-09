<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_booking.aspx.cs" Inherits="HomeServiceFinder.Pages.User.user_booking" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Book a Service - HomeServiceFinder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;500;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: #F9FAFB;
            font-family: 'Inter',sans-serif;
            color: #1F2937;
        }

        /* HEADER */
        .header {
            background: linear-gradient(135deg,#60A5FA,#3B82F6);
            padding: 18px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 22px;
            font-weight: 700;
        }

            .logo img {
                height: 40px;
            }

        .back-btn {
            background: white;
            color: #2563EB;
            font-weight: 600;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
        }

        /* HERO */
        .hero {
            background: linear-gradient(rgba(96,165,250,.3),rgba(59,130,246,.3)), url("https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=1600&q=80") center/cover;
            height: 280px;
            display: flex;
            align-items: center;
            padding-left: 60px;
            color: white;
        }

            .hero h1 {
                font-size: 38px;
                margin: 0;
            }

            .hero p {
                font-size: 16px
            }

        /* LAYOUT */
        .wrapper {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
            padding: 50px 70px;
        }

        /* CARD */
        .card {
            background: #fff;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 8px 18px rgba(0,0,0,.05);
            margin-bottom: 25px;
        }

            .card h2 {
                color: #1E3A8A;
                margin-bottom: 15px;
            }

        /* INPUTS */
        label {
            display: block;
            font-weight: 600;
            margin-top: 15px
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #D1D5DB;
            outline: none;
        }

        /* PROVIDERS */
        .provider {
            display: flex;
            gap: 12px;
            align-items: center;
            padding: 10px;
            border-radius: 10px;
            transition: .2s;
        }

            .provider:hover {
                background: #EFF6FF;
            }

            .provider img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
            }

        .book-btn {
            margin-left: auto;
            background: #3B82F6;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
        }

        /* SUMMARY */
        .summary p {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }

        .total {
            font-size: 20px;
            font-weight: 700;
            color: #1E3A8A;
        }

        /* BUTTON */
        .confirm-btn {
            background: linear-gradient(135deg,#3B82F6,#2563EB);
            color: white;
            padding: 12px;
            border: none;
            width: 100%;
            margin-top: 15px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
        }

        /* MOBILE */
        @media(max-width:900px) {
            .wrapper {
                grid-template-columns: 1fr;
                padding: 30px;
            }
        }
    </style>
</head>

<body>
    <form runat="server">

        <!-- NAV -->
        <div class="header">
            <div class="logo">
                <img src="https://cdn-icons-png.flaticon.com/512/2933/2933829.png">
                HomeServiceFinder
            </div>
            <a class="back-btn" href="user_dashboard.aspx">← Back</a>
        </div>

        <!-- HERO -->
        <div class="hero">
            <div>
                <h1>Book a Professional</h1>
                <p>Quick booking with verified experts</p>
            </div>
        </div>

        <!-- MAIN -->
        <div class="wrapper">

            <!-- LEFT -->
            <div>

                <div class="card">
                    <h2>Select Service</h2>

                    <label>Service Type</label>
                    <select>
                        <option>Plumbing</option>
                        <option>Electrical</option>
                        <option>AC Repair</option>
                        <option>Cleaning</option>
                        <option>Painting</option>
                    </select>

                    <label>Preferred Date</label>
                    <input type="date" />

                    <label>Preferred Time</label>
                    <input type="time" />

                    <label>Service Address</label>
                    <textarea rows="3"></textarea>

                </div>

                <div class="card">
                    <h2>Select Professional</h2>

                    <div class="provider">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg">
                        Raj Kumar
    <button class="book-btn" type="button">Select</button>
                    </div>

                    <div class="provider">
                        <img src="https://randomuser.me/api/portraits/men/44.jpg">
                        Amit Singh
    <button class="book-btn" type="button">Select</button>
                    </div>

                    <div class="provider">
                        <img src="https://randomuser.me/api/portraits/men/55.jpg">
                        Rahul Verma
    <button class="book-btn" type="button">Select</button>
                    </div>

                </div>

            </div>

            <!-- RIGHT -->
            <div>

                <div class="card summary">
                    <h2>Booking Summary</h2>

                    <p><span>Service</span> <span>Plumbing</span></p>
                    <p><span>Date</span> <span>25 March 2025</span></p>
                    <p><span>Time</span> <span>11:00 AM</span></p>
                    <p><span>Professional</span> <span>Raj Kumar</span></p>

                    <hr>

                    <p class="total"><span>Total</span> <span>₹499</span></p>

                    <button class="confirm-btn">Confirm Booking</button>

                </div>

            </div>

        </div>

    </form>
</body>
</html>
