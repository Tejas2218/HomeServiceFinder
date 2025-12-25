<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="ViewServiceProviderDetails.aspx.cs"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.ViewServiceProviderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin-bottom: 20px;">Service Provider Profile</h2>


    <div class="profile-card">

        <div class="profile-grid">

            <!-- USER INFO -->
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

            <!-- SERVICE PROVIDER INFO -->
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
            <!-- CREATED & MODIFIED INFO -->
            <div class="profile-item">
                <label>Created At</label>
                <asp:Label ID="Created_At" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Modified At</label>
                <asp:Label ID="Modified_At" runat="server" CssClass="profile-value" />
            </div>
        </div>

        <!-- ACTION BUTTONS -->
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
        <!-- APPROVAL ACTION BOX -->
        <div class="approval-box">

            <h4>Admin Action</h4>
            <p>Please review the service provider details before taking action.</p>

            <div class="approval-actions">
                <asp:Button
                    ID="btnApprove"
                    runat="server"
                    Visible="false"
                    Text="✔ Approve Provider"
                    CssClass="btn btn-approve" />

                <asp:Button
                    ID="btnReject"
                    Visible="false"
                    runat="server"
                    Text="✖ Reject Provider"
                    CssClass="btn btn-reject"
                    OnClientClick="return confirm('Are you sure you want to reject this provider?');" />
            </div>

        </div>


    </div>

</asp:Content>
