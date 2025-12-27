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
                btnAll_Click(null, null);
            }
        }

        //Load User Data
        void LoadWorkerData(string sp)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(sp, con);
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
            btnPending_Click(null,null);
        }

        // 🔹 EDIT / DELETE BUTTON HANDLER
        protected void UserGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "ViewUser")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/Pages/New_Admin/ViewServiceProviderDetails.aspx?id=" + userId);
            }
            if (e.CommandName == "EditUser")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/Pages/New_Admin/AddServiceProvider.aspx?id=" + userId);
            }

            if (e.CommandName == "DeleteUser")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                DeleteUser(userId);
                UserGrid.PageIndex = 0;
                btnAll_Click(null,null);
                CountUser();
            }
        }

        // 🔹 DELETE USER
        protected void DeleteUser(int userId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Delete_Worker_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SP_ID", userId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void btnAddWorker_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddServiceProvider.aspx");
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            LoadWorkerData("Display_Worker_Details_Pending");
            btnPending.CssClass = "filter-btn active";
            btnApproved.CssClass = "filter-btn";
            btnRejected.CssClass = "filter-btn";
            btnAll.CssClass = "filter-btn";
        }

        protected void btnApproved_Click(object sender, EventArgs e)
        {
            LoadWorkerData("Display_Worker_Details_Approved");
            btnPending.CssClass = "filter-btn";
            btnApproved.CssClass = "filter-btn active";
            btnRejected.CssClass = "filter-btn";
            btnAll.CssClass = "filter-btn";
        }

        protected void btnRejected_Click(object sender, EventArgs e)
        {
            LoadWorkerData("Display_Worker_Details_Decline");
            btnPending.CssClass = "filter-btn";
            btnApproved.CssClass = "filter-btn";
            btnRejected.CssClass = "filter-btn active";
            btnAll.CssClass = "filter-btn";
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            LoadWorkerData("Display_Worker_Details");
            btnPending.CssClass = "filter-btn";
            btnApproved.CssClass = "filter-btn";
            btnRejected.CssClass = "filter-btn";
            btnAll.CssClass = "filter-btn active";
        }
    }
}