using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    public partial class service_provider_booking : System.Web.UI.Page
    {
        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //loadData();
            if (!IsPostBack)
            {
                //pending_notification();
                if (Session["UserID"] != null)
                {
                    loadData("Accept");
                }
                else
                {
                    Response.Redirect("~/Pages/login_signup/loginPage.aspx");
                }
            }
        }

        protected void loadData(string status)
        {
            try
            {
                int s_id = Convert.ToInt32(Session["UserID"]);
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open(); // Open once for all commands

                    // 1. View Booking Details
                    using (SqlCommand cmd = new SqlCommand("View_Booking_Details", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt32(Session["UserID"]));
                        cmd.Parameters.AddWithValue("@Booking_Status", status);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvBookings.DataSource = dt;
                        gvBookings.DataBind();
                    }
                    //using (SqlCommand cmd = new SqlCommand("View_Booking_Details", con))
                    //{
                    //    cmd.CommandType = CommandType.StoredProcedure;
                    //    cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt32(Session["UserID"]));
                    //    cmd.Parameters.AddWithValue("@Booking_Status", "Upcomming");
                    //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    //    DataTable dt = new DataTable();
                    //    sda.Fill(dt);
                    //    gvUp_CommingBookings.DataSource = dt;
                    //    gvUp_CommingBookings.DataBind();
                    //}

                    // Move this AFTER the first block is totally done
                    pending_notification();

                    // 2. Total Booking
                    using (SqlCommand cmd = new SqlCommand("Total_Booking", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt32(Session["UserID"]));
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                                lblTotalBooking.Text = dr["Total"].ToString();
                            else
                                lblTotalBooking.Text = "0";
                        } // Reader closes here automatically
                    }

                    // 3. Avg Rating
                    using (SqlCommand cmd = new SqlCommand("Avg_Rating", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SP_ID", Convert.ToInt32(Session["UserID"]));
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                                lblAvgRating.Text = dr["SP_AverageRating"].ToString();
                            else
                                lblAvgRating.Text = "No Rating";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }

        protected void btnMoreInfo_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string UserID = btn.CommandArgument;
            Response.Redirect("service_provider_user_profile_new.aspx?id=" + UserID);
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int Booking_ID = Convert.ToInt32(btn.CommandArgument);
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        cmd.Parameters.AddWithValue("@Booking_Status", "Accepted");
                        int result = cmd.ExecuteNonQuery();
                        loadData("Pending");
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int Booking_ID = Convert.ToInt32(btn.CommandArgument);
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        cmd.Parameters.AddWithValue("@Booking_Status", "Declined");
                        int result = cmd.ExecuteNonQuery();
                        loadData("Pending");
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void btnFetchPending_Click(object sender, EventArgs e)
        {
            btnFetchPending.CssClass = "tab-btn active-tab";
            btnFetchAccepted.CssClass = "tab-btn";
            btnFetchAcceptedUpcomming.CssClass = "tab-btn";
            //String status = btnFetchPending.CommandName.ToString();
            loadData("Pending");
            //btnFetchPending.Text = "Pending";
        }
        protected void btnFetchAcceptedUpcomming_Click(object sender, EventArgs e)
        {
            btnFetchPending.CssClass = "tab-btn";
            btnFetchAccepted.CssClass = "tab-btn ";
            btnFetchAcceptedUpcomming.CssClass = "tab-btn active-tab";
            //String status = btnFetchPending.CommandName.ToString();
            loadData("Upcomming");
            //btnFetchPending.Text = "Pending";
        }

        protected void btnFetchAccepted_Click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            btnFetchAccepted.CssClass = "tab-btn active-tab";
            btnFetchPending.CssClass = "tab-btn";
            btnFetchAcceptedUpcomming.CssClass = "tab-btn";
            //String status = btnFetchAccepted.CommandName.ToString();
            loadData("Accept");
        }
        protected void pending_notification()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Notification_Pending_Booking", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt32(Session["UserID"]));
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            btnFetchPending.Text = "Pending" + "<span id=\"spanNotification\" runat=\"server\" class=\"notification-badge\">" + dr["noti"].ToString() + "</span>";
                            lblPendingTask.Text = dr["noti"].ToString();
                        }
                        else
                        {
                            btnFetchPending.Text = "Data not found";
                            lblPendingTask.Text = "Data not found";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {

            string enteredCode = txtVerifyCode.Text.Trim();
            string bookingId = hfSelectedBookingId.Value;

            // Replace with your DB logic
            //string actualCode = GetCodeFromDatabase(bookingId);

            if (enteredCode == "")//actualCode
            {
                //UpdateBookingStatus(bookingId, "Completed");

                // Show Success SweetAlert
                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                    "Swal.fire('Success', 'Booking marked as completed!', 'success');", true);

                // Re-bind your GridView here
            }
            else
            {
                // Show Error SweetAlert
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    "Swal.fire('Error', 'Invalid verification code. Please try again.', 'error');", true);
            }




            //Button btn = (Button)sender;
            //int Booking_ID = Convert.ToInt32(btn.CommandArgument);
            //try
            //{
            //    using (SqlConnection con = new SqlConnection(constr))
            //    {
            //        using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
            //        {
            //            con.Open();
            //            cmd.CommandType = CommandType.StoredProcedure;
            //            cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
            //            cmd.Parameters.AddWithValue("@Booking_Status", "Completed");
            //            int result = cmd.ExecuteNonQuery();
            //            loadData("Pending");
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    // For debugging: This will show you if the SQL fails
            //    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            //}

        }


        //protected void btnFetchAcceptedUpcomming_Click(object sender, EventArgs e)
        //{
        //    //LinkButton btn = (LinkButton)sender;
        //    btnFetchAcceptedUpcomming.CssClass = "tab-btn active-tab";
        //    btnFetchPendingUpcomming.CssClass = "tab-btn";
        //    //String status = btnFetchAccepted.CommandName.ToString();
        //    loadData("Accept");
        //}

        //protected void btnFetchPendingUpcomming_Click(object sender, EventArgs e)
        //{
        //    btnFetchPendingUpcomming.CssClass = "tab-btn active-tab";
        //    btnFetchAcceptedUpcomming.CssClass = "tab-btn";
        //    //String status = btnFetchPending.CommandName.ToString();
        //    loadData("Pending");
        //    //btnFetchPending.Text = "Pending";
        //}
    }
}