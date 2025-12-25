<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_booking.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="stats-grid">
        <div class="stat-card">
            <h3>Total Earnings</h3>
            <h2>₹ 12,450</h2>
        </div>
        <div class="stat-card">
            <h3>Total Bookings</h3>
            <h2>120</h2>
        </div>
        <div class="stat-card">
            <h3>Pending Tasks</h3>
            <h2>05</h2>
        </div>
        <div class="stat-card">
            <h3>Rating</h3>
            <h2>4.8 ⭐</h2>
        </div>
    </div>

    <div id="bookings" class="section-box">
        <div class="section-header">
            <h3>Bookings</h3>
        </div>
        <!--OnRowCommand="gvBookings_RowCommand"-->
        <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="false"
            CssClass="table" GridLines="None" EmptyDataText="Data Not Available">
            <Columns>
                <asp:BoundField DataField="Booking_ID" HeaderText="ID" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                <asp:BoundField DataField="ServiceName" HeaderText="Service" />
                <asp:BoundField DataField="Schedule" HeaderText="Schedule" />

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <span class='<%# "badge bg-" + Eval("Status").ToString().ToLower() %>'>
                            <%# Eval("Status") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnAccept" runat="server" Text="Accept"
                            CommandName="Accept" CommandArgument='<%# Eval("BookingID") %>'
                            CssClass="btn btn-primary" />
                        <asp:Button ID="btnDecline" runat="server" Text="Decline"
                            CommandName="Decline" CommandArgument='<%# Eval("BookingID") %>'
                            CssClass="btn btn-danger" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
