<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_booking.aspx.cs" Inherits="HomeServiceFinder.Pages.User.user_booking" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Select Professional</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap">

    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #F1F5F9;
        }

        .container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .box {
            background: white;
            width: 460px;
            height: 92vh;
            border-radius: 18px;
            box-shadow: 0 8px 20px rgba(59,130,246,.15);
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #2563EB;
        }

        select {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #CBD5E1;
            margin-bottom: 10px;
        }

        .selected {
            text-align: center;
            background: #EFF6FF;
            padding: 8px;
            border-radius: 8px;
            font-weight: 600;
            color: #1E3A8A;
        }

        .list {
            overflow-y: auto;
            flex: 1;
            margin-top: 8px;
            padding-right: 5px;
        }

            /* Scrollbar */
            .list::-webkit-scrollbar {
                width: 6px;
            }

            .list::-webkit-scrollbar-thumb {
                background: #93C5FD;
                border-radius: 10px;
            }

        .pro {
            background: #EFF6FF;
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px;
            border-radius: 12px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: .2s;
        }

            .pro:hover {
                background: #DBEAFE;
            }

            /* SELECTED HIGHLIGHT */
            .pro.active {
                border: 2px solid #2563EB;
                background: #BFDBFE;
            }

            .pro img {
                width: 48px;
                height: 48px;
                border-radius: 50%;
            }

        .pro-info {
            flex: 1;
            font-size: 13px;
        }

        .select-btn {
            background: #3B82F6;
            border: none;
            color: white;
            padding: 6px 12px;
            border-radius: 8px;
            font-size: 12px;
        }

        .confirm {
            margin-top: 10px;
            width: 100%;
            background: linear-gradient(135deg,#3B82F6,#2563EB);
            padding: 12px;
            border-radius: 12px;
            border: none;
            color: white;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <form runat="server">

        <div class="container">
            <div class="box">

                <h2>Select Professional</h2>

                <select id="filter" onchange="filterPros()">
                    <option value="all">All Professionals</option>
                    <option value="Plumber">Plumber</option>
                    <option value="Electrician">Electrician</option>
                    <option value="Cleaner">Cleaner</option>
                    <option value="Painter">Painter</option>
                    <option value="AC">AC Technician</option>
                </select>

                <div class="selected">
                    Selected Professional: <span id="selectedName">None</span>
                </div>

                <div class="list" id="list">

                    <div class="pro" data-type="Plumber" onclick="selectPro(this,'Raj Kumar')">
                        <img src="https://randomuser.me/api/portraits/men/1.jpg">
                        <div class="pro-info">Raj Kumar<br>
                            Plumber • ⭐4.8</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                    <div class="pro" data-type="Electrician" onclick="selectPro(this,'Aman Verma')">
                        <img src="https://randomuser.me/api/portraits/men/2.jpg">
                        <div class="pro-info">Aman Verma<br>
                            Electrician • ⭐4.7</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                    <div class="pro" data-type="Cleaner" onclick="selectPro(this,'Neha Patel')">
                        <img src="https://randomuser.me/api/portraits/women/3.jpg">
                        <div class="pro-info">Neha Patel<br>
                            Cleaner • ⭐4.6</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                    <div class="pro" data-type="AC" onclick="selectPro(this,'Rahul Singh')">
                        <img src="https://randomuser.me/api/portraits/men/4.jpg">
                        <div class="pro-info">Rahul Singh<br>
                            AC Tech • ⭐4.9</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                    <div class="pro" data-type="Painter" onclick="selectPro(this,'Mohit Sharma')">
                        <img src="https://randomuser.me/api/portraits/men/5.jpg">
                        <div class="pro-info">Mohit Sharma<br>
                            Painter • ⭐4.5</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                    <div class="pro" data-type="Plumber" onclick="selectPro(this,'Deepak Joshi')">
                        <img src="https://randomuser.me/api/portraits/men/6.jpg">
                        <div class="pro-info">Deepak Joshi<br>
                            Plumber • ⭐4.8</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                    <div class="pro" data-type="Electrician" onclick="selectPro(this,'Arjun Yadav')">
                        <img src="https://randomuser.me/api/portraits/men/8.jpg">
                        <div class="pro-info">Arjun Yadav<br>
                            Electrician • ⭐4.6</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                    <div class="pro" data-type="Cleaner" onclick="selectPro(this,'Anjali Gupta')">
                        <img src="https://randomuser.me/api/portraits/women/13.jpg">
                        <div class="pro-info">Anjali Gupta<br>
                            Cleaner • ⭐4.6</div>
                        <button class="select-btn" type="button">Select</button>
                    </div>

                </div>

                <button class="confirm">Confirm Selection</button>

            </div>
        </div>

    </form>

    <script>
        function selectPro(card, name) {

            document.querySelectorAll('.pro').forEach(p => p.classList.remove('active'));
            card.classList.add('active');

            document.getElementById("selectedName").innerText = name;
        }

        function filterPros() {
            var type = document.getElementById("filter").value;
            var pros = document.querySelectorAll(".pro");

            pros.forEach(p => {
                if (type == "all" || p.getAttribute("data-type") == type) {
                    p.style.display = "flex";
                } else {
                    p.style.display = "none";
                }
            });
        }
    </script>

</body>
</html>
