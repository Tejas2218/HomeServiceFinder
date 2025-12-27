using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    public partial class service_provider_profile : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData(7);
                // Ensure Service Provider is logged in
                //if (Session["SP_ID"] != null)
                //{
                //    LoadProfileData(Convert.ToInt32(Session["SP_ID"]));
                //}
                //else
                //{
                //    Response.Redirect("~/Login.aspx");
                //}
            }
        }
        protected void LoadProfileData(int spId)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Display_Worker_Details_ByID", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SP_ID", spId);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtName.Text = dr["User_Name"].ToString();
                        txtEmail.Text = dr["User_EmailID"].ToString();
                        txtPhone.Text = dr["User_ContactNo"].ToString();
                        txtAddress.Text = dr["User_Address"].ToString();
                        txtCharges.Text = dr["SP_MinimumPrice"].ToString();
                        txtExp.Text = dr["SP_Experience"].ToString();
                        //ddlCategory.SelectedValue = dr["Category"].ToString();
                        //litMemberSince.Text = Convert.ToDateTime(dr["JoinDate"]).ToString("MMM yyyy");
                        //litCompletedJobs.Text = dr["Jobs"].ToString();
                        //chkActive.Checked = Convert.ToBoolean(dr["IsActive"]);
                    }
                }
            }
        }
    }
}