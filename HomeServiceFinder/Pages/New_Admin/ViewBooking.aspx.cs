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
    public partial class ViewBooking : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int bookingID=Convert.ToInt32(Request.QueryString["id"]);
                BindData(bookingID);
            }
        }
        void BindData(int bookingID)
        {
            using(SqlConnection con=new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_All_Booking_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Booking_ID", bookingID);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    User_Name.Text = dr["User_Name"].ToString();
                    User_EmailID.Text = dr["User_EmailID"].ToString();
                    User_ContactNo.Text = dr["User_ContactNo"].ToString();
                    User_Address.Text = dr["User_Address"].ToString();
                    User_State_Name.Text = dr["User_State_Name"].ToString();
                    User_City_Name.Text = dr["User_City_Name"].ToString();

                    Worker_Name.Text = dr["Worker_Name"].ToString();
                    Worker_EmailID.Text = dr["Worker_EmailID"].ToString();
                    Worker_ContactNo.Text = dr["Worker_ContactNo"].ToString();
                    Worker_State_Name.Text = dr["Worker_State_Name"].ToString();
                    Worker_City_Name.Text = dr["Worker_City_Name"].ToString();

                    SP_Age.Text = dr["SP_Age"].ToString();
                    SP_Experience.Text = dr["SP_Experience"].ToString();
                    SP_MinimumPrice.Text = dr["SP_MinimumPrice"].ToString();
                    SP_AverageRating.Text = dr["SP_AverageRating"].ToString();
                    SP_Status.Text = dr["SP_Status"].ToString();
                    SP_ShopAddress.Text = dr["SP_ShopAddress"].ToString();

                    Booking_Status.Text = dr["Booking_Status"].ToString();
                    Booking_DateTime.Text = dr["Booking_DateTime"].ToString();
                    Booking_Rating.Text = dr["Booking_Rating"].ToString();
                    Booking_Decline_Reason.Text = dr["Booking_Decline_Reason"]==DBNull.Value? "-": dr["Booking_Decline_Reason"].ToString();
                    Service_Name.Text = dr["Service_Name"].ToString();
                }

            }
        }
    }
}