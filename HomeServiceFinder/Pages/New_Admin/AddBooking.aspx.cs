using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class AddBooking : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUser();
                BindService();
            }
        }

        void BindUser()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Name", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlUser.DataSource = dr;
                ddlUser.DataTextField = "User_Name";
                ddlUser.DataValueField = "User_ID";
                ddlUser.DataBind();
            }
            ddlUser.Items.Insert(0, new ListItem("Select User", ""));
        }

        void BindService()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_Service", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlService.DataSource = dr;
                ddlService.DataTextField = "Service_Name";
                ddlService.DataValueField = "Service_ID";
                ddlService.DataBind();
            }
            ddlService.Items.Insert(0, new ListItem("Select Service", ""));
            BindServiceProvider();
        }

        void BindServiceProvider()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Bind_Name_ServiceProvider", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Service_ID", ddlEquipment.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlServiceProvider.DataSource = dr;
                ddlServiceProvider.DataTextField = "User_Name";
                ddlServiceProvider.DataValueField = "SP_ID";
                ddlServiceProvider.DataBind();
            }
            ddlServiceProvider.Items.Insert(0, new ListItem("Select Service Provider", ""));
        }

        protected void btnAddBooking_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Insert_Booking_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Booking_Status", "Pending");
                cmd.Parameters.AddWithValue("@User_ID", ddlUser.SelectedValue);
                cmd.Parameters.AddWithValue("@SP_ID", ddlServiceProvider.SelectedValue);
                cmd.Parameters.AddWithValue("@Equipment_ID", ddlEquipment.SelectedValue);
                cmd.Parameters.AddWithValue("@Time_Slot", ddlServiceTime.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
            }
            SendEmailBridge(Convert.ToInt32(ddlServiceProvider.SelectedValue), Convert.ToInt32(ddlUser.SelectedValue));
            Response.Redirect("AdminBookings.aspx");
        }

        void SendEmailBridge(int sp_ID, int user_ID)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Details_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", user_ID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    SendEmail(dr["User_Name"].ToString(), dr["User_EmailID"].ToString(),"User");
                }
                dr.Close();

                SqlCommand cmd2 = new SqlCommand("Display_Worker_Details_ByID", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@SP_ID", sp_ID);
                


                SqlDataReader dr2 = cmd2.ExecuteReader();

                if (dr2.Read())
                {
                    SendEmail(dr2["User_Name"].ToString(), dr2["User_EmailID"].ToString(),"Worker");
                }
                dr2.Close();
            }

        }
        void SendEmail(string name, string email,string role)
        {
            string subject = "Service Provider Account Status";
            string body;

            if (role == "User")
            {
                body = $@"
                <p>Hello <b>{name}</b>,</p>
                <p>✅ Your booking has been <b style='color:green;'>SUCCESSFULLY CONFIRMED</b>.</p>
                <p>Our service provider will reach out to you shortly.</p>
                <p>Thank you for choosing <b>Home Service Finder</b>.</p>
                <br/>
                <p>Regards,<br/>Home Service Finder Team</p>";

            }
            else
            {
                body = $@"
                <p>Hello <b>{name}</b>,</p>
                <p>📢 You have received a <b>NEW SERVICE BOOKING</b>.</p>
                <p>A customer has booked your service through <b>Home Service Finder</b>.</p>
                <p>Please log in to your account to view the booking details and contact the customer.</p>
                <br/>
                <p><b>Important:</b> Kindly respond to the customer as soon as possible.</p>
                <br/>
                <p>Regards,<br/>Home Service Finder Team</p>";

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

        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                if (ddlService.SelectedIndex <= 0)
                {
                    return; // Do NOT call SP when no state is selected
                }
                SqlCommand cmd = new SqlCommand("View_Equipment_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Service_ID", ddlService.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ddlEquipment.DataSource = dr;
                ddlEquipment.DataTextField = "Equipment_Name";
                ddlEquipment.DataValueField = "Equipment_ID";
                if (ddlEquipment.Text != "Select Equipment")
                {
                    ddlEquipment.DataBind();
                }

            }
            ddlEquipment.Items.Insert(0, new ListItem("Select Equipment", ""));
        }

        protected void ddlEquipment_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindServiceProvider();
        }
    }
}