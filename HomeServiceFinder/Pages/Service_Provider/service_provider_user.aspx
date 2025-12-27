<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_user.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-bar">
        <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by name or email..."
            CssClass="form-control" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
    </div>

    <div class="customer-table-card">
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false"
            CssClass="table" GridLines="None" DataKeyNames="User_ID" EmptyDataText="No customers found">
            <Columns>
                <%-- Customer Column with Avatar --%>
                <asp:TemplateField HeaderText="Customer">
                    <ItemTemplate>
                        <div style="display: flex; align-items: center;">
                            <b><%# Eval("User_Name") %></b>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

                <%-- Simple Text Columns --%>
                <asp:BoundField DataField="User_EmailID" HeaderText="Email" />
                <asp:BoundField DataField="User_ContactNo" HeaderText="Contact" />

                <%-- Action Column --%>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDetails" runat="server" CssClass="btn-view"
                            OnClick="btnDetails_Click"
                            CommandArgument='<%# Eval("User_ID") %>'>Details</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
