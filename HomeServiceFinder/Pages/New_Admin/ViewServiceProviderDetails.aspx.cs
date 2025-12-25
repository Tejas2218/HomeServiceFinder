using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class ViewServiceProviderDetails : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int userId = Convert.ToInt32(Request.QueryString["id"]);
                    LoadUserData(userId);
                    // Use userId here
                }
            }
        }

        protected void LoadUserData(int userId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Details_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", userId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    User_Name_TextBox.Text = dr["User_Name"].ToString();
                    User_Email_TextBox.Text = dr["User_EmailID"].ToString();
                    User_Address_TextBox.Text = dr["User_Address"].ToString();
                    User_Contact_TextBox.Text = dr["User_ContactNo"].ToString();
                    State.Text = dr["State_Name"].ToString();
                    City.Text = dr["City_Name"].ToString();
                    User_Password_TextBox.Text = dr["User_Password"].ToString();
                }
            }
            ViewState["UserId"] = userId;
        }
    }
}