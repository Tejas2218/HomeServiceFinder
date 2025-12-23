<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="ServiceProvider.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.ServiceProvider"
    MasterPageFile="~/MasterPage/AdminMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- PAGE TITLE ONLY -->
    <h2 style="margin-bottom:20px;">Service Providers</h2>

    <!-- TOTAL PROVIDERS -->
    <div class="stat-card">
        <h3>Total Service Providers</h3>
        <h2>
            <asp:Label ID="lblTotalProviders" runat="server" Text="0"></asp:Label>
        </h2>
    </div>

    <!-- HEADER -->
    <div class="page-header">
        <h3>Service Provider List</h3>
        <a href="../login_signup/Worker_SignUp.aspx" class="btn-add">
            ➕ Add Service Provider
        </a>
    </div>

    <!-- TABLE -->
    <div class="table-box">
        <table class="admin-table">
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Service</th>
                <th>Mobile</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <tr>
                <td>1</td>
                <td>Ramesh Kumar</td>
                <td>Plumber</td>
                <td>9876543210</td>
                <td><span class="badge active">Active</span></td>
                <td>
                    <a class="btn btn-view" href="UserProfile.aspx">View</a>
                    <a class="btn btn-edit" href="UserProfile.aspx">Edit</a>
                    <a class="btn btn-delete">Delete</a>
                </td>
            </tr>

            <tr>
                <td>2</td>
                <td>Suresh Patel</td>
                <td>Electrician</td>
                <td>9123456789</td>
                <td><span class="badge inactive">Inactive</span></td>
                <td>
                    <a class="btn btn-view" href="UserProfile.aspx">View</a>
                    <a class="btn btn-edit" href="UserProfile.aspx">Edit</a>
                    <a class="btn btn-delete">Delete</a>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
