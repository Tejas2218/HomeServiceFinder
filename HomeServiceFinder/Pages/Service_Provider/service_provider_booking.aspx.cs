using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    public partial class service_provider_booking : System.Web.UI.Page
    {
        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    loadData();
                }
                else
                {
                    //Response.Redirect("~/Pages/login_signup/loginPage.aspx");
                }
            }
        }

        protected void loadData()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.Connection.Open();

                cmd.CommandText ="";// sp name
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = cmd.ExecuteReader();
            }
        }

    }
}