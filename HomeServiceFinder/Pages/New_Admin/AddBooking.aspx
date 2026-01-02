<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="AddBooking.aspx.cs"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.AddBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- PAGE LEVEL CSS (SAME PATTERN AS SERVICE PROVIDER) -->


    <h2 style="margin-bottom: 20px;">Add Booking</h2>

    <div class="profile-card">

        <div class="profile-grid">

            <!-- BOOKING INFO -->
            <div class="section-title full-width">
                Booking Information
            </div>

            <!-- USER -->
            <div class="profile-item full-width" style="width: 48%">
                <label>User</label>
                <div class="input-row">
                    <asp:DropDownList ID="ddlUser" runat="server" CssClass="textbox">
                        <asp:ListItem Text="Select User" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="ddlUser"
                    InitialValue=""
                    ErrorMessage="Select a user"
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- SERVICE  -->
            <div class="profile-item">
                <label>Service </label>
                <div class="input-row">
                    <asp:DropDownList ID="ddlService" runat="server" CssClass="textbox">
                        <asp:ListItem Text="Select Service" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="ddlServiceProvider"
                    InitialValue=""
                    ErrorMessage="Select a service "
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- SERVICE PROVIDER -->
            <div class="profile-item">
                <label>Service Provider</label>
                <div class="input-row">
                    <asp:DropDownList ID="ddlServiceProvider" runat="server" CssClass="textbox">
                        <asp:ListItem Text="Select Service Provider" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="ddlServiceProvider"
                    InitialValue=""
                    ErrorMessage="Select a service provider"
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- DATE -->
            <div class="profile-item">
                <label>Service Date</label>
                <asp:TextBox ID="txtServiceDate"
                    runat="server"
                    TextMode="Date"
                    CssClass="profile-value" />
                <asp:RequiredFieldValidator ControlToValidate="txtServiceDate"
                    ErrorMessage="Select service date"
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- TIME -->
            <div class="profile-item">
                <label>Service Time</label>
                <asp:TextBox ID="txtServiceTime"
                    runat="server"
                    TextMode="Time"
                    CssClass="profile-value" />
                <asp:RequiredFieldValidator ControlToValidate="txtServiceTime"
                    ErrorMessage="Select service time"
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- ADDRESS -->
            <div class="profile-item full-width">
                <label>Service Address</label>
                <asp:TextBox ID="txtServiceAddress"
                    runat="server"
                    CssClass="profile-value"
                    TextMode="MultiLine"
                    Rows="3" />
                <asp:RequiredFieldValidator ControlToValidate="txtServiceAddress"
                    ErrorMessage="Service address is required"
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- STATUS -->
            <div class="profile-item">
                <label>Booking Status</label>
                <div class="input-row">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="textbox">
                        <asp:ListItem Text="Pending" />
                        <asp:ListItem Text="Approved" />
                        <asp:ListItem Text="Rejected" />
                    </asp:DropDownList>
                </div>
            </div>

        </div>

        <!-- ACTION BUTTONS -->
        <div style="text-align: center; margin-top: 20px;">
            <asp:Button ID="btnBack"
                runat="server"
                Text="← Back"
                CssClass="btn btn-view"
                OnClientClick="history.back(); return false;" />

            <asp:Button ID="btnAddBooking"
                runat="server"
                Text="Add Booking"
                CssClass="btn btn-edit"
                OnClick="btnAddBooking_Click" />
        </div>

    </div>

</asp:Content>
