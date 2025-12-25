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

        body { background-color: var(--apex-light); font-family: 'Segoe UI', sans-serif; }

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
        .p-details h5 { font-weight: 700; margin: 0; color: var(--apex-dark); }
        .p-details small { color: #777; font-weight: 500; }
        .p-rating { color: #ffc107; font-size: 0.9rem; margin-top: 5px; }

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
        .modal-header { background: var(--apex-dark); color: white; }
        .modal-title { color: var(--apex-orange); font-weight: bold; }
        
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
        .time-slot:hover { border-color: var(--apex-orange); color: var(--apex-orange); }
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
        .btn-confirm:hover { background-color: var(--apex-orange); }

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
                            <div class="provider-card" onclick="openModal('<%# Eval("Name") %>', '<%# Eval("Role") %>', '<%# Eval("Rating") %>', '<%# Eval("Img") %>')">
                                
                                <img src='<%# Eval("Img") %>' class="p-img" onerror="this.src='https://via.placeholder.com/80';"/>
                                
                                <div class="p-details">
                                    <h5><%# Eval("Name") %></h5>
                                    <small><%# Eval("Role") %></small>
                                    <div class="p-rating">
                                        <i class="fa fa-star"></i> <%# Eval("Rating") %> 
                                        <span class="text-muted ms-1">(<%# Eval("Jobs") %> Jobs)</span>
                                    </div>
                                </div>

                                <button type="button" class="btn btn-select">Select</button>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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
                                        <strong id="mRating"></strong> Rating
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
                                    <div class="time-slot" onclick="selectTime(this, '09:00 AM')">09:00 AM</div>
                                    <div class="time-slot" onclick="selectTime(this, '10:00 AM')">10:00 AM</div>
                                    <div class="time-slot" onclick="selectTime(this, '11:00 AM')">11:00 AM</div>
                                    <div class="time-slot" onclick="selectTime(this, '02:00 PM')">02:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '04:00 PM')">04:00 PM</div>
                                    <div class="time-slot" onclick="selectTime(this, '06:00 PM')">06:00 PM</div>
                                </div>
                                <small id="errTime" class="text-danger" style="display:none;">Please select a time slot.</small>

                                <asp:HiddenField ID="hfProviderName" runat="server" />
                                <asp:HiddenField ID="hfSelectedTime" runat="server" />

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
        function openModal(name, role, rating, img) {
            document.getElementById('mName').innerText = name;
            document.getElementById('mRole').innerText = role;
            document.getElementById('mRating').innerText = rating;
            document.getElementById('mImg').src = img;
            
            // Set Hidden Field
            document.getElementById('<%= hfProviderName.ClientID %>').value = name;
            
            // Reset Time
            document.getElementById('<%= hfSelectedTime.ClientID %>').value = '';
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
