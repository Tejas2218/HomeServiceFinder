<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a href="service_provider_user.aspx" class="btn-back">← Back to Dashboard</a>

    <div class="profile-container">
        <div class="card">
            <div class="user-info-header">
                <div class="user-avatar">RP</div>
                <h2>Rahul Patel</h2>
                <span class="status-pill completed">Verified Customer</span>
            </div>

            <div class="info-group">
                <span class="info-label">Email Address</span>
                <span class="info-value">rahul@gmail.com</span>
            </div>

            <div class="info-group">
                <span class="info-label">Mobile Number</span>
                <span class="info-value">+91 9876543210</span>
            </div>

            <div class="info-group">
                <span class="info-label">Address</span>
                <span class="info-value">123, Silver Heights, Near Akshar Chowk, Rajkot, Gujarat.</span>
            </div>
        </div>

        <div class="card">
            <h3>Booking History (with you)</h3>
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Service</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>12 Dec 2025</td>
                        <td>Pipe Leakage Repair</td>
                        <td>₹ 450</td>
                        <td><span class="status-pill completed">Completed</span></td>
                    </tr>
                    <tr>
                        <td>05 Nov 2025</td>
                        <td>Tap Installation</td>
                        <td>₹ 200</td>
                        <td><span class="status-pill completed">Completed</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
