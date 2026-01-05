using HomeServiceFinder.Pages.New_Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
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
            string randomCode = GenerateRandomCode();
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
                        con.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("Fetch_User_Details", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                string userEmail = dr["User_EmailID"].ToString();
                                string spEmail = dr["SP_EmailID"].ToString();
                                string spName = dr["SP_Name"].ToString();
                                string timeSlot = dr["TimeSlot"].ToString();
                                string visitDate = Convert.ToDateTime(dr["VisitingDate"]).ToString("dd MMM yyyy");
                                SendAcceptEmailToUser(userEmail, visitDate, timeSlot,spName, spEmail,randomCode);
                            }
                            else
                                lblAvgRating.Text = "No Rating";
                        }
                        con.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("Insert_Booking_Code", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        cmd.Parameters.AddWithValue("@Booking_Code", randomCode);
                        int result = cmd.ExecuteNonQuery();
                        loadData("Pending");
                        con.Close();
                    }


                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        public string GenerateRandomCode(int length = 6)
        {
            const string chars = "0123456789";
            Random random = new Random();

            return new string(Enumerable
                .Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)])
                .ToArray());
        }
        private void SendAcceptEmailToUser(string email, string date, string time, string spName, string spEmail,string randomCode)
        {
            MailMessage mail = new MailMessage
            {
                From = new MailAddress("homeservicefinder999@gmail.com"),
                Subject = "Booking Accepted by Service Provider",
                IsBodyHtml = true,
                Body = $@"
                    <h3>Booking Accepted</h3>
                    <p>Your Booking with <b>{spName}</b> has been booked.</p>
                    <p><b>Date:</b> {date}</p>
                    <p><b>Time:</b> {time}</p>
                    <p>Please provide this code <h1>{randomCode}</h1> only to your authorized service provider. For your security, do not share this with anyone else.</p>"

            };
            mail.To.Add(email);
            new SmtpClient().Send(mail);
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            // Use the value from the hidden field instead of CommandArgument
            if (string.IsNullOrEmpty(hfSelectedBookingId.Value)) return;

            int Booking_ID = Convert.ToInt32(hfSelectedBookingId.Value);
            string reason = Convert.ToString(hfDeclineReason.Value);

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Insert_Booking_DeclineReason", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        cmd.Parameters.AddWithValue("@Booking_Decline_Reason", reason);
                        int result = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    // Note: Update your Stored Procedure to accept @Decline_Reason if you want to save it
                    using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        cmd.Parameters.AddWithValue("@Booking_Status", "Declined");

                        // If your SP supports reason, uncomment the line below:
                        // cmd.Parameters.AddWithValue("@Decline_Reason", reason);

                        int result = cmd.ExecuteNonQuery();
                        // Clear fields
                        hfDeclineReason.Value = "";
                        hfSelectedBookingId.Value = "";

                        // Show success and reload
                        ScriptManager.RegisterStartupScript(this, GetType(), "declined",
                            "Swal.fire('Declined', 'The booking has been declined.', 'info');", true);
                        btnFetchAccepted.CssClass = "tab-btn active-tab";
                        btnFetchPending.CssClass = "tab-btn";
                        btnFetchAcceptedUpcomming.CssClass = "tab-btn";
                        loadData("Accept");
                        con.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("Fetch_User_Details", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read()) { 
                                string userEmail = dr["User_EmailID"].ToString();
                                string spEmail = dr["SP_EmailID"].ToString();
                                string spName = dr["SP_Name"].ToString();
                                string timeSlot = dr["TimeSlot"].ToString();
                                string visitDate = Convert.ToDateTime(dr["VisitingDate"]).ToString("dd MMM yyyy");
                                SendDeclineEmailToUser(userEmail,visitDate,timeSlot,reason,spName,spEmail);
                            }
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
        private void SendDeclineEmailToUser(string email, string date, string time, string reason,string spName,string spEmail)
        {
            MailMessage mail = new MailMessage
            {
                From = new MailAddress("homeservicefinder999@gmail.com"),
                Subject = "Booking Declined - HomeServiceFinder",
                IsBodyHtml = true,
                Body = $@"
                    <h3>Booking Declined</h3>
                    <p>Your booking with <b>{spName}</b> has been Declined.</p>
                    <p><b>Date:</b> {date}</p>
                    <p><b>Time:</b> {time}</p>
                    <p><b>Reason:</b> {reason}</p>"
            };
            mail.To.Add(email);
            new SmtpClient().Send(mail);
        }

        
    




        //protected void btnDecline_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    int Booking_ID = Convert.ToInt32(btn.CommandArgument);
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(constr))
        //        {
        //            using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
        //            {
        //                con.Open();
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
        //                cmd.Parameters.AddWithValue("@Booking_Status", "Declined");
        //                int result = cmd.ExecuteNonQuery();
        //                loadData("Pending");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // For debugging: This will show you if the SQL fails
        //        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
        //    }
        //}

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
            int bookingId = Convert.ToInt32(hfSelectedBookingId.Value);

            // Logic to fetch the 6-digit code from your DB
            string actualCode = GetCodeFromDatabase(bookingId);

            if (enteredCode == actualCode && enteredCode.Length == 6)
            {
                // Execute Update SQL: UPDATE Bookings SET Status='Completed' WHERE ID=@ID
                UpdateBookingStatus(bookingId, "Completed");

                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                    "Swal.fire('Success', 'Service marked as Completed!', 'success');", true);

                // Refresh your GridView data here
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    "Swal.fire('Invalid Code', 'The verification code does not match.', 'error');", true);
            }
        }

        protected string GetCodeFromDatabase(int booking_id)
        {
            string code = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Fetch_BookingCode", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", booking_id);
                        //cmd.Parameters.AddWithValue("@Booking_Status", "Completed");
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            code = dr["Booking_Code"].ToString();
                        }
                        else
                        {
                            code = "Not Found";
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            return code;
        }
        protected void UpdateBookingStatus(int booking_id, string status)
        {
            //int Booking_ID = Convert.ToInt32(btn.CommandArgument);
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", booking_id);
                        cmd.Parameters.AddWithValue("@Booking_Status", "Completed");
                        int result = cmd.ExecuteNonQuery();
                        btnFetchAccepted.CssClass = "tab-btn active-tab";
                        btnFetchPending.CssClass = "tab-btn";
                        btnFetchAcceptedUpcomming.CssClass = "tab-btn";
                        loadData("Accept");
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
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