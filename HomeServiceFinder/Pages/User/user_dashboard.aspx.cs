using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.User
{
    public partial class user_dashboard : System.Web.UI.Page
    {
        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    // User is logged in
                    phProfileBtn.Visible = true;
                    phSignupBtn.Visible = false;
                }
                else
                {
                    // User not logged in
                    phProfileBtn.Visible = false;
                    phSignupBtn.Visible = true;
                }

                //LoadProviders();
            }
        }

        //private void LoadProviders()
        //{
        //    cmd.CommandText = "SELECT TOP 3 * FROM ServiceProviderDetails";
        //    connection();
        //    open_connection();
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();

        //    sda.Fill(ds);

        //    gvProviders.DataSource = ds;
        //    gvProviders.DataBind();
        //}



        public void connection()
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
        }
        public void open_connection()
        {
            cmd.Connection.Open();
        }
        public void close_connection()
        {
            cmd.Connection.Close();
        }
        public void dispose_connection()
        {
            cmd.Connection.Dispose();
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/User/Profile.aspx");
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/login_signup/User_SignUp.aspx");
        }
    }
}