<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="ViewServiceProviderDetails.aspx.cs"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.ViewServiceProviderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin-bottom: 20px;">Service Provider Profile</h2>

    <div class="profile-card">

        <div class="profile-grid">

            <div class="profile-item">
                <label>Name</label>
                <asp:Label ID="User_Name_TextBox" runat="server" CssClass="profile-value"></asp:Label>
            </div>

            <div class="profile-item">
                <label>Email</label>
                <asp:Label ID="User_Email_TextBox" runat="server" CssClass="profile-value"></asp:Label>
            </div>

            <div class="profile-item">
                <label>Contact Number</label>
                <asp:Label ID="User_Contact_TextBox" runat="server" CssClass="profile-value"></asp:Label>
            </div>

            <div class="profile-item">
                <label>State</label>
                <asp:Label ID="State" runat="server" CssClass="profile-value"></asp:Label>
            </div>

            <div class="profile-item">
                <label>City</label>
                <asp:Label ID="City" runat="server" CssClass="profile-value"></asp:Label>
            </div>

            <div class="profile-item full-width">
                <label>Address</label>
                <asp:Label ID="User_Address_TextBox" runat="server" CssClass="profile-value"></asp:Label>
            </div>

            <div class="profile-item full-width">
                <label>Password</label>
                <asp:Label ID="User_Password_TextBox" runat="server" CssClass="profile-value"></asp:Label>
            </div>

        </div>

        <div class="profile-actions">
            <asp:Button
                ID="btnUpdateProfile"
                runat="server"
                Text="Edit Profile"
                CssClass="btn btn-edit" />
        </div>

    </div>

</asp:Content>
