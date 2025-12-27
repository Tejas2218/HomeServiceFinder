<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_Booking_History.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_Booking_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="bookings" class="section-box">
        <div class="section-header">
            <h3>Booking History</h3>
        </div>

        <div class="tabs-container">
            <asp:LinkButton ID="btnFetchAll" runat="server" CssClass="tab-btn active-tab" OnClick="btnFetchAll_Click" CommandArgument="none">All</asp:LinkButton>
            <asp:LinkButton ID="btnFetchAccepted" runat="server" CssClass="tab-btn" OnClick="btnFetchAll_Click" CommandArgument="Accepted">Accepted</asp:LinkButton>
            <asp:LinkButton ID="btnFetchDeclined" runat="server" CssClass="tab-btn" OnClick="btnFetchAll_Click" CommandArgument="Declined">Declined</asp:LinkButton>
        </div>
        <br />

        <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="false"
            CssClass="table table-hover" GridLines="None" EmptyDataText="No bookings found for this category.">
            <Columns>
                <asp:BoundField DataField="Booking_ID" HeaderText="ID" />
                <asp:TemplateField HeaderText="Customer">
                    <ItemTemplate>
                        <div class="customer-info-cell">
                            <%# Eval("User_Name") %>
                            <asp:LinkButton ID="btnMoreInfo" runat="server" OnClick="btnMoreInfo_Click"
                                CommandArgument='<%# Eval("User_ID") %>' CssClass="info-icon-btn">
                                <i class="bi bi-info-circle-fill"></i>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Equipment_Name" HeaderText="Service" />
                <asp:BoundField DataField="Visiting_DateTime" HeaderText="Schedule" />

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <%-- Dynamic CSS Class based on Status --%>
                        <span class='<%# "badge bg-" + Eval("Booking_Status").ToString().ToLower() %>'>
                            <%# Eval("Booking_Status") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
