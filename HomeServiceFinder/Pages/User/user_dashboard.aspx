<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_dashboard.aspx.cs" Inherits="HomeServiceFinder.Pages.User.user_dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>HomeServiceFinder - User Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Inter',sans-serif;
            background: #F9FAFB;0
            color: #1F2937;
        }

        /* NAVBAR */
        .header {
            background: linear-gradient(135deg,#60A5FA,#3B82F6);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 50px;
            box-shadow: 0 4px 12px rgba(0,0,0,.1);
        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 10px;
            color: white;
        }

            .logo img {
                height: 42px
            }

        .nav-menu {
            display: flex;
            gap: 25px;
        }

            .nav-menu a {
                color: white;
                font-weight: 600;
                transition: .2s;
            }

                .nav-menu a:hover {
                    color: #FACC15;
                }

        /* PROFILE */
        .profile {
            display: flex;
            gap: 12px;
            align-items: center;
        }

            .profile img {
                width: 44px;
                height: 44px;
                border-radius: 50%;
                border: 3px solid white;
            }

        /* HERO */
        .hero {
    height: 320px;             
    width: 100%;              
    background: linear-gradient(
                    rgba(96,165,250,0.3), 
                    rgba(59,130,246,0.3)    
                ), 
                url("https://images.unsplash.com/photo-1676311396794-f14881e9daaa?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aG9tZSUyMG1haW50ZW5hbmNlfGVufDB8fDB8fHww") center center / cover no-repeat;
    display: flex;
    align-items: center;
    padding-left: 80px;
    color: #fafafa;
}



            .hero h1 {
                font-size: 42px;
            }

            .hero p {
                font-size: 18px;
                color: #fafafa;
            }

        /* DASHBOARD */
        .dashboard {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 35px;
            padding: 60px 80px;
        }

        /* CARD */
        .card {
            background: #FFFFFF;
            border-radius: 16px;
            padding: 28px;
            box-shadow: 0 8px 20px rgba(0,0,0,.05);
            border-top: 4px solid #60A5FA;
            margin-bottom: 30px;
        }

        /* BUTTONS */
        .view-btn {
            margin-top: 15px;
            background: #3B82F6;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: .2s;
        }

            .view-btn:hover {
                background: #2563EB;
            }

        /* SERVICES */
        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(175px,1fr));
            gap: 20px;
        }

        .service-card {
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0,0,0,.06);
            transition: .2s;
            cursor: pointer;
            background: white;
        }

            .service-card:hover {
                transform: translateY(-6px)
            }

            .service-card img {
                height: 130px;
                width: 100%;
                object-fit: cover;
            }

        .service-title {
            text-align: center;
            font-weight: 700;
            padding: 12px;
            background: #EFF6FF;
            color: #1E3A8A;
        }

        /* TABLE */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #3B82F6;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #E5E7EB;
        }

        /* PROVIDERS */
        .provider {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
            font-weight: 600;
        }

            .provider img {
                width: 52px;
                height: 52px;
                border-radius: 50%;
            }

        .book-btn {
            margin-left: auto;
            background: #3B82F6;
            color: white;
            padding: 7px 14px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: .2s;
        }

            .book-btn:hover {
                background: #2563EB;
            }

        /* FOOTER */
        footer {
            background: #E0F2FE;
            color: #1E3A8A;
            text-align: center;
            padding: 16px;
            font-size: 14px;
        }

        /* MOBILE */
        @media(max-width:900px) {
            .dashboard {
                grid-template-columns: 1fr;
                padding: 30px
            }

            .hero {
                padding-left: 25px
            }

            .nav-menu {
                display: none
            }
        }
    </style>
</head>

<body>
    <form runat="server">

        <!-- NAVBAR -->
        <div class="header">
            <div class="logo">
                <img src="https://cdn-icons-png.flaticon.com/512/2933/2933829.png" />
                HomeServiceFinder
            </div>

            <div class="nav-menu">
                <a href="#">Home</a>
                <a href="#">Services</a>
                <a href="#">Bookings</a>
                <a href="#">Professionals</a>
                <a href="#">Contact</a>
            </div>

            <div class="profile">
                <span>Welcome User</span>
                <img src="https://i.pravatar.cc/100" />
            </div>
        </div>

        <!-- HERO -->
        <div class="hero">
            <div>
                <h1>Trusted Home Services at Your Doorstep</h1>
                <p>Book verified experts instantly</p>
            </div>
        </div>

        <!-- DASHBOARD -->
        <div class="dashboard">

            <!-- LEFT -->
            <div>

                <div class="card">
                    <h2>Available Services</h2>
                    <div class="services">
                        <div class="service-card">
                            <img src="https://images.unsplash.com/photo-1676210134188-4c05dd172f89?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGx1bWJpbmd8ZW58MHx8MHx8fDA%3D" />
                            <div class="service-title">Plumbing</div>
                        </div>
                        <div class="service-card">
                            <img src="https://images.unsplash.com/photo-1635335874521-7987db781153?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZWxlY3RyaWNhbHxlbnwwfHwwfHx8MA%3D%3D" />
                            <div class="service-title">Electrical</div>
                        </div>
                        <div class="service-card">
                            <img src="https://media.istockphoto.com/id/2211719481/photo/technician-with-screwdriver-repairing-air-conditioner-at-home.webp?a=1&b=1&s=612x612&w=0&k=20&c=jgXsFwah9TmgEV1m6MXRy3_BqpA0V6zJ5q4AkWw4vM4=" />
                            <div class="service-title">AC Repair</div>
                        </div>
                        <div class="service-card">
                            <img src="https://plus.unsplash.com/premium_photo-1663011218145-c1d0c3ba3542?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2xlYW5pbmd8ZW58MHx8MHx8fDA%3D" />
                            <div class="service-title">Cleaning</div>
                        </div>
                        <div class="service-card">
                            <img src="https://plus.unsplash.com/premium_photo-1683121602687-60c47b2222f0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fFBhaW50ZXIlMjB3b3JrZXJ8ZW58MHx8MHx8fDA%3D" />
                            <div class="service-title">Painting</div>
                        </div>
                        <div class="service-card">
                            <img src="https://images.unsplash.com/photo-1645651964715-d200ce0939cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FycGVudHJ5fGVufDB8fDB8fHww" />
                            <div class="service-title">Carpentry</div>
                        </div>
                    </div>
                    <button class="view-btn">View More Services ➜</button>
                </div>

                <div class="card">
                    <h2>Booking History</h2>
                    <table>
                        <tr>
                            <th>Service</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                        <tr>
                            <td>Plumbing</td>
                            <td>12 Mar 2025</td>
                            <td>Completed</td>
                        </tr>
                        <tr>
                            <td>AC Repair</td>
                            <td>20 Mar 2025</td>
                            <td>Pending</td>
                        </tr>
                    </table>
                    <button class="view-btn">View More Bookings ➜</button>
                </div>

            </div>

            <!-- RIGHT -->
            <div>

                <div class="card">
                    <h2>Top Professionals</h2>
                    <div class="provider">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" />
                        Raj Kumar
                        <button class="book-btn">Book</button>
                    </div>
                    <div class="provider">
                        <img src="https://randomuser.me/api/portraits/men/44.jpg" />
                        Amit Singh
                        <button class="book-btn">Book</button>
                    </div>
                    <div class="provider">
                        <img src="https://randomuser.me/api/portraits/men/55.jpg" />
                        Rahul Verma
                        <button class="book-btn">Book</button>
                    </div>
                    <button class="view-btn">View More Professionals ➜</button>
                </div>

                <div class="card">
                    <h2>Contact Support</h2>
                    📞 +91 98765 43210<br />
                    📧 support@homeservicefinder.com<br>
                    <button class="view-btn">View Contact Info ➜</button>
                </div>

            </div>

        </div>

        <footer>
            © 2025 HomeServiceFinder | Professional Home Services Platform
        </footer>

    </form>
</body>
</html>
