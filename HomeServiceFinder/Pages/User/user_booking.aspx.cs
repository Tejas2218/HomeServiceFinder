using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.User
{
    public partial class user_booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblMessage2.Text = "Session UserID = " + (Session["UserID"] == null ? "NULL" : Session["UserID"].ToString());

            if (!IsPostBack)
            {
                LoadBookings(0);
            }
        }

        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;

        private int PageSize = 5;


        private void LoadBookings(int pageIndex = 0)
        {
            using (SqlConnection con = new SqlConnection(constr))
            using (SqlCommand cmd = new SqlCommand("View_User_Booking_Details", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", Session["UserID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dt.Columns.Add("StatusClass");
                dt.Columns.Add("ActionText");
                dt.Columns.Add("ActionClass");

                foreach (DataRow row in dt.Rows)
                {
                    string status = row["Booking_Status"].ToString();

                    if (status == "Pending")
                    {
                        row["StatusClass"] = "status-pending";
                        row["ActionText"] = "Cancel";
                        row["ActionClass"] = "btn btn-danger btn-sm";
                    }
                    else if (status == "Completed")
                    {
                        row["StatusClass"] = "status-completed";
                        row["ActionText"] = "Rate";
                        row["ActionClass"] = "btn btn-success btn-sm";
                    }
                    else
                    {
                        row["StatusClass"] = "status-cancelled";
                        row["ActionText"] = "-";
                        row["ActionClass"] = "btn btn-secondary btn-sm disabled";
                    }
                }

                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = PageSize;
                pds.CurrentPageIndex = pageIndex;

                rptBookings.DataSource = pds;
                rptBookings.DataBind();

                ViewState["TotalPages"] = pds.PageCount;
                ViewState["CurrentPage"] = pageIndex;
            }
        }

        protected void NextPage(object sender, EventArgs e)
        {
            int page = (int)ViewState["CurrentPage"];
            int total = (int)ViewState["TotalPages"];

            if (page < total - 1)
                LoadBookings(page + 1);
        }

        protected void PrevPage(object sender, EventArgs e)
        {
            int page = (int)ViewState["CurrentPage"];
            if (page > 0)
                LoadBookings(page - 1);
        }



        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);

            try
            {
                string userEmail = "", spEmail = "", spName = "", timeSlot = "", visitDate = "";

                using (SqlConnection con = new SqlConnection(constr))
                {
                    // 1️⃣ GET DETAILS
                    SqlCommand getCmd = new SqlCommand("Get_Booking_Cancel_Details", con);
                    getCmd.CommandType = CommandType.StoredProcedure;
                    getCmd.Parameters.AddWithValue("@Booking_ID", bookingId);

                    SqlDataAdapter da = new SqlDataAdapter(getCmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count == 0)
                    {
                        lblMessage2.Text = "Booking data not found.";
                        return;
                    }

                    userEmail = dt.Rows[0]["UserEmail"].ToString();
                    spEmail = dt.Rows[0]["ProviderEmail"].ToString();
                    spName = dt.Rows[0]["ProviderName"].ToString();
                    timeSlot = dt.Rows[0]["Time_Slot"].ToString();
                    visitDate = Convert.ToDateTime(dt.Rows[0]["Visiting_DateTime"]).ToString("dd MMM yyyy");

                    // 2️⃣ DELETE BOOKING
                    SqlCommand delCmd = new SqlCommand("Delete_Booking_Details", con);
                    delCmd.CommandType = CommandType.StoredProcedure;
                    delCmd.Parameters.AddWithValue("@Booking_ID", bookingId);

                    con.Open();
                    delCmd.ExecuteNonQuery();
                    con.Close();
                }

                // 3️⃣ SEND EMAILS
                SendCancelEmailToUser(userEmail, visitDate, timeSlot, spName);
                SendCancelEmailToProvider(spEmail, visitDate, timeSlot, userEmail);

                lblMessage.Text = "<div class='alert alert-success'>Booking cancelled & emails sent.</div>";
                LoadBookings();
            }
            catch (Exception ex)
            {
                lblMessage2.Text = "ERROR: " + ex.Message;
            }
        }


        private void SendCancelEmailToUser(string email, string date, string time, string provider)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("homeservicefinder999@gmail.com");
            mail.Subject = "Booking Cancelled - HomeServiceFinder";
            mail.IsBodyHtml = true;

            mail.Body = $@"
    <h2>Booking Cancelled</h2>
    <p>Your booking with <b>{provider}</b> has been cancelled.</p>
    <p><b>Date:</b> {date}</p>
    <p><b>Time:</b> {time}</p>
    <p>If this was a mistake, you can rebook anytime.</p>";

            SendSMTP(mail);
        }

        private void SendCancelEmailToProvider(string email, string date, string time, string userEmail)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("homeservicefinder999@gmail.com");
            mail.Subject = "Booking Cancelled by User";
            mail.IsBodyHtml = true;

            mail.Body = $@"
    <h2>Booking Cancelled</h2>
    <p>The customer <b>{userEmail}</b> has cancelled the booking.</p>
    <p><b>Date:</b> {date}</p>
    <p><b>Time:</b> {time}</p>";

            SendSMTP(mail);
        }

        private void SendSMTP(MailMessage mail)
        {
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential(
                "homeservicefinder999@gmail.com",
                "cvquixtqamspxxjp"
            );
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }

    }
}