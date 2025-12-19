using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Admin
{
    public partial class admin_dashboard : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserStateList();     // User State
                BindSP_StateList();      // Service Provider State
                LoadUserData();
                BindServiceList(null,null);
            }
        }

        // ================= USER STATE =================
        protected void BindUserStateList()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_State", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                StateList.DataSource = dr;
                StateList.DataTextField = "State_Name";
                StateList.DataValueField = "State_Name";
                StateList.DataBind();
            }
            StateList.Items.Insert(0, new ListItem("Select State", ""));
        }

        // ================= USER CITY =================
        protected void BindCityList(object sender, EventArgs e)
        {
            CityList.Items.Clear();
            CityList.Items.Insert(0, new ListItem("Select City", ""));

            if (string.IsNullOrEmpty(StateList.SelectedValue))
                return;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_City", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                CityList.DataSource = dr;
                CityList.DataTextField = "City_Name";
                CityList.DataValueField = "City_Name";
                CityList.DataBind();
            }
            CityList.Items.Insert(0, new ListItem("Select City", ""));
        }

        // ================= LOAD USERS =================
        protected void LoadUserData()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                UserGrid.DataSource = dt;
                UserGrid.DataBind();
            }
        }

        // ================= ADD USER =================
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (User_Password_TextBox.Text != User_Confirm_Password_TextBox.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Passwords do not match');", true);
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("Insert_User_Details", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@User_Name", User_Name_TextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@User_EmailID", User_Email_TextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@User_Address", User_Address_TextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@User_ContactNo", User_Contact_TextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@User_Password", User_Password_TextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@User_Role", "User");
                    cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedValue);
                    cmd.Parameters.AddWithValue("@City_Name", CityList.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClearUserForm();
                LoadUserData();
            }
            catch (SqlException)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Email already exists');", true);
            }
        }

        // ================= GRID COMMAND =================
        protected void UserGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int userId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditUser")
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("Display_User_Details_ByID", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@User_ID", userId);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        User_Name_TextBox.Text = dr["User_Name"].ToString();
                        User_Email_TextBox.Text = dr["User_EmailID"].ToString();
                        User_Address_TextBox.Text = dr["User_Address"].ToString();
                        User_Contact_TextBox.Text = dr["User_ContactNo"].ToString();
                        User_Password_TextBox.Text = dr["User_Password"].ToString();

                        StateList.SelectedValue = dr["State_Name"].ToString();
                        BindCityList(null, null);
                        CityList.SelectedValue = dr["City_Name"].ToString();
                    }
                }

                ViewState["UserId"] = userId;
                SignupButton.Visible = false;
                btnUpdate.Visible = true;
                btnCancel.Visible = true;
            }

            if (e.CommandName == "Delete")
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("Delete_User_Details", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@User_ID", userId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                LoadUserData();
            }
        }

        // ================= UPDATE =================
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ViewState["UserId"] == null) return;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Update_User_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@User_ID", ViewState["UserId"]);
                cmd.Parameters.AddWithValue("@User_Name", User_Name_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_EmailID", User_Email_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_Address", User_Address_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_ContactNo", User_Contact_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_Password", User_Password_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedValue);
                cmd.Parameters.AddWithValue("@City_Name", CityList.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            ClearUserForm();
            LoadUserData();
        }

        // ================= CANCEL =================
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearUserForm();
        }

        // ================= CLEAR FORM =================
        private void ClearUserForm()
        {
            User_Name_TextBox.Text = "";
            User_Email_TextBox.Text = "";
            User_Address_TextBox.Text = "";
            User_Contact_TextBox.Text = "";
            User_Password_TextBox.Text = "";
            User_Confirm_Password_TextBox.Text = "";

            StateList.SelectedIndex = 0;
            CityList.Items.Clear();
            CityList.Items.Insert(0, new ListItem("Select City", ""));

            SignupButton.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
            ViewState["UserId"] = null;
        }

        // ================= SP STATE =================
        protected void BindSP_StateList()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_State", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                SP_StateList.DataSource = dr;
                SP_StateList.DataTextField = "State_Name";
                SP_StateList.DataValueField = "State_Name";
                SP_StateList.DataBind();
            }
            SP_StateList.Items.Insert(0, new ListItem("Select State", ""));
        }

        // ================= SP CITY =================
        protected void SP_BindCityList(object sender, EventArgs e)
        {
            SP_CityList.Items.Clear();
            SP_CityList.Items.Insert(0, new ListItem("Select City", ""));

            if (string.IsNullOrEmpty(SP_StateList.SelectedValue))
                return;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_City", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State_Name", SP_StateList.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                SP_CityList.DataSource = dr;
                SP_CityList.DataTextField = "City_Name";
                SP_CityList.DataValueField = "City_Name";
                SP_CityList.DataBind();
            }
        }

        // ================= SP EQUIPMENT =================

        protected void BindServiceList(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("View_ServiceMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ServiceList.DataSource = dr;
                ServiceList.DataTextField = "Service_Name";
                ServiceList.DataValueField = "Service_Name";
                ServiceList.DataBind();
            }
            ServiceList.Items.Insert(0, new ListItem("Select Service", ""));
        }
    }
}
