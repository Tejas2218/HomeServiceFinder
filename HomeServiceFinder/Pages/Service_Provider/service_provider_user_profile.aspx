<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_user_profile.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-card {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            max-width: 900px;
        }

            .profile-card h3 {
                margin-bottom: 20px;
                border-left: 4px solid var(--primary);
                padding-left: 10px;
            }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .profile-item label {
            display: block;
            font-size: 13px;
            color: var(--secondary);
            margin-bottom: 6px;
            font-weight: 600;
        }

        .profile-value {
            display: block;
            padding: 10px 12px;
            background: #f9fafb;
            border-radius: 6px;
            border: 1px solid #e5e7eb;
            font-size: 14px;
        }

        .profile-item.full-width {
            grid-column: span 2;
        }

        .profile-actions {
            margin-top: 25px;
            text-align: right;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-item.full-width {
                grid-column: span 1;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="margin-bottom: 20px;">Service Provider Profile</h2>

    <div class="profile-card">

        <div class="profile-grid">

            <!-- USER INFO -->
            <div class="profile-item">
                <label>Name</label>
                <asp:Label ID="User_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Email</label>
                <asp:Label ID="User_Email" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Contact Number</label>
                <asp:Label ID="User_Contact" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>State</label>
                <asp:Label ID="State_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>City</label>
                <asp:Label ID="City_Name" runat="server" CssClass="profile-value" />
            </div>

            <div class="profile-item">
                <label>Address</label>
                <asp:Label ID="User_Address" runat="server" CssClass="profile-value" />
            </div>

        </div>

        <!-- ACTION BUTTONS -->
        <div style="text-align: center; margin-top: 20px;">

            <asp:Button
                ID="btnBack"
                runat="server"
                Text="← Back"
                CssClass="btn btn-view"
                OnClick="btnBack_Click"/>
        </div>

    </div>
</asp:Content>
