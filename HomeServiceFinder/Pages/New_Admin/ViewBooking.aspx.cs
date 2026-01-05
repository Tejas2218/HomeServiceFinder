using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class ViewBooking : BasePage
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int bookingID = Convert.ToInt32(Request.QueryString["id"]);
                BindData(bookingID);
                ViewState["bookingID"] = bookingID;
                if (Booking_Status.Text == "Cancelled")
                {
                    btnCancelBooking.Visible = false;
                    btnDeclineBooking.Visible = false;
                    btnAcceptBooking.Visible = false;
                    btnCompletedBooking.Visible = false;
                    btnReBook.Visible = true;
                }
                else if (Booking_Status.Text == "Pending")
                {
                    btnCancelBooking.Visible = true;
                    btnDeclineBooking.Visible = true;
                    btnAcceptBooking.Visible = true;
                    btnCompletedBooking.Visible = false;
                    btnReBook.Visible = false;
                }
                else if (Booking_Status.Text == "Accepted")
                {
                    btnCancelBooking.Visible = true;
                    btnDeclineBooking.Visible = true;
                    btnAcceptBooking.Visible = false;
                    btnCompletedBooking.Visible = true;
                    btnReBook.Visible = false;
                }
                else if (Booking_Status.Text == "Declined")
                {
                    btnCancelBooking.Visible = false;
                    btnDeclineBooking.Visible = false;
                    btnAcceptBooking.Visible = false;
                    btnCompletedBooking.Visible = false;
                    btnReBook.Visible = false;
                }
                else if (Booking_Status.Text == "Completed")
                {
                    btnCancelBooking.Visible = false;
                    btnDeclineBooking.Visible = false;
                    btnAcceptBooking.Visible = false;
                    btnReBook.Visible = false;
                    btnCompletedBooking.Visible = false;
                }
            }
        }
        void BindData(int bookingID)
        {
            using (SqlConnection con = new SqlConnection(connString))
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
                    SP_ShopAddress.Text = dr["SP_ShopAddress"].ToString();

                    Booking_Status.Text = dr["Booking_Status"].ToString();
                    Booking_DateTime.Text = dr["Booking_DateTime"].ToString();
                    Visiting_Date.Text = dr["Visiting_Date"].ToString();
                    Booking_Rating.Text = dr["Booking_Rating"] == DBNull.Value ? "-" : dr["Booking_Rating"].ToString(); ;
                    Booking_Code.Text = dr["Booking_Code"].ToString();
                    Booking_Decline_Reason.Text = dr["Booking_Decline_Reason"] == DBNull.Value ? "-" : dr["Booking_Decline_Reason"].ToString();
                    Service_Name.Text = dr["Service_Name"].ToString();

                }

            }
        }

        void UpdateBookingStatus(string status)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Update_Booking_Status", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Booking_ID", (int)ViewState["bookingID"]);
                cmd.Parameters.AddWithValue("Booking_Status", status);

                con.Open();
                cmd.ExecuteNonQuery();
                BindData((int)ViewState["bookingID"]);
                SendEmailUser(User_Name.Text, User_EmailID.Text, Booking_Status.Text);
                SendEmailWorker(Worker_Name.Text, Worker_EmailID.Text, Booking_Status.Text);
                Response.Redirect("AdminBookings.aspx");
            }
        }

        void SendEmailUser(string name, string email, string status)
        {
            string subject = "User Account Status";
            string body = "";

            switch (status)
            {
                case "Accepted":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>✅ Your booking has been <b style='color:green;'>SUCCESSFULLY ACCEPTED</b>.</p>
                        <p>Our service provider will contact you shortly.</p>
                        <p>Thank you for choosing <b>Home Service Finder</b>.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Cancelled":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>❌ Your booking has been <b style='color:red;'>CANCELLED</b>.</p>
                        <p>If this was a mistake, you can re-book the service anytime.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Declined":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>⚠️ Unfortunately, your booking has been <b style='color:red;'>DECLINED</b> by the service provider.</p>
                        <p>You may try booking another provider.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Completed":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>🎉 Your booking has been <b style='color:green;'>COMPLETED</b> successfully.</p>
                        <p>We would love to hear your feedback.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Pending":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>⏳ Your booking is currently <b style='color:orange;'>PENDING</b>.</p>
                        <p>Please wait while the service provider reviews your request.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;
            }



            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("homeservicefinder999@gmail.com", "Home Service Finder");
            mail.To.Add(email);
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential(
                "homeservicefinder999@gmail.com",
                "cvquixtqamspxxjp"
            );
            smtp.EnableSsl = true;
            smtp.Send(mail);

        }

        void SendEmailWorker(string name, string email, string status)
        {
            string subject = "Service Provider Account Status";
            string body = "";

            switch (status)
            {
                case "Pending":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>📌 You have received a <b>new booking request</b>.</p>
                        <p>Please log in to your dashboard to <b>accept or decline</b> the booking.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Accepted":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>✅ You have <b style='color:green;'>ACCEPTED</b> a booking.</p>
                        <p>Please contact the customer and provide the service on time.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Declined":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>❌ You have <b style='color:red;'>DECLINED</b> a booking.</p>
                        <p>No further action is required.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Cancelled":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>⚠️ The booking has been <b style='color:red;'>CANCELLED</b> by the user.</p>
                        <p>You do not need to visit the location.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;

                case "Completed":
                    body = $@"
                        <p>Hello <b>{name}</b>,</p>
                        <p>🎉 The booking has been <b style='color:green;'>COMPLETED</b>.</p>
                        <p>Thank you for your service.</p>
                        <br/>
                        <p>Regards,<br/>Home Service Finder Team</p>";
                    break;
            }




            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("homeservicefinder999@gmail.com", "Home Service Finder");
            mail.To.Add(email);
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential(
                "homeservicefinder999@gmail.com",
                "cvquixtqamspxxjp"
            );
            smtp.EnableSsl = true;
            smtp.Send(mail);

        }

        protected void btnReBook_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Update_Booking_Status", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Booking_ID", (int)ViewState["bookingID"]);
                cmd.Parameters.AddWithValue("@Booking_Status", "Pending");
                cmd.Parameters.AddWithValue("@Booking_Decline_Reason", "-");

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("AdminBookings.aspx");
        }

        protected void btnAcceptBooking_Click(object sender, EventArgs e)
        {
            UpdateBookingStatus("Accepted");
        }
        protected void btnCompletedBooking_Click(object sender, EventArgs e)
        {
            UpdateBookingStatus("Completed");
        }
        protected void btnStatusChange_Click(object sender, EventArgs e)
        {
            string status = hfBookingStatus.Value;
            string reason = hfDeclineReason.Value;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Update_Booking_Status", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Booking_ID", (int)ViewState["bookingID"]);
                cmd.Parameters.AddWithValue("@Booking_Status", status);
                cmd.Parameters.AddWithValue("@Booking_Decline_Reason", reason);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("AdminBookings.aspx");
        }
    }
}