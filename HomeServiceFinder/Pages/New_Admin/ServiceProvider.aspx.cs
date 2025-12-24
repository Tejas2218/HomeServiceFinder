using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class ServiceProvider : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Display_Worker_Details", con);
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
                SqlCommand cmd = new SqlCommand("Count_ServiceProvider", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                lblTotalProviders.Text = cmd.ExecuteScalar().ToString();
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
                Response.Redirect("~/Pages/New_Admin/EditUserDetails.aspx?id=" + userId);
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