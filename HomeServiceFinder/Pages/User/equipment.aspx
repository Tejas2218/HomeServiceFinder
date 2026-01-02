<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="equipment.aspx.cs" Inherits="HomeServiceFinder.Pages.User.equipment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cleaning Sub-Services</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* --- APEX ORANGE THEME --- */
        :root {
            --apex-orange: #FF4500; /* The "Apex" Orange */
            --apex-dark: #121212; /* Dark background for contrast */
            --apex-grey: #f4f4f4;
        }

        body {
            background-color: var(--apex-grey);
            font-family: 'Segoe UI', sans-serif;
        }

        /* HEADER: Navigation Bar Style */
        .nav-header {
            background-color: white;
            padding: 15px 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .back-btn {
            color: var(--apex-dark);
            font-size: 1.2rem;
            text-decoration: none;
            margin-right: 15px;
            transition: 0.2s;
        }

            .back-btn:hover {
                color: var(--apex-orange);
            }

        .page-title {
            font-weight: 800;
            font-size: 1.25rem;
            margin: 0;
            color: var(--apex-dark);
        }

        /* LIST CARD DESIGN (Horizontal for sub-services) */
        .sub-service-card {
            background: white;
            border-radius: 12px;
            border-left: 5px solid transparent;
            padding: 20px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.03);
            transition: all 0.2s ease-in-out;
            cursor: pointer;
        }

            .sub-service-card:hover {
                transform: translateX(5px);
                border-left: 5px solid var(--apex-orange);
                box-shadow: 0 5px 15px rgba(255, 69, 0, 0.15);
            }

        /* ICON BOX */
        .icon-box {
            width: 50px;
            height: 50px;
            background-color: #FFF0E6; /* Light Orange */
            color: var(--apex-orange);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-right: 20px;
            flex-shrink: 0;
        }

        /* TEXT CONTENT */
        .content-box {
            flex-grow: 1;
        }

        .service-name {
            font-weight: 700;
            color: var(--apex-dark);
            margin-bottom: 2px;
        }

        .service-desc {
            font-size: 0.85rem;
            color: #888;
            margin: 0;
        }

        /* PRICE & ACTION */
        .price-box {
            text-align: right;
            min-width: 80px;
        }

        .price-text {
            display: block;
            font-weight: 800;
            color: var(--apex-orange);
            font-size: 1.1rem;
        }

        .add-btn {
            font-size: 0.8rem;
            color: #888;
            text-decoration: underline;
        }

        /* MODAL (POPUP) STYLING */
        .btn-orange-fill {
            background-color: var(--apex-orange);
            color: white;
            font-weight: 700;
            border: none;
            padding: 12px;
            width: 100%;
        }

            .btn-orange-fill:hover {
                background-color: #e03e00;
                color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="nav-header">
            <a href="#" class="back-btn"><i class="fa-solid fa-arrow-left"></i></a>
            <h1 class="page-title">Home Cleaning</h1>
        </div>

        <div class="container py-4">
            <p class="text-muted small mb-3 text-uppercase fw-bold ls-1">Select a Service Type</p>

            <asp:Repeater ID="rptEquipment" runat="server">
                <ItemTemplate>
                    <a href='service_provider.aspx?eqid=<%# Eval("Equipment_ID") %>&sid=<%# Request.QueryString["sid"] %>'
                        class="text-decoration-none text-dark">

                        <div class="sub-service-card">


                            <div class="content-box">
                                <div class="service-name"><%# Eval("Equipment_Name") %></div>
                            </div>

                            <div class="price-box">
                                <span class="add-btn">Select</span>
                            </div>

                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

        </div>

        

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   
</body>
</html>
