<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_user_profile_new.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnBack" runat="server" Text="← Back to Dashboard" OnClick="btnBack_Click" CssClass="btn-back" />
    <asp:HiddenField ID="hfwebpage" runat="server" />
    <div class="profile-container">
        <div class="card">
            <div class="user-info-header">
                <div class="user-avatar">
                    <asp:Literal ID="AvatarInitials" runat="server">User</asp:Literal>
                </div>
                <h2><asp:Label ID="User_Name" runat="server" Text=""></asp:Label></h2>
                <span class="status-pill completed">Verified Customer</span>
            </div>

            <div class="info-group">
                <span class="info-label">Email Address</span>
                <span class="info-value"><asp:Label ID="User_Email" runat="server"></asp:Label></span>
            </div>

            <div class="info-group">
                <span class="info-label">Mobile Number</span>
                <span class="info-value"><asp:Label ID="User_Contact" runat="server"></asp:Label></span>
            </div>

            <div class="info-group">
                <span class="info-label">Address</span>
                <span class="info-value">
                    <asp:Label ID="User_Address" runat="server"></asp:Label>, 
                    <asp:Label ID="City_Name" runat="server"></asp:Label>, 
                    <asp:Label ID="State_Name" runat="server"></asp:Label>
                </span>
            </div>
        </div>

        <div class="card">
            <h3>Booking History (with you)</h3>
            <%-- Suggestion: Use an asp:GridView or Repeater here to bind real history data --%>
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Service</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>12 Dec 2025</td>
                        <td>Pipe Leakage Repair</td>
                        <td>₹ 450</td>
                        <td><span class="status-pill completed">Completed</span></td>
                    </tr>
                    </tbody>
            </table>
        </div>
    </div>
</asp:Content>
