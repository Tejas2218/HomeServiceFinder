using HomeServiceFinder.Pages.New_Admin;
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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["UserID"] != null && Request.QueryString["id"] != null)
                if (Request.QueryString["id"] != null)
                {
                    int userId = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["UserId"] = userId;
                    LoadUserData();
                }
                Console.WriteLine(Session["UserID"]+Request.QueryString["id"]);
            }
        }
        protected void LoadUserData()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Details_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt32(ViewState["UserId"]));

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // USER DETAILS
                    User_Name.Text = dr["User_Name"].ToString();
                    User_Email.Text = dr["User_EmailID"].ToString();
                    User_Contact.Text = dr["User_ContactNo"].ToString();
                    User_Address.Text = dr["User_Address"].ToString();

                    // LOCATION
                    State_Name.Text = dr["State_Name"].ToString();
                    City_Name.Text = dr["City_Name"].ToString();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("service_provider_booking.aspx");
        }
    }
}