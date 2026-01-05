<%@ Page Language="C#"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    AutoEventWireup="true"
    CodeBehind="AdminProfile.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin-bottom:20px;">Profile</h2>

    <div class="settings-box">
        <h3>Admin Profile</h3>

        <label>Name</label>
        <asp:TextBox runat="server" CssClass="input" Placeholder="Admin Name" />

        <label>Email</label>
        <asp:TextBox runat="server" CssClass="input"
            TextMode="Email" Placeholder="admin@email.com" />

        <asp:Button runat="server" Text="Save Changes" CssClass="btn-save" />
    </div>

    <div class="settings-box">
        <h3>Change Password</h3>

        <label>Current Password</label>
        <asp:TextBox runat="server" CssClass="input" TextMode="Password" />

        <label>New Password</label>
        <asp:TextBox runat="server" CssClass="input" TextMode="Password" />

        <label>Confirm New Password</label>
        <asp:TextBox runat="server" CssClass="input" TextMode="Password" />

        <asp:Button runat="server" Text="Update Password" CssClass="btn-save" />
    </div>

    <div class="settings-box">
        <h3>System Settings</h3>

        <div class="toggle">
            <asp:CheckBox runat="server" Checked="true" />
            Enable Email Notifications
        </div>

        <div class="toggle">
            <asp:CheckBox runat="server" />
            Maintenance Mode
        </div>

        <asp:Button runat="server" Text="Save Settings" CssClass="btn-save" />
    </div>

</asp:Content>
