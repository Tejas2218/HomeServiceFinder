<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="equipment.aspx.cs" Inherits="HomeServiceFinder.Pages.User.equipment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Equipment</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            font-family: 'Inter',sans-serif;
            background: #F9FAFB;
        }

        .header {
            background: linear-gradient(135deg,#60A5FA,#3B82F6);
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .back-btn {
            background: white;
            color: #2563EB;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            gap: 6px;
            align-items: center;
        }

        .container {
            padding: 50px 70px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            gap: 15px;
        }

        select, input {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #CBD5E1;
        }

        .equipment-box {
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(160px,1fr));
            gap: 20px;
            max-height: 420px;
            overflow-y: auto;
            padding-right: 10px;
        }

        .item {
            background: white;
            border-radius: 14px;
            padding: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,.05);
            text-align: center;
            cursor: pointer;
            border: 2px solid transparent;
            transition: .2s;
        }

            .item:hover {
                transform: scale(1.05);
                border-color: #60A5FA;
            }

            .item.selected {
                background: #EFF6FF;
                border: 2px solid #2563EB;
            }

            .item i {
                font-size: 34px;
                color: #2563EB;
                margin-bottom: 10px;
            }

        .preview {
            margin-top: 20px;
            font-size: 18px;
            font-weight: 700;
            color: #1E3A8A;
        }

        .confirm-btn {
            margin-top: 18px;
            background: linear-gradient(135deg,#3B82F6,#2563EB);
            border: none;
            padding: 14px 18px;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
        }

        @media(max-width:800px) {
            .container {
                padding: 30px
            }

            .top-bar {
                flex-direction: column
            }
        }
    </style>
</head>

<body>
    <form runat="server">

        <div class="header">
            <h2>Choose Equipment</h2>
            <a href="user_dashboard.aspx" class="back-btn">
                <i class="fa fa-arrow-left"></i>Back
            </a>
        </div>

        <div class="container">

            <div class="top-bar">
                <select id="serviceSelect" onchange="loadEquipment()">
                    <option value="Electrical">Electrical</option>
                    <option value="Plumbing">Plumbing</option>
                    <option value="AC">AC Repair</option>
                    <option value="Cleaning">Cleaning</option>
                    <option value="Painting">Painting</option>
                    <option value="Carpentry">Carpentry</option>
                </select>

                <input type="text" id="searchBox" placeholder="Search equipment..." onkeyup="searchEquipment()" />
            </div>

            <div class="equipment-box" id="equipmentBox"></div>

            <div class="preview">
                Selected Equipment: <span id="selectedItem">None</span>
            </div>

            <button type="button" class="confirm-btn" onclick="confirmSelection()">Confirm Selection</button>

        </div>

    </form>

    <script>

        const equipmentData = {
            Electrical: [
                ["Fan", "fa-fan"], ["Light", "fa-lightbulb"], ["Switch", "fa-toggle-on"],
                ["Socket", "fa-plug"], ["MCB", "fa-bolt"], ["Fuse", "fa-fire"],
                ["Wiring", "fa-code-branch"], ["Inverter", "fa-battery-full"], ["Battery", "fa-car-battery"]
            ],
            Plumbing: [
                ["Tap", "fa-faucet"], ["Pipe", "fa-water"], ["Sink", "fa-sink"],
                ["Toilet", "fa-toilet"], ["Tank", "fa-oil-can"], ["Motor", "fa-cogs"]
            ],
            AC: [
                ["AC Unit", "fa-snowflake"], ["Filter", "fa-filter"],
                ["Gas Refill", "fa-wind"], ["Compressor", "fa-industry"]
            ],
            Cleaning: [
                ["Vacuum", "fa-soap"], ["Mop", "fa-broom"], ["Glass Cleaner", "fa-spray-can"]
            ],
            Painting: [
                ["Brush", "fa-paint-brush"], ["Roller", "fa-roller"], ["Spray Gun", "fa-air-freshener"]
            ],
            Carpentry: [
                ["Hammer", "fa-hammer"], ["Drill", "fa-screwdriver"],
                ["Door", "fa-door-closed"], ["Window", "fa-house"]
            ]
        };

        function loadEquipment() {
            const service = serviceSelect.value;
            const box = document.getElementById("equipmentBox");
            box.innerHTML = "";

            equipmentData[service].forEach(eq => {
                const div = document.createElement("div");
                div.className = "item";
                div.setAttribute("data-name", eq[0].toLowerCase());
                div.innerHTML = `<i class="fa ${eq[1]}"></i><div>${eq[0]}</div>`;

                div.onclick = function () {
                    document.querySelectorAll('.item').forEach(i => i.classList.remove("selected"));
                    div.classList.add("selected");
                    selectedItem.innerText = eq[0];
                };

                box.appendChild(div);
            });
        }

        function searchEquipment() {
            const q = searchBox.value.toLowerCase();
            document.querySelectorAll('.item').forEach(e => {
                e.style.display = e.dataset.name.includes(q) ? "block" : "none";
            });
        }

        function confirmSelection() {
            const item = document.getElementById("selectedItem").innerText;
            if (item === "None") {
                alert("Please select equipment first.");
            } else {
                alert("You selected: " + item);
                // Redirect / store in session if required
            }
        }

        loadEquipment();

    </script>

</body>
</html>
