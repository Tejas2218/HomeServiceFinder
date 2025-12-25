<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="ServiceProvider.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.ServiceProvider"
    MasterPageFile="~/MasterPage/AdminMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- PAGE TITLE ONLY -->
    <h2 style="margin-bottom: 20px;">Service Providers</h2>

    <!-- TOTAL PROVIDERS -->
    <div class="stat-card">
        <h3>Total Service Providers</h3>
        <h2>
            <asp:Label ID="lblTotalProviders" runat="server" Text="0"></asp:Label>
        </h2>
    </div>

    <!-- HEADER -->
    <h3>Service Provider List</h3>
    <div class="page-header" style="margin-top: 10px; float: right; margin-bottom: 10px">
        <asp:Button Text="➕ Add Service Provider" CssClass="btn btn-edit" ID="btnAddWorker" runat="server"
            OnClick="btnAddWorker_Click" />
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
            OnRowCommand="UserGrid_RowCommand"
            OnPageIndexChanging="UserGrid_PageIndexChanging">

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
                            ID="btnEdit"
                            runat="server"
                            Text="Edit"
                            CssClass="btn btn-edit"
                            CommandName="EditUser"
                            CommandArgument='<%# Eval("SP_ID") %>'
                            CausesValidation="false" />

                        <asp:Button
                            ID="btnRemove"
                            runat="server"
                            Text="Remove"
                            CssClass="btn btn-delete"
                            CommandName="Delete"
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
