<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="ViewServiceProviderDetails.aspx.cs"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.ViewServiceProviderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2 style="margin-bottom: 20px;">Service Provider Profile</h2>

    <div class="profile-card" style="width: 100%">

        <div class="profile-grid" style="width: 100%">

            <div class="section-title full-width">
                Personal Information
            </div>

            <div class="profile-item">
                <label>Name</label>
                <asp:Label ID="User_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Email</label>
                <asp:Label ID="User_Email" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Contact Number</label>
                <asp:Label ID="User_Contact" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Role</label>
                <asp:Label ID="User_Role" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>State</label>
                <asp:Label ID="State_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>City</label>
                <asp:Label ID="City_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item full-width">
                <label>Address</label>
                <asp:Label ID="User_Address" runat="server" CssClass="profile-value" />
            </div>

            <div class="section-title full-width">
                Working Information
            </div>

            <div class="profile-item">
                <label>Service</label>
                <asp:Label ID="Service_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Equipment</label>
                <asp:Label ID="Equipment_Name" runat="server" CssClass="profile-value" />
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

            <div class="section-title full-width">
                Audit Information
            </div>

            <div class="profile-item">
                <label>Created At</label>
                <asp:Label ID="Created_At" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Modified At</label>
                <asp:Label ID="Modified_At" runat="server" CssClass="profile-value" />
            </div>
        </div>

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
                CssClass="btn btn-edit"
                OnClick="btnEdit_Click" />

        </div>
        <div class="approval-box">

            <h4>Admin Action</h4>
            <p>Please review the service provider details before taking action.</p>

            <div class="approval-actions">
                <asp:Button
                    ID="btnApprove"
                    runat="server"
                    OnClick="btnApprove_Click"
                    Text="✔ Approve Provider"
                    CssClass="btn btn-approve"
                    OnClientClick="return confirmAction(this, 'Approve');" />

                <asp:Button
                    ID="btnReject"
                    runat="server"
                    OnClick="btnReject_Click"
                    Text="✖ Reject Provider"
                    CssClass="btn btn-reject"
                    OnClientClick="return confirmAction(this, 'Reject');" />
            </div>

        </div>

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
                    reverseButtons: true,
                    allowOutsideClick: () => !Swal.isLoading()
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Display the loader
                        Swal.fire({
                            title: 'Processing...',
                            text: 'Please wait while we update the status.',
                            allowOutsideClick: false,
                            allowEscapeKey: false,
                            showConfirmButton: false,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        });

                        // Trigger the postback
                        button.dataset.confirmed = "true";
                        button.click();
                    }
                });
                return false;
            }
        </script>
    </div>

</asp:Content>