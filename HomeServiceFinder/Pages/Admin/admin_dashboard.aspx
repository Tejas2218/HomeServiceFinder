<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="HomeServiceFinder.Pages.Admin.admin_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #f3f4f6;
        }

        .header {
            background: #0d47a1;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .profile-area {
            position: relative;
        }

        .profile-btn {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

            .profile-btn img {
                width: 38px;
                height: 38px;
                border-radius: 50%;
                border: 2px solid white;
                margin-right: 8px;
            }

        .profile-menu {
            position: absolute;
            right: 0;
            top: 50px;
            background: white;
            width: 150px;
            display: none;
            box-shadow: 0 3px 10px rgba(0,0,0,.3);
            border-radius: 5px;
        }

            .profile-menu a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: black;
                border-bottom: 1px solid #ddd;
                cursor: pointer
            }

                .profile-menu a:hover {
                    background: #2196f3;
                    color: white;
                }

        .container {
            display: flex;
            height: calc(100vh - 60px);
        }

        .sidebar {
            width: 230px;
            background: #1a237e;
            padding-top: 20px;
        }

            .sidebar a {
                display: block;
                padding: 12px;
                color: white;
                text-decoration: none;
                cursor: pointer
            }

                .sidebar a:hover {
                    background: #3949ab;
                }

        .content {
            flex: 1;
            padding: 20px;
            overflow: auto;
        }

        .panel {
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        .title {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .input {
            width: 250px;
            padding: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px
        }

        th {
            background: #2196f3;
            color: white
        }

        .btn {
            padding: 6px 12px;
            background: #0d47a1;
            color: white;
            border: none;
            cursor: pointer
        }

            .btn:hover {
                background: #1565c0
            }

        .btn-danger {
            background: red
        }

            .btn-danger:hover {
                background: darkred
            }

        .btn-view {
            background: green
        }

            .btn-view:hover {
                background: darkgreen
            }

        .hidden {
            display: none
        }

        /* LOGOUT MODAL */
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,.5);
            justify-content: center;
            align-items: center;
        }

        .input-row {
            display: flex;
            align-items: center;
            padding-bottom: 12px;
            margin-bottom: 20px;
            border-bottom: 1px solid #7aa7ff; /* Light blue underline */
            transition: 0.3s;
        }

            .input-row:focus-within {
                border-bottom: 2px solid #0066ff; /* Strong blue underline on focus */
            }

        .input-icon {
            width: 26px;
            height: 26px;
            margin-right: 10px;
            filter: hue-rotate(200deg); /* Makes icons blue-ish */
        }

        .modal-box {
            background: white;
            padding: 20px;
            width: 300px;
            border-radius: 8px;
            text-align: center;
        }

            .modal-box button {
                margin: 10px;
            }
    </style>

    <script>
        function hideAll() {
            document.querySelectorAll(".panel").forEach(x => x.classList.add("hidden"));
        }

        function showPanel(id) {
            hideAll();
            document.getElementById(id).classList.remove("hidden");
        }

        function toggleProfileMenu() {
            let m = document.getElementById("profileMenu");
            m.style.display = m.style.display === "block" ? "none" : "block";
        }

        function openProfile() {
            toggleProfileMenu();
            showPanel("profilePanel");
        }

        // LOGOUT POPUP
        function showLogoutPopup() {
            toggleProfileMenu();
            document.getElementById("logoutModal").style.display = "flex";
        }
        function closeLogoutPopup() {
            document.getElementById("logoutModal").style.display = "none";
        }
        function logout() {
            alert("Logged out successfully");
            closeLogoutPopup();
        }

        window.onclick = function (e) {
            if (!e.target.closest(".profile-area")) {
                document.getElementById("profileMenu").style.display = "none";
            }
        }
    </script>

</head>
<body>

    <form runat="server">

        <!-- HEADER -->
        <div class="header">
            Home Service Finder - Admin Dashboard

            <div class="profile-area">
                <div class="profile-btn" onclick="toggleProfileMenu()">
                    <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" />
                    <span>Admin</span>
                </div>
                <div class="profile-menu" id="profileMenu">
                    <a onclick="openProfile()">My Profile</a>
                    <a onclick="showLogoutPopup()">Logout</a>
                </div>
            </div>
        </div>

        <div class="container">

            <!-- SIDEBAR -->
            <div class="sidebar">
                <a onclick="showPanel('usersPanel')">Manage Users</a>
                <a onclick="showPanel('providerPanel')">Manage Service Providers</a>
                <a onclick="showPanel('bookingPanel')">Booking History</a>
            </div>

            <div class="content">

                <!-- PROFILE -->
                <div id="profilePanel" class="panel hidden">
                    <div class="title">Admin Profile</div>
                    <table>
                        <tr>
                            <td>Name</td>
                            <td>Anuj</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>Anuj@homeservicefinder.com</td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td>Anuj_admin</td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td>Administrator</td>
                        </tr>
                    </table>
                    <br />
                    <button class="btn">Edit Profile</button>
                </div>

                <!-- USERS -->
                <div id="usersPanel" class="panel">
                    <div class="title">Manage Users</div>
                    <!-- Name -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Name_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
                        <asp:TextBox ID="User_Name_TextBox" runat="server" CssClass="textbox"
                            placeholder="Enter Your Name">
                        </asp:TextBox>
                    </div>

                    <!-- Email -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                        <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox"
                            TextMode="Email" placeholder="Enter Your Email">
                        </asp:TextBox>
                    </div>

                    <!-- State -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

                        <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList">
                            <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- City -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

                        <asp:DropDownList ID="CityList" runat="server" CssClass="textbox">
                            <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Address -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Address_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
                        <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox"
                            placeholder="Enter Your Address">
                        </asp:TextBox>
                    </div>

                    <!-- Phone -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Contact_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
                        <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox"
                            TextMode="Phone" MaxLength="10" placeholder="Enter Phone Number">
                        </asp:TextBox>
                    </div>

                    <!-- Password -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Password_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                        <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox"
                            TextMode="Password" placeholder="Enter Password">
                        </asp:TextBox>
                    </div>

                    <!-- Confirm Password -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Confirm_Password_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                        <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                            TextMode="Password" placeholder="Re-enter Password">
                        </asp:TextBox>
                    </div>

                    <!-- Button -->
                    <asp:Button ID="SignupButton" runat="server" CssClass="btn" Text="Add User" OnClick="btnSignup_Click" />
                    <button class="btn">Update</button>

                    <asp:GridView
                        Colomn
                        ID="UserGrid" 
                        runat="server"
                        DataKeyNames="User_ID"
                        OnRowEditing="gvData_RowEditing"
                        OnRowCancelingEdit="gvData_RowCancelingEdit"
                        OnRowDeleting="gvData_RowDeleting"
                        OnRowUpdating="gvData_RowUpdating"
                        EmptyDataText="No Data Found"
                        AllowPaging="true"
                        AutoGenerateColumns="false"
                        >
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<%#Eval("User_ID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("User_Name")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("User_Name")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("User_EmailID")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("User_EmailID")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("User_Address")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("User_Address")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Contact No.">
                                <ItemTemplate>
                                    <asp:Label ID="lblContactNo" runat="server" Text='<%#Eval("User_ContactNo")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtContactNo" runat="server" Text='<%#Eval("User_ContactNo")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Password">
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='<%#Eval("User_Password")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPassword" runat="server" Text='<%#Eval("User_Password")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Role">
                                <ItemTemplate>
                                    <asp:Label ID="lblRole" runat="server" Text='<%#Eval("User_Role")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRole" runat="server" Text='<%#Eval("User_Role")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Created Date Time">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDateTime" runat="server" Text='<%#Eval("Created_DateTime")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCreatedDateTime" runat="server" Text='<%#Eval("Created_DateTime")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Modified Date Time">
                                <ItemTemplate>
                                    <asp:Label ID="lblModifiedDateTime" runat="server" Text='<%#Eval("Modified_DateTime")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtModifiedDateTime" runat="server" Text='<%#Eval("Modified_DateTime")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>

                <!-- PROVIDERS -->
                <div id="providerPanel" class="panel hidden">
                    <div class="title">Manage Providers</div>
                    <input class="input" placeholder="Company" /><br />
                    <br />
                    <input class="input" placeholder="Owner" /><br />
                    <br />
                    <button class="btn">Insert</button>
                    <button class="btn">Update</button>

                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Company</th>
                            <th>Owner</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>FixIt Pvt Ltd</td>
                            <td>Tejas</td>
                            <td>
                                <button class="btn btn-view">View</button>
                                <button class="btn">Edit</button>
                                <button class="btn btn-danger">Delete</button>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- BOOKINGS -->
                <div id="bookingPanel" class="panel hidden">
                    <div class="title">Booking History</div>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>Service</th>
                            <th>Status</th>
                        </tr>
                        <tr>
                            <td>101</td>
                            <td>Anuj</td>
                            <td>Electric</td>
                            <td>Completed</td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>

        <!-- LOGOUT POPUP -->
        <div class="modal" id="logoutModal">
            <div class="modal-box">
                <h3>Confirm Logout</h3>
                <p>Are you sure you want to logout?</p>
                <button class="btn" onclick="logout()">Yes</button>
                <button class="btn btn-danger" onclick="closeLogoutPopup()">Cancel</button>
            </div>
        </div>

    </form>
</body>
</html>
