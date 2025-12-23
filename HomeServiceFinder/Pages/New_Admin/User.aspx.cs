using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class User : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CountUser();
                LoadUserData();
            }
        }

        // 🔹 LOAD USER GRID
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

        // 🔹 COUNT TOTAL USERS
        protected void CountUser()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_User", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                lblUserCount.Text = cmd.ExecuteScalar().ToString();
            }
        }

        // 🔹 PAGING (IMPORTANT)
        protected void UserGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UserGrid.PageIndex = e.NewPageIndex;
            LoadUserData();
        }

        // 🔹 EDIT / DELETE BUTTON HANDLER
        protected void UserGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUser")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("UserProfile.aspx?id=" + userId);
            }

            if (e.CommandName == "Delete")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                DeleteUser(userId);
                LoadUserData();
                CountUser();
            }
        }

        // 🔹 DELETE USER
        protected void DeleteUser(int userId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Delete_User_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", userId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
