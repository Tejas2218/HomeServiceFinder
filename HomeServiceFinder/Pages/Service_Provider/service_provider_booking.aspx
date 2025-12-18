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
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Service</th>
                            <th>Schedule</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#BK-1021</td>
                            <td>Rahul Patel</td>
                            <td>Plumbing Repair</td>
                            <td>18 Dec | 10:30 AM</td>
                            <td><span class="badge bg-pending">Pending</span></td>
                            <td>
                                <button class="btn btn-primary">Accept</button>
                                <button class="btn btn-danger">Decline</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

</asp:Content>
