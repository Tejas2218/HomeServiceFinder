using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    BindCustomerGrid(null);
                }
                else
                {
                    Response.Redirect("~/Pages/login_signup/loginPage.aspx");
                }
                
            }

        }


        private void BindCustomerGrid(string search)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Get_Unique_Customers_By_SP", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.AddWithValue("@SP_ID", 7);
                    if(search!=null || search!="")
                    {
                        cmd.Parameters.AddWithValue("@search",search);
                    }
                    cmd.Parameters.AddWithValue("@SP_ID", Convert.ToInt32(Session["UserID"]));
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    gvCustomers.DataSource = dt;
                    gvCustomers.DataBind();
                }
            }
        }

        // Logic to navigate to the profile page with the ID
        protected void btnDetails_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string userId = btn.CommandArgument;
            Response.Redirect("service_provider_user_profile_new.aspx?id=" + userId);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindCustomerGrid(txtSearch.Text.Trim());
        }
    }
}