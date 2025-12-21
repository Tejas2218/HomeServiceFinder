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

        void CountUser()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_User", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                lblUserCount.Text = cmd.ExecuteScalar().ToString();
            }
        }
    }
}