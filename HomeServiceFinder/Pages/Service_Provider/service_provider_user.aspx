<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_user.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-bar">
        <input type="text" placeholder="Search by name or email..." />
        <button type="button" class="btn-view" style="background: var(--dark); color: white;">Search</button>
    </div>

    <div class="customer-table-card">
        <table>
            <thead>
                <tr>
                    <th>Customer</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Last Service</th>
                    <th>Total Spent</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div style="display: flex; align-items: center;">
                            <div class="avatar-circle">RP</div>
                            <b>Rahul Patel</b>
                        </div>
                    </td>
                    <td>rahul@gmail.com</td>
                    <td>+91 9876543210</td>
                    <td>12 Dec 2025</td>
                    <td>₹ 1,200</td>
                    <td><a href="WebForm3.aspx" class="btn-view">Details</a></td>
                </tr>
                <tr>
                    <td>
                        <div style="display: flex; align-items: center;">
                            <div class="avatar-circle">AS</div>
                            <b>Anita Shah</b>
                        </div>
                    </td>
                    <td>anita@gmail.com</td>
                    <td>+91 9123456780</td>
                    <td>10 Nov 2025</td>
                    <td>₹ 450</td>
                    <td><a href="service_provider_user_profile_new.aspx" class="btn-view">Details</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
