<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/service_provider_master.Master" AutoEventWireup="true" CodeBehind="service_provider_profile.aspx.cs" Inherits="HomeServiceFinder.Pages.Service_Provider.service_provider_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-grid {
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 25px;
        }
        .profile-upload {
            text-align: center;
            padding: 20px;
        }
        .profile-img-container {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: #eee;
            margin: 0 auto 15px;
            border: 3px solid var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .profile-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--secondary);
            font-size: 14px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: inherit;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .save-banner {
            background: var(--dark);
            color: white;
            padding: 15px 25px;
            border-radius: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="stats-grid">
        <div class="stat-card" style="border-left-color: var(--success);">
            <h3>Profile Status</h3>
            <h2 style="color: var(--success);">Verified</h2>
        </div>
        <div class="stat-card">
            <h3>Member Since</h3>
            <h2>Jan 2025</h2>
        </div>
        <div class="stat-card">
            <h3>Completed Jobs</h3>
            <h2>115</h2>
        </div>
    </div>

    <div class="profile-grid">
        <div class="section-box">
            <div class="profile-upload">
                <div class="profile-img-container">
                    <span style="font-size: 50px; color: #ccc;">👤</span>
                </div>
                <button type="button" class="btn btn-outline" style="width: 100%;">Change Photo</button>
                <hr style="margin: 20px 0; border: 0; border-top: 1px solid #eee;" />
                <div class="info-group" style="text-align: left;">
                    <label style="font-weight: bold; font-size: 13px; color: var(--secondary);">AVAILABILITY</label>
                    <div style="margin-top: 5px;">
                        <span class="badge bg-active">Currently Active</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-box">
            <div class="section-header">
                <h3>Personal & Business Information</h3>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" class="form-control" value="Suresh Prajapati" />
                </div>
                <div class="form-group">
                    <label>Service Category</label>
                    <select class="form-control">
                        <option>Electrician</option>
                        <option>Plumber</option>
                        <option>Carpenter</option>
                        <option>Cleaning</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Email ID</label>
                    <input type="email" class="form-control" value="suresh.electric@gmail.com" />
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" class="form-control" value="+91 98980 12345" />
                </div>
            </div>

            <div class="form-group">
                <label>Business Address</label>
                <textarea class="form-control" rows="3">Shop No. 12, Orbit Mall, Rajkot, Gujarat</textarea>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Base Visit Charges (₹)</label>
                    <input type="number" class="form-control" value="250" />
                </div>
                <div class="form-group">
                    <label>Experience (Years)</label>
                    <input type="number" class="form-control" value="8" />
                </div>
            </div>

            <div class="save-banner">
                <span>Keep your profile updated to get more bookings!</span>
                <button type="button" class="btn btn-primary">Update Profile</button>
            </div>
        </div>
    </div>
</asp:Content>
