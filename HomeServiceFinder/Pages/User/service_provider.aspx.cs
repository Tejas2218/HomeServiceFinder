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
using static System.Net.WebRequestMethods;

namespace HomeServiceFinder.Pages.User
{
    public partial class service_provider1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProviders();
                //rptProviders.DataSource = providerList;
                //rptProviders.DataBind();
            }
        }

        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;

        private void LoadProviders()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                using (SqlCommand cmd = new SqlCommand("Display_Worker_Details", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptProviders.DataSource = dt;
                        rptProviders.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No service providers found.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "No user data found." + ex;
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            //string pName = hfProviderName.Value;
            //string date = txtDate.Text;
            //string time = hfSelectedTime.Value;

            // Show Success Alert
            //string script = $"alert('BOOKING SUCCESSFUL!\\nProvider: {pName}\\nDate: {date}\\nTime: {time}');";
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand cmd = new SqlCommand("Insert_Booking_Details", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Booking_Status", "Pending");
                    cmd.Parameters.AddWithValue("@User_ID", Session["UserID"].ToString());
                    cmd.Parameters.AddWithValue("@SP_ID", hfProviderID.Value);
                    cmd.Parameters.AddWithValue("@Booking_Rating", 0);
                    cmd.Parameters.AddWithValue("@Equipment_ID", hfEquipmentID.Value);
                    cmd.Parameters.AddWithValue("@Time_Slot", hfSelectedTime.Value.ToString());

                    DateTime visitDate = DateTime.Parse(txtDate.Text);
                    cmd.Parameters.Add("@Visiting_DateTime", SqlDbType.DateTime).Value = visitDate;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    MailMessage mail = new MailMessage();
                    mail.To.Add(Session["UserEmail"].ToString());
                    mail.From = new MailAddress("homeservicefinder999@gmail.com");
                    mail.Subject = "Booking Confirmed - HomeServiceFinder";
                    mail.IsBodyHtml = true;
                    mail.Body = $@"
<!DOCTYPE html>
<html>
<body style='font-family: Arial, sans-serif; background:#f5f5f5; padding:20px;'>

<div style='max-width:600px; margin:auto; background:#fff; border-radius:10px; padding:30px;'>

    <div style='text-align:center;'>
        <div style='width:80px; height:80px; background:#d4f8df; border-radius:50%; margin:auto;'>
            <span style='font-size:50px; color:green; line-height:80px;'>✓</span>
        </div>

        <h2 style='margin-top:20px;'>Booking Confirmed!</h2>
        <p>Your expert is scheduled to arrive.</p>
    </div>

    <hr/>

    <table style='width:100%; margin-top:20px;'>
        <tr>
            <td>Provider</td>
            <td style='text-align:right;'>{hfProviderID.Value}</td>
        </tr>
        <tr>
            <td>Date</td>
            <td style='text-align:right;'>{txtDate.Text}</td>
        </tr>
        <tr>
            <td>Time Slot</td>
            <td style='text-align:right;'>{hfSelectedTime.Value.ToString()}</td>
        </tr>
    </table>

    <hr/>

    <p style='font-size:18px;'>
        Total Amount:
        <span style='float:right; color:#ff4d00; font-weight:bold;'>₹{hfMinimumPrice.Value}</span>
    </p>

    <div style='text-align:center; margin-top:30px;'>
        <a href='http://localhost:50095/Pages/login_signup/loginPage.aspx'
           style='background:#ff4d00; color:#fff; padding:14px 30px;
                  text-decoration:none; border-radius:25px; display:inline-block;'>
            Go to Dashboard
        </a>
    </div>

</div>

</body>
</html>";


                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.Credentials = new System.Net.NetworkCredential("homeservicefinder999@gmail.com", "cvquixtqamspxxjp");
                    smtp.EnableSsl = true;
                    
                    smtp.Send(mail);

                    Response.Redirect($"confirm_booking.aspx?provider={hfProviderName.Value}&date={txtDate.Text}&time={hfSelectedTime.Value}&amount={hfMinimumPrice.Value}");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex;
            }
        }
    }
}



//namespace WebAppDemo.Pages
//{
//    public partial class ForgotPassword : System.Web.UI.Page
//    {
//        SqlConnection con = new SqlConnection(@"Data Source=SMIT\SQLEXPRESS02;Initial Catalog=TAWebAppDemo;Integrated Security=True");

//        protected void btnSendOTP_Click(object sender, EventArgs e)
//        {
//            SqlCommand cmd = new SqlCommand("SELECT StudentID FROM Student WHERE Email=@Email", con);
//            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

//            SqlDataAdapter da = new SqlDataAdapter(cmd);
//            DataTable dt = new DataTable();
//            da.Fill(dt);

//            if (dt.Rows.Count == 0)
//            {
//                lblMsg.Text = "Email not found!";
//                return;
//            }

//            // Generate OTP
//            Random rnd = new Random();
//            int otp = rnd.Next(100000, 999999);

//            Session["OTP"] = otp;
//            Session["Email"] = txtEmail.Text.Trim();
//            Session["StudentID"] = dt.Rows[0]["StudentID"].ToString();

//            // Send Email
//            MailMessage mail = new MailMessage();
//            mail.To.Add(txtEmail.Text);
//            mail.From = new MailAddress("`your-email-address");
//            mail.Subject = "Your OTP Code";
//            mail.Body = "Your OTP is: " + otp;

//            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
//            smtp.Credentials = new System.Net.NetworkCredential("your-email-address", "google app password");
//            smtp.EnableSsl = true;
//            smtp.Send(mail);

//            Response.Redirect("VerifyOTP.aspx");
//        }
//    }
//}