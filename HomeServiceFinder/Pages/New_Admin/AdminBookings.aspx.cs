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
                btnAll_Click(null,null);
                btnAll.CssClass = "filter-btn active";
                btnPending.CssClass = "filter-btn";
                btnCompleted.CssClass = "filter-btn";
                btnUserDecline.CssClass = "filter-btn";
                btnWorkerDecline.CssClass = "filter-btn";
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

            }
        }
        
        void LoadBookingData(string sp)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(sp, con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                BookingGrid.DataSource = dt;
                BookingGrid.DataBind();
            }
        }
        protected string GetStatusClass(string status)
        {
            status = status.Trim();

            if (status == "Accepted")
                return "status-badge approved";
            else if (status == "Declined")
                return "status-badge rejected";
            else if (status == "Pending")
                return "status-badge pending";
            else if (status == "Cancelled")
                return "status-badge cancelled";
            else if (status == "Completed")
                return "status-badge completed";
            else
                return "status-badge pending";

        }

        protected void UserGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BookingGrid.PageIndex = e.NewPageIndex;
            btnPending_Click(null,null);
        }

        protected void UserGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "ViewUser")
            {
                int bookingID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/Pages/New_Admin/ViewBooking.aspx?id=" + bookingID);
            }
        }

        protected void btnAll_Click(object sender, EventArgs e)

        {
            LoadBookingData("Display_All_Booking");
            btnAll.CssClass = "filter-btn active";
            btnPending.CssClass = "filter-btn";
            btnCompleted.CssClass = "filter-btn";
            btnUserDecline.CssClass = "filter-btn";
            btnWorkerDecline.CssClass = "filter-btn";
            btnAccepted.CssClass = "filter-btn";
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            LoadBookingData("Display_Pending_Booking");
            btnAccepted.CssClass = "filter-btn";
            btnAll.CssClass = "filter-btn";
            btnPending.CssClass = "filter-btn active";
            btnCompleted.CssClass = "filter-btn";
            btnUserDecline.CssClass = "filter-btn";
            btnWorkerDecline.CssClass = "filter-btn";
        }

        protected void btnAccepted_Click(object sender, EventArgs e)
        {
            LoadBookingData("Display_Pending_Booking");
            btnAccepted.CssClass = "filter-btn";
            btnAll.CssClass = "filter-btn";
            btnPending.CssClass = "filter-btn";
            btnCompleted.CssClass = "filter-btn";
            btnUserDecline.CssClass = "filter-btn";
            btnWorkerDecline.CssClass = "filter-btn";
            btnAccepted.CssClass = "filter-btn active";
        }

        protected void btnCompleted_Click(object sender, EventArgs e)
        {
            btnAccepted.CssClass = "filter-btn";
            LoadBookingData("Display_Completed_Booking");
            btnAll.CssClass = "filter-btn";
            btnPending.CssClass = "filter-btn";
            btnCompleted.CssClass = "filter-btn active";
            btnUserDecline.CssClass = "filter-btn";
            btnWorkerDecline.CssClass = "filter-btn";
        }

        protected void btnUserDecline_Click(object sender, EventArgs e)
        {
            LoadBookingData("Display_User_Cancel_Booking");
            btnAll.CssClass = "filter-btn";
            btnPending.CssClass = "filter-btn";
            btnCompleted.CssClass = "filter-btn";
            btnUserDecline.CssClass = "filter-btn active";
            btnWorkerDecline.CssClass = "filter-btn";
            btnAccepted.CssClass = "filter-btn";
        }

        protected void btnWorkerDecline_Click(object sender, EventArgs e)
        {
            LoadBookingData("Display_Worker_Decline_Booking");
            btnAll.CssClass = "filter-btn";
            btnPending.CssClass = "filter-btn";
            btnCompleted.CssClass = "filter-btn";
            btnUserDecline.CssClass = "filter-btn";
            btnWorkerDecline.CssClass = "filter-btn active";
        }
   

        protected void btnBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooking.aspx");
        }
    }
}