<%@ Page Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="AddServiceProvider.aspx.cs" 
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.AddServiceProvider" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin-bottom: 20px;">Service Provider Profile</h2>


    <div class="profile-card" style="width:100%">

        <div class="profile-grid" style="width:100%">

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
                Text="Add Service Provider"
                CssClass="btn btn-edit"
                />

        </div>
      

    </div>

</asp:Content>
