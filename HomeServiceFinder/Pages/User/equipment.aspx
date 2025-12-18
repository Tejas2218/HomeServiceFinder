<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="equipment.aspx.cs" Inherits="HomeServiceFinder.Pages.User.equipment" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // The specific sub-services for "Home Cleaning"
            var subServices = new System.Collections.Generic.List<object>
            {
                new { Name = "Brooming & Mopping", Price = 199, Icon = "fa-broom", Desc = "Daily floor dusting & wet mop." },
                new { Name = "Washroom Deep Clean", Price = 499, Icon = "fa-sink", Desc = "Tile scrubbing, acid wash & sanitizing." },
                new { Name = "Full House Deep Clean", Price = 2499, Icon = "fa-house-chimney", Desc = "Complete home deep cleaning (Floor+Walls)." },
                new { Name = "Water Tank Wash", Price = 899, Icon = "fa-faucet-drip", Desc = "Underground & overhead sludge removal." },
                new { Name = "Summer Cool (AC/Fan)", Price = 799, Icon = "fa-snowflake", Desc = "AC servicing & fan cleaning special." },
                new { Name = "Equipment Clean", Price = 599, Icon = "fa-blender-phone", Desc = "Fridge, Oven & Washing machine." }
            };
            rptServices.DataSource = subServices;
            rptServices.DataBind();
        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        // Simulate Booking
        string service = hfServiceName.Value;
        string date = txtDate.Text;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('APEX BOOKING SUCCESS!\\nConfirmed: {service}\\nDate: {date}');", true);
    }
</script>

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

            <asp:Repeater ID="rptServices" runat="server">
                <ItemTemplate>
                    <div class="sub-service-card" onclick="openModal('<%# Eval("Name") %>', '<%# Eval("Price") %>')">

                        <div class="icon-box">
                            <i class="fa-solid <%# Eval("Icon") %>"></i>
                        </div>

                        <div class="content-box">
                            <div class="service-name"><%# Eval("Name") %></div>
                            <p class="service-desc"><%# Eval("Desc") %></p>
                        </div>

                        <div class="price-box">
                            <span class="price-text">₹<%# Eval("Price") %></span>
                            <span class="add-btn">Book</span>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="modal fade" id="bookingModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow-lg">

                    <div class="modal-header border-0 pb-0">
                        <h5 class="modal-title fw-bold">Confirm Service</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        <div class="d-flex justify-content-between align-items-center mb-4 p-3 bg-light rounded">
                            <div>
                                <small class="text-muted d-block">Service</small>
                                <strong class="text-dark" id="lblServiceName">...</strong>
                            </div>
                            <div class="text-end">
                                <small class="text-muted d-block">Total</small>
                                <strong style="color: var(--apex-orange); font-size: 1.2rem;" id="lblServicePrice">...</strong>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="fw-bold small text-muted">DATE</label>
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-4">
                            <label class="fw-bold small text-muted">ADDRESS</label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="House/Flat No..." required="true"></asp:TextBox>
                        </div>

                        <asp:HiddenField ID="hfServiceName" runat="server" />

                        <asp:Button ID="btnConfirm" runat="server" Text="Yes, Confirm Booking" CssClass="btn btn-orange-fill rounded-pill" OnClick="btnConfirm_Click" />
                    </div>
                </div>
            </div>
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function openModal(name, price) {
            document.getElementById('lblServiceName').innerText = name;
            document.getElementById('lblServicePrice').innerText = '₹' + price;
            document.getElementById('<%= hfServiceName.ClientID %>').value = name;
            new bootstrap.Modal(document.getElementById('bookingModal')).show();
        }
    </script>
</body>
</html>
