<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="EditUserDetails.aspx.cs"
    MasterPageFile="~/MasterPage/AdminMaster.Master"
    Inherits="HomeServiceFinder.Pages.New_Admin.EditUserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin-bottom: 20px;">Edit User Details</h2>

    <div class="settings-box">
        <h3>User Information</h3>

        <label>Name</label>
        <asp:TextBox
            ID="User_Name_TextBox"
            runat="server"
            CssClass="input"
            Placeholder="User Name" />

        <label>Email</label>
        <asp:TextBox
            ID="User_Email_TextBox"
            runat="server"
            CssClass="input"
            TextMode="Email"
            Placeholder="user@email.com" />

        <label>Address</label>
        <asp:TextBox
            ID="User_Address_TextBox"
            runat="server"
            CssClass="input"
            TextMode="MultiLine"
            Rows="3" />

        <label>Contact Number</label>
        <asp:TextBox
            ID="User_Contact_TextBox"
            runat="server"
            CssClass="input"
            MaxLength="15" />

        <label>State</label>
        <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList">
            <asp:ListItem Text="Select State" Value=""></asp:ListItem>
        </asp:DropDownList>


        <label>City</label>
        <asp:DropDownList ID="CityList" runat="server" CssClass="textbox">
            <asp:ListItem Text="Select City" Value=""></asp:ListItem>
        </asp:DropDownList><br />

        <label>Password</label>
        <asp:TextBox
            ID="User_Password_TextBox"
            runat="server"
            CssClass="input" />

        <center>
            <div>
                <asp:Button
                    ID="btnBack"
                    runat="server"
                    Text="← Back"
                    CssClass="btn-view"
                    OnClientClick="history.back(); return false;" />

                <asp:Button
                    ID="btnUpdateProfile"
                    runat="server"
                    Text="Save Changes"
                    CssClass="btn-save"
                    OnClick="btnUpdateProfile_Click" />
            </div>

        </center>

    </div>

</asp:Content>
