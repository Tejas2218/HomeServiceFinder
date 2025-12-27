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
    public partial class user_booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;

        private void LoadBookings()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                using (SqlCommand cmd = new SqlCommand("", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptBookings.DataSource = dt;
                        rptBookings.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No service providers found.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "No user data found." + ex;
            }
        }
    }
}