<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="AdminBookings.aspx.cs"
    Inherits="HomeServiceFinder.Pages.New_Admin.AdminBookings"
    MasterPageFile="~/MasterPage/AdminMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- PAGE TITLE -->
    <h2 style="margin-bottom:20px;">Bookings</h2>

    <!-- STATS -->
    <div class="stats">
        <div class="stat-card">
            <h3>Total Bookings</h3>
            <h2>120</h2>
        </div>

        <div class="stat-card">
            <h3>Today’s Bookings</h3>
            <h2>8</h2>
        </div>

        <div class="stat-card">
            <h3>Pending</h3>
            <h2>25</h2>
        </div>
    </div>

    <!-- TABLE -->
    <div class="table-box">
        <h3>Booking List</h3>
        <br />

        <table class="admin-table">
            <tr>
                <th>#</th>
                <th>User</th>
                <th>Service</th>
                <th>Provider</th>
                <th>Date & Time</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <tr>
                <td>1</td>
                <td>Rahul Patel</td>
                <td>Plumber</td>
                <td>Ramesh</td>
                <td>18 Dec 2025 | 10:30 AM</td>
                <td><span class="badge pending">Pending</span></td>
                <td>
                    <a class="btn btn-view" href="UserProfile.aspx">View</a>
                    <a class="btn btn-edit" href="#">Update</a>
                    <a class="btn btn-delete" href="#">Cancel</a>
                </td>
            </tr>

            <tr>
                <td>2</td>
                <td>Anita Shah</td>
                <td>Electrician</td>
                <td>Suresh</td>
                <td>17 Dec 2025 | 04:00 PM</td>
                <td><span class="badge completed">Completed</span></td>
                <td>
                    <a class="btn btn-view" href="UserProfile.aspx">View</a>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
