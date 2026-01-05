//using DevNoProject.Pages.User;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.User
{
    public partial class user_booking : BasePage
    {
        private string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        private int PageSize = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings(0);
                btnLogout.Visible = Session["UserID"] != null;
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Pages/login_signup/loginPage.aspx");
        }

        private void LoadBookings(int pageIndex)
        {
            using (SqlConnection con = new SqlConnection(constr))
            using (SqlCommand cmd = new SqlCommand("View_User_Booking_Details", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", Session["UserID"]);

                DataTable dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);

                dt.Columns.Add("StatusClass");
                dt.Columns.Add("ActionText");
                dt.Columns.Add("ActionClass");

                foreach (DataRow row in dt.Rows)
                {
                    string status = row["Booking_Status"].ToString();

                    switch (status)
                    {
                        case "Pending":
                            row["StatusClass"] = "status-pending";
                            row["ActionText"] = "Cancel";
                            row["ActionClass"] = "btn btn-danger btn-sm";
                            break;

                        case "Accepted":
                            row["StatusClass"] = "status-accepted";
                            row["ActionText"] = "Cancel";
                            row["ActionClass"] = "btn btn-warning btn-sm";
                            break;

                        case "Declined":
                            row["StatusClass"] = "status-declined";
                            row["ActionText"] = "-";
                            row["ActionClass"] = "btn btn-secondary btn-sm disabled";
                            break;

                        case "Cancelled":
                            row["StatusClass"] = "status-cancelled";
                            row["ActionText"] = "-";
                            row["ActionClass"] = "btn btn-secondary btn-sm disabled";
                            break;

                        default:
                            row["StatusClass"] = "status-cancelled";
                            row["ActionText"] = "-";
                            row["ActionClass"] = "btn btn-secondary btn-sm disabled";
                            break;
                    }

                }

                PagedDataSource pds = new PagedDataSource
                {
                    DataSource = dt.DefaultView,
                    AllowPaging = true,
                    PageSize = PageSize,
                    CurrentPageIndex = pageIndex
                };

                rptBookings.DataSource = pds;
                rptBookings.DataBind();

                ViewState["CurrentPage"] = pageIndex;
                ViewState["TotalPages"] = pds.PageCount;
            }
        }

        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);

            try
            {
                string userEmail = "", spEmail = "", spName = "", timeSlot = "", visitDate = "";

                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();

                    // 🔹 GET DETAILS
                    SqlCommand getCmd = new SqlCommand("Get_Booking_Cancel_Details", con);
                    getCmd.CommandType = CommandType.StoredProcedure;
                    getCmd.Parameters.AddWithValue("@Booking_ID", bookingId);

                    DataTable dt = new DataTable();
                    new SqlDataAdapter(getCmd).Fill(dt);

                    if (dt.Rows.Count == 0)
                    {
                        lblMessage2.Text = "Booking not found.";
                        return;
                    }

                    if (dt.Rows[0]["Booking_Status"].ToString() != "Pending" &&
                            dt.Rows[0]["Booking_Status"].ToString() != "Accepted")
                    {
                        lblMessage2.Text = "This booking cannot be cancelled.";
                        return;
                    }

                    userEmail = dt.Rows[0]["UserEmail"].ToString();
                    spEmail = dt.Rows[0]["ProviderEmail"].ToString();
                    spName = dt.Rows[0]["ProviderName"].ToString();
                    timeSlot = dt.Rows[0]["Time_Slot"].ToString();
                    visitDate = Convert.ToDateTime(dt.Rows[0]["Visiting_DateTime"]).ToString("dd MMM yyyy");

                    // 🔹 DELETE BOOKING
                    SqlCommand delCmd = new SqlCommand("User_Cancle_Booking", con);
                    delCmd.CommandType = CommandType.StoredProcedure;
                    delCmd.Parameters.AddWithValue("@Booking_ID", bookingId);
                    delCmd.ExecuteNonQuery();
                }

                Task.Run(() =>
                {
                    SendCancelEmailToUser(userEmail, visitDate, timeSlot, spName);
                    SendCancelEmailToProvider(spEmail, visitDate, timeSlot, userEmail);
                });

                lblMessage.Text = "<div class='alert alert-success'>Booking cancelled successfully.</div>";
                LoadBookings((int)ViewState["CurrentPage"]);
            }
            catch (Exception ex)
            {
                lblMessage2.Text = "ERROR: " + ex.Message;
            }
        }

        private void SendCancelEmailToUser(string email, string date, string time, string provider)
        {
            MailMessage mail = new MailMessage
            {
                From = new MailAddress("homeservicefinder999@gmail.com"),
                Subject = "Booking Cancelled - HomeServiceFinder",
                IsBodyHtml = true,
                Body = $@"
                    <h3>Booking Cancelled</h3>
                    <p>Your booking with <b>{provider}</b> has been cancelled.</p>
                    <p><b>Date:</b> {date}</p>
                    <p><b>Time:</b> {time}</p>"
            };
            mail.To.Add(email);
            new SmtpClient().Send(mail);
        }

        private void SendCancelEmailToProvider(string email, string date, string time, string userEmail)
        {
            MailMessage mail = new MailMessage
            {
                From = new MailAddress("homeservicefinder999@gmail.com"),
                Subject = "Booking Cancelled by User",
                IsBodyHtml = true,
                Body = $@"
                    <h3>Booking Cancelled</h3>
                    <p>User <b>{userEmail}</b> cancelled the booking.</p>
                    <p><b>Date:</b> {date}</p>
                    <p><b>Time:</b> {time}</p>"
            };
            mail.To.Add(email);
            new SmtpClient().Send(mail);
        }
    }
}
