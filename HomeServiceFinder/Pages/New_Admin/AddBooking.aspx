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
                    <asp:DropDownList
                        ID="ddlService"
                        runat="server"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlService_SelectedIndexChanged"
                        CssClass="textbox">
                        <asp:ListItem Text="Select Service" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="ddlService"
                    InitialValue=""
                    ErrorMessage="Select a service "
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- Equipment  -->
            <div class="profile-item">
                <label>Equipment </label>
                <div class="input-row">
                    <asp:DropDownList
                        ID="ddlEquipment"
                        runat="server"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlEquipment_SelectedIndexChanged"
                        CssClass="textbox">
                        <asp:ListItem Text="Select Service" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ControlToValidate="ddlEquipment"
                    InitialValue=""
                    ErrorMessage="Select a Eequipment"
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
            </div>

            <!-- SERVICE PROVIDER -->
            <div class="profile-item full-width" style="width: 48%">
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
                <asp:DropDownList ID="ddlServiceTime" runat="server" CssClass="textbox">
                    <asp:ListItem Text="Select Time Slot" Value=""></asp:ListItem>
                    <asp:ListItem Text="09:00 A.M. to 11:00 A.M." Value="09:00 A.M. to 11:00 A.M."></asp:ListItem>
                    <asp:ListItem Text="11:00 A.M. to 01:00 P.M." Value="11:00 A.M. to 01:00 P.M."></asp:ListItem>
                    <asp:ListItem Text="01:00 P.M. to 03:00 P.M." Value="01:00 P.M. to 03:00 P.M."></asp:ListItem>
                    <asp:ListItem Text="03:00 P.M. to 05:00 P.M." Value="03:00 P.M. to 05:00 P.M."></asp:ListItem>
                    <asp:ListItem Text="05:00 P.M. to 07:00 P.M." Value="05:00 P.M. to 07:00 P.M."></asp:ListItem>
                    <asp:ListItem Text="07:00 P.M. to 09:00 P.M." Value="07:00 P.M. to 09:00 P.M."></asp:ListItem>

                </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="ddlServiceTime"
                    ErrorMessage="Select service time"
                    CssClass="error"
                    Display="Dynamic"
                    runat="server" />
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
