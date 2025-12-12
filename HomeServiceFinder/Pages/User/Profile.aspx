<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HomeServiceFinder.Pages.User.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <style>
        body {
            background: #f4f6fb;
            font-family: Arial;
        }

        .profile-box {
            width: 430px;
            margin: 40px auto;
            padding: 40px;
            background: #fff;
            border-radius: 25px;
            box-shadow: 0 5px 30px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 35px;
            font-size: 32px;
            font-weight: bold;
        }

        .row {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 22px;
            padding-bottom: 8px;
            border-bottom: 2px solid #e5e5e5;
        }

        .row i {
            font-size: 20px;
            color: black;
            width: 25px;
        }

        .row input,
        .row textarea,
        .row select {
            flex: 1;
            border: none;
            outline: none;
            font-size: 16px;
            padding: 10px 5px;
        }

        .row select {
            background: none;
        }

        .update-btn {
            width: 100%;
            background: #0066ff;
            color: #fff;
            padding: 14px;
            font-size: 18px;
            border: none;
            border-radius: 12px;
            margin-top: 10px;
            cursor: pointer;
        }

        .update-btn:hover {
            background: #0053d6;
        }

        .eye {
            position: absolute;
            right: 0px;
            cursor: pointer;
            color: black;
        }

        .password-wrap {
            position: relative;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="profile-box">

            <h2>My Profile</h2>

            <!-- Name -->
            <div class="row">
                <i class="fa fa-user"></i>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter Your Name"></asp:TextBox>
            </div>

            <!-- Email -->
            <div class="row">
                <i class="fa fa-envelope"></i>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Your Email"></asp:TextBox>
            </div>

            <!-- Phone -->
            <div class="row">
                <i class="fa fa-phone"></i>
                <asp:TextBox ID="txtContact" runat="server" placeholder="Enter Phone Number"></asp:TextBox>
            </div>

            <!-- Address -->
            <div class="row">
                <i class="fa fa-map"></i>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" placeholder="Enter Address"></asp:TextBox>
            </div>

            <!-- City -->
            <div class="row">
                <i class="fa fa-location-dot"></i>
                <asp:DropDownList ID="ddlCity" runat="server" >
                    <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Password -->
            <div class="row password-wrap">
                <i class="fa fa-lock"></i>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="Enter Password"></asp:TextBox>
                <i class="fa fa-eye eye" onclick="togglePassword()"></i>
            </div>

            <!-- Update Button -->
            <asp:Button ID="btnUpdate" runat="server" CssClass="update-btn" Text="Update Profile" />
            <div>
                <asp:Label ID="lblMessage" Text="" runat="server" ForeColor="red"/>
            </div>
        </div>

    </form>

    <script>
        function togglePassword() {
            var txt = document.getElementById("<%= txtPassword.ClientID %>");
            var eye = event.target;

            if (txt.type === "password") {
                txt.type = "text";
                eye.classList.remove("fa-eye");
                eye.classList.add("fa-eye-slash");
            } else {
                txt.type = "password";
                eye.classList.remove("fa-eye-slash");
                eye.classList.add("fa-eye");
            }
        }
    </script>

</body>
</html>
