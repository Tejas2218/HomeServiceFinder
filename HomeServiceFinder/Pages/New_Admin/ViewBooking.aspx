<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="ViewBooking.aspx.cs"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.ViewBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin-bottom: 20px;">Booking Details</h2>

    <div class="profile-card" style="width: 100%">

        <div class="profile-grid" style="width: 100%">

            <!-- ================= USER INFORMATION ================= -->
            <div class="section-title full-width">
                User Information
            </div>

            <div class="profile-item full-width" style="width: 48%">
                <label>Name</label>
                <asp:Label ID="User_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Email</label>
                <asp:Label ID="User_EmailID" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Contact Number</label>
                <asp:Label ID="User_ContactNo" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>State</label>
                <asp:Label ID="User_State_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>City</label>
                <asp:Label ID="User_City_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item full-width">
                <label>Address</label>
                <asp:Label ID="User_Address" runat="server" CssClass="profile-value" />
            </div>
        </div>
        <br />
        <div style="text-align: center">
            <asp:Button
                ID="btnCancelBooking"
                runat="server"
                Text="Cancel Booking"
                CssClass="btn btn-delete"
                OnClick="btnStatusChange_Click"
                OnClientClick="return confirmStatusChange(this,'Cancelled');" />

            <asp:Button
                ID="btnReBook"
                runat="server"
                Text="Re-Book"
                Visible="false"
                CssClass="btn btn-edit"
                Style="margin-left: 10px;"
                OnClick="btnReBook_Click"
                OnClientClick="return confirmAction(this,'ReBook');" />

        </div>

        <!-- ================= WORKER INFORMATION ================= -->
        <div class="profile-grid" style="width: 100%">
            <div class="section-title full-width">
                Worker Information
            </div>

            <div class="profile-item">
                <label>Service</label>
                <asp:Label ID="Service_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Worker Name</label>
                <asp:Label ID="Worker_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Worker Email</label>
                <asp:Label ID="Worker_EmailID" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Worker Contact</label>
                <asp:Label ID="Worker_ContactNo" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>State</label>
                <asp:Label ID="Worker_State_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>City</label>
                <asp:Label ID="Worker_City_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Age</label>
                <asp:Label ID="SP_Age" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Experience (Years)</label>
                <asp:Label ID="SP_Experience" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Minimum Price</label>
                <asp:Label ID="SP_MinimumPrice" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Average Rating</label>
                <asp:Label ID="SP_AverageRating" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item full-width">
                <label>Shop Address</label>
                <asp:Label ID="SP_ShopAddress" runat="server" CssClass="profile-value" />
            </div>

        </div>
        <br />
        <!-- ================= BUTTONS ================= -->
        <div style="text-align: center">
            <asp:Button
                ID="btnAcceptBooking"
                runat="server"
                Text="Accept Booking"
                CssClass="btn btn-edit"
                OnClick="btnAcceptBooking_Click"
                OnClientClick="return confirmAction(this, 'Accepted');" />

            <asp:Button
                ID="btnDeclineBooking"
                runat="server"
                Text="Decline Booking"
                CssClass="btn btn-delete"
                OnClick="btnStatusChange_Click"
                OnClientClick="return confirmDecline(this,'Declined');" />

            <asp:Button
                ID="btnCompletedBooking"
                runat="server"
                Text="✔ Complete Booking"
                CssClass="btn btn-complete"
                Visible="false"
                OnClick="btnCompletedBooking_Click"
                OnClientClick="return confirmAction(this,'Completed');" />

            <asp:HiddenField ID="hfDeclineReason" runat="server" />
            <asp:HiddenField ID="hfBookingStatus" runat="server" />


        </div>




        <!-- ================= BOOKING INFORMATION ================= -->
        <div class="profile-grid" style="width: 100%">
            <div class="section-title full-width">
                Booking Information
            </div>

            <div class="profile-item full-width" style="width: 48%">
                <label>Booking Status</label>
                <asp:Label ID="Booking_Status" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Booking Date & Time</label>
                <asp:Label ID="Booking_DateTime" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Visiting Date </label>
                <asp:Label ID="Visiting_Date" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Rating</label>
                <asp:Label ID="Booking_Rating" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item ">
                <label>Decline Reason</label>
                <asp:Label ID="Booking_Decline_Reason" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Booking Code</label>
                <asp:Label ID="Booking_Code" runat="server" CssClass="profile-value" />
            </div>


        </div>

        <!-- ================= BUTTONS ================= -->
        <div style="margin-top: 20px;">
            <asp:Button
                ID="btnBack"
                runat="server"
                Text="← Back"
                CssClass="btn btn-view"
                OnClientClick="history.back(); return false;" />

        </div>


        <!-- ================= SCRIPT ================= -->
        <script>
            function confirmStatusChange(button, status) {

                if (button.dataset.confirmed === "true") {
                    return true;
                }

                let titleText = '';
                let confirmText = '';
                let confirmColor = '';

                if (status === 'Declined') {
                    titleText = 'Decline Booking?';
                    confirmText = 'Yes, Decline';
                    confirmColor = '#dc3545';
                }
                else if (status === 'Cancelled') {
                    titleText = 'Cancel Booking?';
                    confirmText = 'Yes, Cancel';
                    confirmColor = '#ffc107';
                }

                Swal.fire({
                    title: titleText,
                    text: 'Please provide a reason.',
                    input: 'textarea',
                    inputPlaceholder: 'Enter reason here...',
                    inputValidator: (value) => {
                        if (!value) {
                            return 'Reason is required!';
                        }
                    },
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: confirmColor,
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: confirmText,
                    cancelButtonText: 'Back',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {

                        document.getElementById('<%= hfDeclineReason.ClientID %>').value = result.value;
                        document.getElementById('<%= hfBookingStatus.ClientID %>').value = status;

                        Swal.fire({
                            title: 'Processing...',
                            text: 'Please wait...',
                            allowOutsideClick: false,
                            allowEscapeKey: false,
                            showConfirmButton: false,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        });

                        button.dataset.confirmed = "true";
                        button.click();
                    }
                });


                return false;
            }


            function confirmAction(button, status) {

                if (button.dataset.confirmed === "true") {
                    return true;
                }

                let config = {
                    Accepted: {
                        title: 'Accept Booking?',
                        text: 'Are you sure you want to accept this booking?',
                        color: '#198754',
                        btnText: 'Yes, Accept'
                    },
                    Cancelled: {
                        title: 'Cancel Booking?',
                        text: 'Are you sure you want to cancel this booking?',
                        color: '#dc3545',
                        btnText: 'Yes, Cancel'
                    },
                    Completed: {
                        title: 'Complete Booking?',
                        text: 'Mark this booking as completed?',
                        color: '#0d6efd',
                        btnText: 'Yes, Complete'
                    },
                    ReBook: {   // ✅ ADD THIS
                        title: 'Re-Book Service?',
                        text: 'Do you want to book this service again?',
                        color: '#0d6efd',
                        btnText: 'Yes, Re-Book'
                    }
                };


                let cfg = config[status];

                if (!cfg) {
                    console.error('Unknown status:', status);
                    return false;
                }

                Swal.fire({
                    title: cfg.title,
                    text: cfg.text,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: cfg.color,
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: cfg.btnText,
                    cancelButtonText: 'No',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {

                        Swal.fire({
                            title: 'Processing...',
                            text: 'Please wait...',
                            allowOutsideClick: false,
                            allowEscapeKey: false,
                            showConfirmButton: false,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        });

                        button.dataset.confirmed = "true";
                        button.click();
                    }
                });


                return false;
            }
        </script>

    </div>
</asp:Content>
