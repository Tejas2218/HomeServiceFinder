<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="HomeServiceFinder.Pages.Admin.admin_dashboard" %>

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
            width: 240px;
            background: linear-gradient(180deg, #1a237e, #283593);
            padding-top: 20px;
            position: sticky;
            top: 0;
            height: 100vh;
        }

            .sidebar a {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 14px 20px;
                color: #e8eaf6;
                text-decoration: none;
                font-size: 15px;
                border-left: 4px solid transparent;
                transition: 0.3s;
            }

                .sidebar a:hover {
                    background: rgba(255,255,255,0.12);
                }

                .sidebar a.active {
                    background: rgba(255,255,255,0.18);
                    border-left: 4px solid #ffeb3b;
                    font-weight: 600;
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

        /* Standard panel spacing */
        #addCity {
            padding: 20px;
        }

        /* Card Layout */
        .card {
            background: #fff;
            padding: 20px;
            margin-bottom: 25px;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.08);
            width: 450px;
        }

        .card-title {
            margin-bottom: 20px;
            font-size: 22px;
            color: #1a237e;
            font-weight: 600;
        }

        /* Input Fields */
        .input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            margin-top: 5px;
            box-sizing: border-box;
        }

            .input:focus {
                outline: none;
                border-color: #3949ab;
                box-shadow: 0 0 4px rgba(57,73,171,0.4);
            }

        /* Form Group */
        .form-group {
            margin-bottom: 18px;
        }

        /* Buttons */
        .btn-primary {
            background: #3949ab;
            color: #fff;
            padding: 10px 18px;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

            .btn-primary:hover {
                background: #303f9f;
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
                <a onclick="showPanel('ServiceProviderPanel')">Manage Service Providers</a>
                <a onclick="showPanel('bookingPanel')">Booking History</a>
                <a onclick="showPanel('addCity')">Add State/City</a>
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
                        <asp:RequiredFieldValidator
                            ControlToValidate="User_Name_TextBox"
                            runat="server"
                            ForeColor="Red"
                            CssClass="error"
                            ErrorMessage="Name is required"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>

                    <!-- Email -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Email_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                        <asp:TextBox ID="User_Email_TextBox" runat="server" CssClass="textbox"
                            TextMode="Email" placeholder="Enter Your Email">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="User_Email_TextBox"
                            runat="server"
                            ForeColor="Red"
                            CssClass="error"
                            ErrorMessage="Email is required"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            ControlToValidate="User_Email_TextBox"
                            runat="server"
                            CssClass="error"
                            ForeColor="Red"
                            ErrorMessage="Enter a valid email"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            Display="Dynamic">
                        </asp:RegularExpressionValidator>

                    </div>

                    <!-- State -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

                        <asp:DropDownList ID="StateList" runat="server" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="BindCityList">
                            <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ControlToValidate="StateList"
                            InitialValue=""
                            runat="server"
                            CssClass="error"
                            ForeColor="Red"
                            ErrorMessage="Select a state"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>


                    </div>

                    <!-- City -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

                        <asp:DropDownList ID="CityList" runat="server" CssClass="textbox">
                            <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ControlToValidate="CityList"
                            InitialValue=""
                            runat="server"
                            ForeColor="Red"
                            CssClass="error"
                            ErrorMessage="Select a city"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>

                    <!-- Address -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Address_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
                        <asp:TextBox ID="User_Address_TextBox" runat="server" CssClass="textbox"
                            placeholder="Enter Your Address">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="User_Address_TextBox"
                            runat="server"
                            CssClass="error"
                            ForeColor="Red"
                            ErrorMessage="Address is required"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>

                    <!-- Phone -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Contact_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
                        <asp:TextBox ID="User_Contact_TextBox" runat="server" CssClass="textbox"
                            TextMode="Phone" MaxLength="10" placeholder="Enter Phone Number">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="User_Contact_TextBox"
                            runat="server"
                            CssClass="error"
                            ForeColor="Red"
                            ErrorMessage="Phone number is required"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            runat="server"
                            CssClass="error"
                            ControlToValidate="User_Contact_TextBox"
                            Display="Dynamic"
                            ForeColor="Red"
                            ErrorMessage="Enter a valid 10-digit phone number"
                            ValidationExpression="^[0-9]{10}$">
                        </asp:RegularExpressionValidator>

                    </div>

                    <!-- Password -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Password_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                        <asp:TextBox ID="User_Password_TextBox" runat="server" CssClass="textbox"
                            TextMode="SingleLine" placeholder="Enter Password">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="User_Password_TextBox"
                            runat="server"
                            CssClass="error"
                            ForeColor="Red"
                            ErrorMessage="Password is required"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>

                    <!-- Confirm Password -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" ID="User_Confirm_Password_Icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Password_Icon.png" />
                        <asp:TextBox ID="User_Confirm_Password_TextBox" runat="server" CssClass="textbox"
                            TextMode="SingleLine" placeholder="Re-enter Password">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="User_Confirm_Password_TextBox"
                            runat="server"
                            CssClass="error"
                            ForeColor="Red"
                            ErrorMessage="Confirm Password is required"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                        <asp:CompareValidator
                            runat="server"
                            CssClass="error"
                            ForeColor="Red"
                            ControlToCompare="User_Password_TextBox"
                            ControlToValidate="User_Confirm_Password_TextBox"
                            ErrorMessage="Passwords do not match"
                            Display="Dynamic">
                        </asp:CompareValidator>


                    </div>

                    <!-- Button -->
                    <asp:Button ID="SignupButton" runat="server" CssClass="btn" Text="Add User" OnClick="btnSignup_Click" CausesValidation="true" />
                    <asp:Button CssClass="btn" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
                    <asp:Button CssClass="btn" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />


                    <asp:GridView
                        ID="UserGrid"
                        runat="server"
                        DataKeyNames="User_ID"
                        EmptyDataText="No Data Found"
                        AllowPaging="true"
                        AutoGenerateColumns="false"
                        OnRowCommand="UserGrid_RowCommand">
                        <Columns>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("User_Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("User_EmailID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("User_Address")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="lblState" runat="server" Text='<%#Eval("State_Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City_Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Contact No.">
                                <ItemTemplate>
                                    <asp:Label ID="lblContactNo" runat="server" Text='<%#Eval("User_ContactNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Created Date Time">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDateTime" runat="server" Text='<%#Eval("Created_DateTime")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Modified Date Time">
                                <ItemTemplate>
                                    <asp:Label ID="lblModifiedDateTime" runat="server" Text='<%#Eval("Modified_DateTime")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button CssClass="btn" ID="btnEdit" runat="server" Text="Edit" CommandName="EditUser" CommandArgument='<%#Eval("User_ID") %>' CausesValidation="false" />
                                    <asp:Button CssClass="btn btn-danger" ID="btnRemove" runat="server" Text="Remove" CommandName="Delete" CommandArgument='<%# Eval("User_ID") %>' CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>

                <!-- ================= SERVICE PROVIDER PANEL ================= -->
                <div id="ServiceProviderPanel" class="panel hidden">
                    <div class="title">Manage Service Provider</div>

                    <!-- Name -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Name_Icon.png" />
                        <asp:TextBox ID="SP_Name_TextBox" runat="server" CssClass="textbox"
                            placeholder="Enter Name"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ControlToValidate="SP_Name_TextBox"
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Name is required"
                            Display="Dynamic" />
                    </div>

                    <!-- Email -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Email_Icon.png" />
                        <asp:TextBox ID="SP_Email_TextBox" runat="server" CssClass="textbox"
                            TextMode="Email" placeholder="Enter Email"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ControlToValidate="SP_Email_TextBox"
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Email is required"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator
                            ControlToValidate="SP_Email_TextBox"
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Invalid email format"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            Display="Dynamic" />
                    </div>

                    <!-- State -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

                        <asp:DropDownList ID="SP_StateList" runat="server"
                            CssClass="textbox"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="SP_BindCityList">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator
                            ControlToValidate="SP_StateList"
                            InitialValue=""
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Select state"
                            Display="Dynamic" />
                    </div>

                    <!-- City -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />

                        <asp:DropDownList ID="SP_CityList" runat="server" CssClass="textbox">
                            <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator
                            ControlToValidate="SP_CityList"
                            InitialValue=""
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Select city"
                            Display="Dynamic" />
                    </div>

                    <!-- Address -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Address_Icon.png" />
                        <asp:TextBox ID="SP_Address_TextBox" runat="server"
                            CssClass="textbox"
                            placeholder="Enter Address"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ControlToValidate="SP_Address_TextBox"
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Address required"
                            Display="Dynamic" />
                    </div>

                    <!-- Contact -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/User_Contact_Icon.png" />
                        <asp:TextBox ID="SP_Contact_TextBox" runat="server"
                            CssClass="textbox"
                            MaxLength="10"
                            placeholder="Enter Phone"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ControlToValidate="SP_Contact_TextBox"
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Contact required"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator
                            ControlToValidate="SP_Contact_TextBox"
                            ValidationExpression="^[0-9]{10}$"
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Enter valid 10 digit number"
                            Display="Dynamic" />
                    </div>

                    <!-- Service Type -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/Worker_Services_Icon.png" />
                        <asp:DropDownList ID="ServiceList" runat="server"
                            CssClass="textbox"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="BindServiceList">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator
                            ControlToValidate="ServiceList"
                            InitialValue=""
                            runat="server"
                            ForeColor="Red"
                            ErrorMessage="Select Service"
                            Display="Dynamic" />
                    </div>

                    <!-- Equipment -->
                    <div class="input-row">
                        <asp:Image CssClass="input-icon" runat="server"
                            ImageUrl="~/Assests/Login_SignUp/Worker_Services_Icon.png" />
                        <asp:DropDownList ID="SP_Equipment_DropDown" runat="server"
                            CssClass="textbox">
                            <asp:ListItem Text="Select Equipment" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Experience -->
                    <div class="input-row">
                        <asp:TextBox ID="SP_Experience_TextBox" runat="server"
                            CssClass="textbox"
                            TextMode="Number"
                            placeholder="Experience (Years)"></asp:TextBox>
                    </div>

                    <!-- Price -->
                    <div class="input-row">
                        <asp:TextBox ID="SP_MinPrice_TextBox" runat="server"
                            CssClass="textbox"
                            TextMode="Number"
                            placeholder="Minimum Price"></asp:TextBox>
                    </div>

                    <!-- Buttons -->
                    <asp:Button ID="SP_Add_Button" runat="server"
                        CssClass="btn"
                        Text="Add Service Provider" />
                </div>


                <!--State/City-->
                <div id="addCity" class="panel hidden">

                    <div class="card">
                        <h2 class="card-title">Add State</h2>

                        <div class="form-group">
                            <label>State Name</label>
                            <asp:TextBox ID="StateNameTextBox" runat="server" CssClass="input" placeholder="Enter State"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnAddState" runat="server" Text="Add State" CssClass="btn-primary" />
                    </div>

                    <div class="card">
                        <h2 class="card-title">Add City</h2>

                        <div class="form-group">
                            <label>Select State</label>
                            <asp:DropDownList ID="StateDropForCity" runat="server" CssClass="input"></asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>City Name</label>
                            <asp:TextBox ID="CityNameTextBox" runat="server" CssClass="input" placeholder="Enter City"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnAddCity" runat="server" Text="Add City" CssClass="btn-primary" />
                    </div>

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
