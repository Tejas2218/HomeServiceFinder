<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_booking.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Keep your CSS here, but do not put <script> or <link> inside */
        .otp-input {
            width: 50px;
            height: 60px;
            /* ... rest of your styles ... */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="stats-grid">
        <div class="stat-card">
            <h3>Total Bookings</h3>
            <asp:Label ID="lblTotalBooking" runat="server"></asp:Label>
        </div>
        <div class="stat-card">
            <h3>Pending Tasks</h3>
            <asp:Label ID="lblPendingTask" runat="server"></asp:Label>
        </div>
        <div class="stat-card">
            <h3>Rating</h3>
            <asp:Label ID="lblAvgRating" runat="server"></asp:Label>
        </div>
    </div>

    <div id="bookings" class="section-box">

        <div class="section-header">
            <h3>Booking Details</h3>
        </div>

        <div class="tabs-container">
            <asp:LinkButton ID="btnFetchAccepted" runat="server"
                CssClass="tab-btn  active-tab" OnClick="btnFetchAccepted_Click">
                Current Booking
            </asp:LinkButton>
            <asp:LinkButton ID="btnFetchAcceptedUpcomming" runat="server"
                CssClass="tab-btn" OnClick="btnFetchAcceptedUpcomming_Click">
                Up-Comming Booking
            </asp:LinkButton>
            <asp:LinkButton ID="btnFetchPending" runat="server"
                CssClass="tab-btn" OnClick="btnFetchPending_Click">
        
            </asp:LinkButton>

        </div>
        <br />

        <table>
            <!--OnRowCommand="gvBookings_RowCommand"-->
            <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="false"
                CssClass="table" GridLines="None" EmptyDataText="Data Not Available" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="Booking_ID" HeaderText="ID" />
                    <asp:TemplateField HeaderText="Customer">
                        <ItemTemplate>
                            <div class="customer-info-cell">
                                <%# Eval("User_Name") %>
                                <asp:LinkButton ID="btnMoreInfo" runat="server"
                                    OnClick="btnMoreInfo_Click"
                                    CommandArgument='<%#Eval("User_ID")%>'
                                    CommandName="User_ID"
                                    CssClass="info-icon-btn"
                                    ToolTip="View More Details">
                            <i class="bi bi-info-circle-fill"></i> </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Equipment_Name" HeaderText="Service" />
                    <asp:BoundField DataField="Visiting_DateTime"
                        HeaderText="Visiting Date"
                        DataFormatString="{0:dd-MM-yyyy}"
                        HtmlEncode="false" />
                    <asp:BoundField DataField="Time_Slot" HeaderText="Schedule" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# "badge bg-" + Eval("Booking_Status").ToString().ToLower() %>'>
                                <%# Eval("Booking_Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnAccept" runat="server" Text="Accept"
                                CommandName="Accept" CommandArgument='<%# Eval("Booking_ID") %>'
                                CssClass="btn btn-primary" OnClick="btnAccept_Click"
                                OnClientClick="return confirm('Are you sure you want to Accept?');" />
                            <asp:Button ID="btnDecline" runat="server" Text="Decline"
                                CommandName="Decline" CommandArgument='<%# Eval("Booking_ID") %>'
                                CssClass="btn btn-danger"
                                OnClientClick='<%# "return showDeclineAlert(\"" + Eval("Booking_ID") + "\");" %>' />
                            <asp:Button ID="btnComplete" runat="server" Text="Completed"
                                CssClass="btn btn-success" OnClick="btnComplete_Click"
                                CommandName="Completed" CommandArgument='<%# Eval("Booking_ID") %>'
                                OnClientClick='<%# "return showOtpAlert(\"" + Eval("Booking_ID") + "\");" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </table>
    </div>
    <div style="display: none;">
        <asp:TextBox ID="txtVerifyCode" runat="server"></asp:TextBox>
        <asp:HiddenField ID="hfSelectedBookingId" runat="server" />
        <asp:Button ID="btnFinalSubmit" runat="server" OnClick="btnComplete_Click" />
        <asp:HiddenField ID="hfDeclineReason" runat="server" />
        <asp:Button ID="btnFinalDecline" runat="server" OnClick="btnDecline_Click" Style="display: none;" />
    </div>
    <script>
        function showOtpAlert(bookingId) {
            Swal.fire({
                title: 'Verify Completion',
                text: 'Please enter the 6-digit code provided by the customer:',
                input: 'text',
                inputAttributes: {
                    autocapitalize: 'off',
                    maxlength: 6, // Changed to 6
                    placeholder: 'XXXXXX', // Changed to 6
                    style: 'text-align: center; font-size: 24px; letter-spacing: 5px;'
                },
                showCancelButton: true,
                confirmButtonText: 'Verify & Complete',
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#dc3545',
                preConfirm: (code) => {
                    // Validate for exactly 6 digits
                    if (!code || code.length !== 6 || isNaN(code)) {
                        Swal.showValidationMessage('Please enter a valid 6-digit numeric code');
                    }
                    return code;
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('<%= txtVerifyCode.ClientID %>').value = result.value;
                    document.getElementById('<%= hfSelectedBookingId.ClientID %>').value = bookingId;
                    document.getElementById('<%= btnFinalSubmit.ClientID %>').click();
                }
            });
            return false;
        }
        function showDeclineAlert(bookingId) {
            Swal.fire({
                title: 'Decline Booking',
                text: 'Please provide a reason for declining this request:',
                input: 'textarea',
                inputPlaceholder: 'Type your reason here...',
                inputAttributes: {
                    'aria-label': 'Type your reason here'
                },
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Confirm Decline',
                preConfirm: (reason) => {
                    if (!reason || reason.trim().length < 5) {
                        Swal.showValidationMessage('Please enter a reason (at least 5 characters)');
                    }
                    return reason;
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    // Store data in hidden fields
                    document.getElementById('<%= hfSelectedBookingId.ClientID %>').value = bookingId;
                    document.getElementById('<%= hfDeclineReason.ClientID %>').value = result.value;

                    // Trigger the server-side decline event
                    document.getElementById('<%= btnFinalDecline.ClientID %>').click();
                }
            });
            return false; // Prevent immediate postback
        }


    </script>
</asp:Content>


