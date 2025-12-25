using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class ViewServiceProviderDetails : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                int userId = Convert.ToInt32(Request.QueryString["id"]);
                ViewState["UserId"] = userId;
                LoadUserData(userId);
            }
        }

        private void LoadUserData(int userId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_Worker_Details_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SP_ID", userId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // USER DETAILS
                    User_Name.Text = dr["User_Name"].ToString();
                    User_Email.Text = dr["User_EmailID"].ToString();
                    User_Contact.Text = dr["User_ContactNo"].ToString();
                    User_Role.Text = dr["User_Role"].ToString();
                    User_Address.Text = dr["User_Address"].ToString();

                    // LOCATION
                    State_Name.Text = dr["State_Name"].ToString();
                    City_Name.Text = dr["City_Name"].ToString();

                    // SERVICE PROVIDER DETAILS
                    Service_Name.Text = dr["Service_Name"].ToString();
                    Equipment_Name.Text = dr["Equipment_Name"].ToString();
                    SP_Age.Text = dr["SP_Age"].ToString();
                    SP_Experience.Text = dr["SP_Experience"].ToString();
                    SP_MinimumPrice.Text = dr["SP_MinimumPrice"].ToString();
                    SP_AverageRating.Text = dr["SP_AverageRating"] == DBNull.Value ? "N/A" : dr["SP_AverageRating"].ToString();
                    SP_Status.Text = dr["SP_Status"].ToString();
                    SP_ShopAddress.Text = dr["SP_ShopAddress"].ToString();

                    // BOOKINGS SUMMARY
                    
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(ViewState["UserId"]);
            Response.Redirect("~/Pages/New_Admin/EditUserDetails.aspx?id=" + userId);
        }
    }
}
