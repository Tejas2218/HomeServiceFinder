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
    public partial class AddBooking : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUser();
                BindService();
                BindServiceProvider();
            }
        }

        void BindUser()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Name", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlUser.DataSource = dr;
                ddlUser.DataTextField = "User_Name";
                ddlUser.DataValueField = "User_ID";
                ddlUser.DataBind();
            }
            ddlUser.Items.Insert(0, new ListItem("Select User", ""));
        }

        void BindService()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_Service", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlService.DataSource = dr;
                ddlService.DataTextField = "Service_Name";
                ddlService.DataValueField = "Service_ID";
                ddlService.DataBind();
            }
            ddlService.Items.Insert(0, new ListItem("Select Service", ""));
        }

        void BindServiceProvider()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Bind_Name_ServiceProvider", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Service_Name", ddlServiceProvider.Text);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlServiceProvider.DataSource = dr;
                ddlServiceProvider.DataTextField = "User_Name";
                ddlServiceProvider.DataValueField = "User_ID";
                ddlServiceProvider.DataBind();
            }
            ddlServiceProvider.Items.Insert(0, new ListItem("Select Service Provider", ""));
        }

        protected void btnAddBooking_Click(object sender, EventArgs e)
        {

        }
    }
}