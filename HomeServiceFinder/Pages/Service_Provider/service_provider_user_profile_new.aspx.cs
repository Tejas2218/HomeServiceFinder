using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    
    public partial class WebForm3 : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null && Request.QueryString["id"] != null)
                //if (Request.QueryString["id"] != null)
                {
                    int userID = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["UserID"] = userID;
                    LoadUserData();
                    LoadBookingHistory();
                    string previousPageName = Path.GetFileName(Request.UrlReferrer.AbsolutePath).ToLower();
                    if (previousPageName.Contains("service_provider_booking.aspx"))
                    {
                        hfwebpage.Value = previousPageName;
                    }
                    else if (previousPageName.Contains("service_provider_Booking_History.aspx"))
                    {
                        hfwebpage.Value = previousPageName;
                    }
                    else
                    {
                        hfwebpage.Value = previousPageName;
                    }
                }
                else
                {
                    Response.Redirect("~/Pages/login_signup/loginPage.aspx");
                }
                    //Console.WriteLine(Session["UserID"] + Request.QueryString["id"]);
                    
            }
        }

        protected void LoadUserData()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Details_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt32(ViewState["UserID"]));

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
        protected void LoadBookingHistory()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                // Assuming you have a stored procedure for history
                SqlCommand cmd = new SqlCommand("User_Booking_Records", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID",Convert.ToInt32(ViewState["UserID"]));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvBookingHistory.DataSource = dt;
                gvBookingHistory.DataBind();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(hfwebpage.Value);
        }
    }
}