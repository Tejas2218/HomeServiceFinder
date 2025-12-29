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
    public partial class AdminBookings : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CountAllBooking();
                
            }
        }
        protected void CountAllBooking()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("TotalAll_Booking", con);
                cmd.CommandType = CommandType.StoredProcedure;
                lblTotalBookings.Text = cmd.ExecuteScalar().ToString();

                SqlCommand cmdd = new SqlCommand("Today_Booking", con);
                cmdd.CommandType = CommandType.StoredProcedure;
                lblTodayBookings.Text = cmdd.ExecuteScalar().ToString();

                SqlCommand cmde = new SqlCommand("Pending_Booking", con);
                cmde.CommandType = CommandType.StoredProcedure;
                lblPendingBookings.Text = cmde.ExecuteScalar().ToString();
            }
        }

       
    }
}