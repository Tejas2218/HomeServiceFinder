<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_booking.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <h3>Bookings</h3>
        </div>

        <div class="tabs-container">
            <asp:LinkButton ID="btnFetchAccepted" runat="server"
                CssClass="tab-btn  active-tab" OnClick="btnFetchAccepted_Click">
                Accepted
            </asp:LinkButton>
            <asp:LinkButton ID="btnFetchPending" runat="server"
                CssClass="tab-btn" OnClick="btnFetchPending_Click">
        
            </asp:LinkButton>
        </div>
        <br />

        <table>
            <!--OnRowCommand="gvBookings_RowCommand"-->
            <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="false"
                CssClass="table" GridLines="None" EmptyDataText="Data Not Available">
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
                                CssClass="btn btn-primary" OnClick="btnAccept_Click" />
                            <asp:Button ID="btnDecline" runat="server" Text="Decline"
                                CommandName="Decline" CommandArgument='<%# Eval("Booking_ID") %>'
                                CssClass="btn btn-danger" OnClick="btnDecline_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </table>
    </div>


</asp:Content>
