<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="AdminBookings.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.AdminBookings"
    MasterPageFile="~/MasterPage/AdminMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- PAGE TITLE -->
    <h2 style="margin-bottom: 20px;">Bookings</h2>

    <!-- STATS -->
    <div class="stats">
        <div class="stat-card">
            <h3>Total Bookings</h3>
            <h2>
                <asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label>
            </h2>
        </div>

        <div class="stat-card">
            <h3>Today’s Bookings</h3>
            <h2>
                <asp:Label ID="lblTodayBookings" runat="server" Text="0"></asp:Label>
            </h2>
        </div>

        <div class="stat-card">
            <h3>Pending</h3>
            <h2>
                <asp:Label ID="lblPendingBookings" runat="server" Text="0"></asp:Label>
            </h2>
        </div>
    </div>

    <!-- TABLE -->
    <div class="filter-tabs">

        <asp:Button
            ID="btnAll"
            runat="server"
            Text="All"
            OnClick="btnAll_Click"
            CssClass="filter-btn " />

        <asp:Button
            ID="btnPending"
            runat="server"
            Text="Pending Requests"
            OnClick="btnPending_Click"
            CssClass="filter-btn " />

        <asp:Button
            ID="btnCompleted"
            runat="server"
            Text="Approved"
            OnClick="btnCompleted_Click"
            CssClass="filter-btn" />

        <asp:Button
            ID="btnUserDecline"
            runat="server"
            Text="Declined"
            OnClick="btnUserDecline_Click"
            CssClass="filter-btn" />

        <asp:Button
            ID="btnWorkerDecline"
            runat="server"
            Text="Declined"
            OnClick="btnWorkerDecline_Click"
            CssClass="filter-btn" />

    </div>

    <!-- TABLE -->
    <div class="table-box">
        <asp:GridView
            ID="BookingGrid"
            runat="server"
            CssClass="admin-table"
            DataKeyNames="Booking_ID"
            EmptyDataText="No Data Found"
            AllowPaging="true"
            PageSize="10"
            AutoGenerateColumns="false"
            OnRowCommand="UserGrid_RowCommand"
            OnPageIndexChanging="UserGrid_PageIndexChanging">

            <Columns>

                <asp:TemplateField HeaderText="User ">
                    <ItemTemplate>
                        <%# Eval("User_Name") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Woker ">
                    <ItemTemplate>
                        <%# Eval("Worker_Name") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <%# Eval("Booking_Status") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Booking Time">
                    <ItemTemplate>
                        <%# Eval("Booking_DateTime") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Rating">
                    <ItemTemplate>
                        <%# Eval("Booking_Rating") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Service">
                    <ItemTemplate>
                        <%# Eval("Service_Name") %>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <asp:Button
                                ID="btnView"
                                runat="server"
                                Text="View"
                                CssClass="btn btn-view"
                                CommandName="ViewUser"
                                CommandArgument='<%# Eval("Booking_ID") %>'
                                CausesValidation="false" />


                            <asp:Button
                                ID="btnRemove"
                                runat="server"
                                Text="Remove"
                                CssClass="btn btn-delete"
                                CommandName="DeleteUser"
                                CommandArgument='<%# Eval("Booking_ID") %>'
                                CausesValidation="false"
                                OnClientClick="return confirm('Are you sure you want to remove this user?');" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>


</asp:Content>
