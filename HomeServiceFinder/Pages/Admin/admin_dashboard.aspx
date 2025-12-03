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
                <a onclick="showPanel('providerPanel')">Manage Providers</a>
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
                    <input class="input" placeholder="Name" /><br />
                    <br />
                    <input class="input" placeholder="Email" /><br />
                    <br />
                    <input class="input" placeholder="Mobile" /><br />
                    <br />
                    <button class="btn">Insert</button>
                    <button class="btn">Update</button>

                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Anuj</td>
                            <td>
                                <button class="btn btn-view">View</button>
                                <button class="btn">Edit</button>
                                <button class="btn btn-danger">Delete</button>
                            </td>
                        </tr>
                    </table>
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
