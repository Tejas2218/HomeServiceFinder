<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="service_provider.aspx.cs" Inherits="HomeServiceFinder.Pages.User.service_provider1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Select Provider - Apex</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* --- APEX THEME (Orange & Black) --- */
        :root {
            --apex-orange: #FF4500;
            --apex-dark: #1a1a1a;
            --apex-light: #f8f9fa;
        }

        body {
            background-color: var(--apex-light);
            font-family: 'Segoe UI', sans-serif;
        }

        /* HEADER */
        .page-header {
            background: linear-gradient(135deg, var(--apex-dark) 0%, #333 100%);
            padding: 60px 0;
            color: white;
            text-align: center;
            border-bottom: 5px solid var(--apex-orange);
            margin-bottom: 40px;
        }

        /* CARD STYLE */
        .provider-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            border-left: 5px solid transparent;
            cursor: pointer;
        }

            .provider-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                border-left: 5px solid var(--apex-orange);
            }

        .p-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--apex-light);
            margin-right: 20px;
        }

        .p-details h5 {
            font-weight: 700;
            margin: 0;
            color: var(--apex-dark);
        }

        .p-details small {
            color: #777;
            font-weight: 500;
        }

        .p-rating {
            color: #ffc107;
            font-size: 0.9rem;
            margin-top: 5px;
        }

        .btn-select {
            margin-left: auto;
            border: 2px solid var(--apex-orange);
            color: var(--apex-orange);
            background: transparent;
            border-radius: 50px;
            padding: 5px 20px;
            font-weight: 600;
            transition: 0.3s;
        }

            .btn-select:hover {
                background: var(--apex-orange);
                color: white;
            }

        /* --- MODAL (POPUP) --- */
        .modal-header {
            background: var(--apex-dark);
            color: white;
        }

        .modal-title {
            color: var(--apex-orange);
            font-weight: bold;
        }

        /* Modal Left Side */
        .modal-profile-box {
            background-color: #f1f1f1;
            padding: 30px 20px;
            text-align: center;
            height: 100%;
            border-right: 1px solid #ddd;
        }

        .modal-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--apex-orange);
            margin-bottom: 15px;
        }

        /* Time Slots */
        .time-slot-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            margin-top: 10px;
        }

        .time-slot {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: 0.2s;
        }

            .time-slot:hover {
                border-color: var(--apex-orange);
                color: var(--apex-orange);
            }

            .time-slot.active {
                background-color: var(--apex-orange);
                color: white;
                border-color: var(--apex-orange);
            }

        .btn-confirm {
            background-color: var(--apex-dark);
            color: white;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            margin-top: 20px;
        }

            .btn-confirm:hover {
                background-color: var(--apex-orange);
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="page-header">
            <h1 class="display-5 fw-bold">Select Expert Provider</h1>
            <p class="opacity-75">Choose the best professional for your service</p>
        </div>

        <div class="container pb-5">
            <div class="row g-4">
                <asp:Repeater ID="rptProviders" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-6">
                            <div class="provider-card"
                                onclick="openModal(
                '<%# ((System.Data.DataRowView)Container.DataItem)["User_Name"] %>',
                '<%# ((System.Data.DataRowView)Container.DataItem)["Service_Name"] %>',
                '<%# ((System.Data.DataRowView)Container.DataItem)["SP_AverageRating"] %>',
                                '<%# ((System.Data.DataRowView)Container.DataItem)["SP_ID"] %>',
                                '<%# ((System.Data.DataRowView)Container.DataItem)["Equipment_ID"] %>',
                                '<%# ((System.Data.DataRowView)Container.DataItem)["SP_MinimumPrice"] %>',
                                'data:image/jpeg;base64,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')">

                                <img src='data:image/jpeg;base64,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'
                                    class="p-img" onerror="this.src='https://via.placeholder.com/80';" />

                                <div class="p-details">
                                    <h5><%# ((System.Data.DataRowView)Container.DataItem)["User_Name"] %></h5>
                                    <small><%# ((System.Data.DataRowView)Container.DataItem)["Service_Name"] %></small>

                                    <div class="p-rating">
                                        <i class="fa fa-star"></i>
                                        <%# ((System.Data.DataRowView)Container.DataItem)["SP_AverageRating"] %>
                                        <span class="text-muted ms-1">(<%# ((System.Data.DataRowView)Container.DataItem)["SP_Experience"] %> Experience)
                                        </span>
                                    </div>
                                </div>

                                <button type="button" class="btn btn-select">Select</button>
                            </div>
                        </div>
                    </ItemTemplate>

                </asp:Repeater>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </div>

        <div class="modal fade" id="bookingModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content overflow-hidden">

                    <div class="modal-header">
                        <h5 class="modal-title">Book Appointment</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body p-0">
                        <div class="row g-0">

                            <div class="col-md-4">
                                <div class="modal-profile-box">
                                    <img id="mImg" src="" class="modal-img shadow-sm" />
                                    <h4 id="mName" class="fw-bold mb-1">...</h4>
                                    <p id="mRole" class="text-muted mb-3">...</p>

                                    <div class="bg-white p-2 rounded shadow-sm d-inline-block px-4">
                                        <i class="fa fa-star text-warning"></i>
                                        <strong id="mRating"></strong>Rating
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8 p-4">
                                <h5 class="fw-bold mb-3 text-dark border-bottom pb-2">Select Schedule</h5>

                                <div class="mb-3">
                                    <label class="fw-bold small text-muted">DATE</label>
                                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" required="true"></asp:TextBox>
                                </div>

                                <label class="fw-bold small text-muted">AVAILABLE SLOTS</label>
                                <div class="time-slot-grid">
                                    <div class="time-slot" onclick="selectTime(this, '09:00 AM TO 11:00 AM')">09:00 AM TO 11:00</div>
                                    <div class="time-slot" onclick="selectTime(this, '11:00 AM TO 01:00 PM')">10:00 AM TO 01:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '01:00 PM TO 03:00 PM')">01:00 PM TO 03:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '03:00 PM TO 05:00 PM')">03:00 PM TO 05:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '05:00 PM TO 07:00 PM')">05:00 PM TO 07:00 PM</div>
                                </div>
                                <small id="errTime" class="text-danger" style="display: none;">Please select a time slot.</small>

                                <asp:HiddenField ID="hfProviderName" runat="server" />
                                <asp:HiddenField ID="hfProviderID" runat="server" />
                                <asp:HiddenField ID="hfEquipmentID" runat="server" />
                                <asp:HiddenField ID="hfSelectedTime" runat="server" />
                                <asp:HiddenField ID="hfMinimumPrice" runat="server" />
                                <asp:HiddenField ID="hfdate" runat="server" />

                                <asp:Button ID="btnBook" runat="server" Text="Confirm & Book" CssClass="btn btn-confirm" OnClientClick="return validate();" OnClick="btnBook_Click" />
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Open Modal
        function openModal(name, role, rating, spID, eqID, minPrice, img) {
            document.getElementById('mName').innerText = name;
            document.getElementById('mRole').innerText = role;
            document.getElementById('mRating').innerText = rating;
            document.getElementById('mImg').src = img;

            // Set Hidden Field
            document.getElementById('<%= hfProviderID.ClientID %>').value = spID;
            document.getElementById('<%= hfdate.ClientID %>').value = txtDate.Text;

            // Reset Time
            document.getElementById('<%= hfEquipmentID.ClientID %>').value = eqID;
            document.getElementById('<%= hfMinimumPrice.ClientID %>').value = minPrice;
            document.getElementById('<%= hfProviderName.ClientID %>').value = name;

            document.querySelectorAll('.time-slot').forEach(el => el.classList.remove('active'));

            new bootstrap.Modal(document.getElementById('bookingModal')).show();
        }

        // Select Time
        function selectTime(el, time) {
            document.querySelectorAll('.time-slot').forEach(item => item.classList.remove('active'));
            el.classList.add('active');
            document.getElementById('<%= hfSelectedTime.ClientID %>').value = time;
            document.getElementById('errTime').style.display = 'none';
        }

        // Validation
        function validate() {
            if (document.getElementById('<%= hfSelectedTime.ClientID %>').value === '') {
                document.getElementById('errTime').style.display = 'block';
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
