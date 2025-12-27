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
                <h2>
                    <asp:Label ID="User_Name" runat="server" Text=""></asp:Label></h2>
                <span class="status-pill completed">Verified Customer</span>
            </div>

            <div class="info-group">
                <span class="info-label">Email Address</span>
                <span class="info-value">
                    <asp:Label ID="User_Email" runat="server"></asp:Label></span>
            </div>

            <div class="info-group">
                <span class="info-label">Mobile Number</span>
                <span class="info-value">
                    <asp:Label ID="User_Contact" runat="server"></asp:Label></span>
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
                <asp:GridView ID="gvBookingHistory" runat="server" AutoGenerateColumns="false" CssClass="history-table" GridLines="None" EmptyDataText="No Previous Records">
                    <Columns>
                        <asp:BoundField DataField="Visiting_DateTime" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
                        <asp:BoundField DataField="Equipment_Name" HeaderText="Service" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# "badge bg-" + Eval("Booking_Status").ToString().ToLower() %>'>
                                    <%# Eval("Booking_Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </div>
    </div>
</asp:Content>
