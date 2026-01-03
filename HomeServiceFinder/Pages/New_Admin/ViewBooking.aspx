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

            <!-- ================= WORKER INFORMATION ================= -->
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

            <div class="profile-item">
                <label>Status</label>
                <asp:Label ID="SP_Status" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item full-width">
                <label>Shop Address</label>
                <asp:Label ID="SP_ShopAddress" runat="server" CssClass="profile-value" />
            </div>

            <!-- ================= BOOKING INFORMATION ================= -->
            <div class="section-title full-width">
                Booking Information
            </div>

            <div class="profile-item">
                <label>Booking Status</label>
                <asp:Label ID="Booking_Status" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Booking Date & Time</label>
                <asp:Label ID="Booking_DateTime" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Rating</label>
                <asp:Label ID="Booking_Rating" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item full-width">
                <label>Decline Reason</label>
                <asp:Label ID="Booking_Decline_Reason" runat="server" CssClass="profile-value" />
            </div>



        </div>

        <!-- ================= BUTTONS ================= -->
        <div style="text-align: center; margin-top: 20px;">
            <asp:Button
                ID="btnBack"
                runat="server"
                Text="← Back"
                CssClass="btn btn-view"
                OnClientClick="history.back(); return false;" />

            <asp:Button
                ID="btnEdit"
                runat="server"
                Text="Edit Profile"
                CssClass="btn btn-edit" />
        </div>

      
        <!-- ================= SCRIPT ================= -->
        <script>
            function confirmAction(button, actionType) {
                if (button.dataset.confirmed === "true") {
                    return true;
                }

                let titleText = actionType === 'Approve' ? 'Approve Provider?' : 'Reject Provider?';
                let confirmColor = actionType === 'Approve' ? '#198754' : '#dc3545';
                let btnText = actionType === 'Approve' ? 'Yes, Approve!' : 'Yes, Reject!';

                Swal.fire({
                    title: titleText,
                    text: "Are you sure you want to " + actionType.toLowerCase() + " this service provider?",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: confirmColor,
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: btnText,
                    cancelButtonText: 'No, cancel',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        button.dataset.confirmed = "true";
                        button.click();
                    }
                });
                return false;
            }
        </script>

    </div>
</asp:Content>
