<%@ Page Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_Booking_History.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_Booking_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="bookings" class="section-box">
        <div class="section-header">
            <h3>Bookin History</h3>
        </div>

        <div class="tabs-container">
            <asp:LinkButton ID="btnFetchAll" runat="server" CssClass="tab-btn active-tab" OnClick="btnFetchAll_Click" CommandArgument="none">All</asp:LinkButton>
            <asp:LinkButton ID="btnFetchAccepted" runat="server" CssClass="tab-btn" OnClick="btnFetchAll_Click" CommandArgument="Accepted">Accepted</asp:LinkButton>
            <asp:LinkButton ID="btnFetchDeclined" runat="server" CssClass="tab-btn" OnClick="btnFetchAll_Click" CommandArgument="Declined">Declined</asp:LinkButton>
            <asp:LinkButton ID="btnFetchCompleted" runat="server" CssClass="tab-btn" OnClick="btnFetchAll_Click" CommandArgument="Completed">Completed</asp:LinkButton>
            <asp:LinkButton ID="btnFetchCancelled" runat="server" CssClass="tab-btn" OnClick="btnFetchAll_Click" CommandArgument="Cancelled">Cancelled by user</asp:LinkButton>
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
                <asp:BoundField DataField="Visiting_DateTime"
                    HeaderText="Visiting Date"
                    DataFormatString="{0:dd-MM-yyyy}"
                    HtmlEncode="false" />

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <%-- Dynamic CSS Class based on Status --%>
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
    </div>
</asp:Content>
