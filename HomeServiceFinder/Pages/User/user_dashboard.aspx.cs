using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

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
                if (Session["UserID"] != null && Session["UserRole"] != null)
                {
                    profile.Visible = true;
                    signin.Visible = false;
                }
                else
                {
                    profile.Visible = false;
                    signin.Visible = true;
                }
                LoadService();
                btnLogout.Visible = Session["UserID"] != null;
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Pages/login_signup/loginPage.aspx");
        }
        private void LoadService()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                using (SqlCommand cmd = new SqlCommand("View_ServiceMasterTop3", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptWorkers.DataSource = dt;
                        rptWorkers.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No services found.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/User/Profile.aspx");
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/login_signup/User_SignUp.aspx");
        }

        protected void btnMoreService_Click(object sender, EventArgs e)
        {
            Response.Redirect("service.aspx");
        }
    }
}