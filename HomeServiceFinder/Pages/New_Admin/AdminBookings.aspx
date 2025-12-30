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
            CssClass="filter-btn "
             />

        <asp:Button
            ID="btnPending"
            runat="server"
            Text="Pending Requests"
            CssClass="filter-btn "
             />

        <asp:Button
            ID="btnApproved"
            runat="server"
            Text="Approved"
            CssClass="filter-btn"
             />

        <asp:Button
            ID="btnRejected"
            runat="server"
            Text="Declined"
            CssClass="filter-btn"
             />

    </div>

    <!-- TABLE -->
    <div class="table-box">
        <asp:GridView
            ID="UserGrid"
            runat="server"
            CssClass="admin-table"
            DataKeyNames="User_ID"
            EmptyDataText="No Data Found"
            AllowPaging="true"
            PageSize="10"
            AutoGenerateColumns="false"
            >

            <Columns>

                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%# Eval("User_Name") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <%# Eval("User_EmailID") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%# Eval("User_Address") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <%# Eval("State_Name") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <%# Eval("City_Name") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact No.">
                    <ItemTemplate>
                        <%# Eval("User_ContactNo") %>
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
                                CommandArgument='<%# Eval("SP_ID") %>'
                                CausesValidation="false" />


                            <asp:Button
                                ID="btnRemove"
                                runat="server"
                                Text="Remove"
                                CssClass="btn btn-delete"
                                CommandName="DeleteUser"
                                CommandArgument='<%# Eval("SP_ID") %>'
                                CausesValidation="false"
                                OnClientClick="return confirm('Are you sure you want to remove this user?');" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

</asp:Content>
