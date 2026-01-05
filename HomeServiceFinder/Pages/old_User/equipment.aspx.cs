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
    public partial class equipment : System.Web.UI.Page
    {
        //rptEquipment
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Request.QueryString["sid"];
            int sid2 = Convert.ToInt32(sid);
            LoadEquipmentByID(sid2);
        }

        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;

        protected void LoadEquipmentByID(int sid)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand cmd = new SqlCommand("View_Equipment_ByID", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Service_ID", sid);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptEquipment.DataSource = dt;
                        rptEquipment.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No service providers found.";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}