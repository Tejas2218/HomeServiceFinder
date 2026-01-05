using DevNoProject.Pages.User;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Runtime.Remoting;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace HomeServiceFinder.Pages.User
{
    public partial class service_provider1 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["sid"] != null &&
            int.TryParse(Request.QueryString["sid"], out int sid))
                {
                    LoadProvidersByID(sid);
                }
                else
                {
                    LoadProviders(0);
                    LoadServices();
                }
                btnLogout.Visible = Session["UserID"] != null;
            }
        }

        private void LoadServices()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("View_ServiceMaster", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    ddlServices.DataSource = dr;
                    ddlServices.DataTextField = "Service_Name";
                    ddlServices.DataValueField = "Service_ID";
                    ddlServices.DataBind();
                    ddlServices.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Service --", "0"));
                }
            }
        }

        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;

        private void LoadProviders(int serviceId)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Display_Worker_Details", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    // If you want to filter by service, modify the SP to accept @ServiceID
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Filter in code if SP not accepting parameter yet
                    if (serviceId != 0)
                    {
                        dt.DefaultView.RowFilter = $"Service_ID = {serviceId}";
                        dt = dt.DefaultView.ToTable();
                    }

                    rptProviders.DataSource = dt;
                    rptProviders.DataBind();

                    lblMessage.Text = dt.Rows.Count == 0 ? "No providers found." : "";
                }
            }
        }

        protected void ddlServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlServices.SelectedValue);
            LoadProviders(serviceId);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Pages/login_signup/loginPage.aspx");
        }


        private void LoadProvidersByID(int sid)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                using (SqlCommand cmd = new SqlCommand("Display_Worker_Details_ByService", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Service_ID", sid);

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

        private string GetProviderEmail(string spId)
        {
            string email = "";

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("Get_Provider_Email", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@SP_ID", spId);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    email = result.ToString();
                }
            }
            return email;
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


</div>

</body>
</html>";




                    // ===== SEND EMAIL TO SERVICE PROVIDER =====
                    string providerEmail = GetProviderEmail(hfProviderID.Value);

                    if (!string.IsNullOrEmpty(providerEmail))
                    {
                        MailMessage spMail = new MailMessage();
                        spMail.To.Add(providerEmail);
                        spMail.From = new MailAddress("homeservicefinder999@gmail.com");
                        spMail.Subject = "New Booking Assigned - HomeServiceFinder";
                        spMail.IsBodyHtml = true;

                        spMail.Body = $@"
<!DOCTYPE html>
<html>
<body style='font-family: Arial; background:#f5f5f5; padding:20px;'>

<div style='max-width:600px; background:#fff; padding:30px; border-radius:10px; margin:auto;'>

    <h2 style='color:#ff4d00;'>New Booking Received</h2>

    <p>You have received a new service request.</p>

    <table style='width:100%; margin-top:20px;'>
        <tr>
            <td><b>Customer</b></td>
            <td style='text-align:right;'>{Session["UserEmail"]}</td>
        </tr>
        <tr>
            <td><b>Date</b></td>
            <td style='text-align:right;'>{txtDate.Text}</td>
        </tr>
        <tr>
            <td><b>Time Slot</b></td>
            <td style='text-align:right;'>{hfSelectedTime.Value}</td>
        </tr>
        <tr>
            <td><b>Service ID</b></td>
            <td style='text-align:right;'>{hfEquipmentID.Value}</td>
        </tr>
    </table>

    <p style='margin-top:20px;'>
        Please login to your dashboard to accept or manage this booking.
    </p>

</div>

</body>
</html>";

                        //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.Credentials = new System.Net.NetworkCredential("homeservicefinder999@gmail.com", "cvquixtqamspxxjp");
                        smtp.EnableSsl = true;

                        Task.Run(() =>
                        {
                            smtp.Send(mail);
                            smtp.Send(spMail);
                        });
                        
                    }


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