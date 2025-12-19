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
    public partial class AdminDashbord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //CountUser();
                //CountWorker();
                //CountTodayBooking();
                //CountTotalBooking();
            }
        }
        void CountUser()
        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using(SqlConnection con=new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_User", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                lblUserCount.Text = cmd.ExecuteScalar().ToString();
            }
        }
        void CountWorker()
        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_Worker", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                lblWorkerCount.Text = cmd.ExecuteScalar().ToString();
            }
        }
        void CountTodayBooking()
        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_Today_Booking", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                lblTodayBookingCount.Text = cmd.ExecuteScalar().ToString();
            }
        }
        void CountTotalBooking()
        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_Booking", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                lblTotalBookingCount.Text = cmd.ExecuteScalar().ToString();
            }
        }
    }
}