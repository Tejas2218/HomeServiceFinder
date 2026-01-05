using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using static System.Net.Mime.MediaTypeNames;
using System.Net;
using System.Net.Mail;


namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class ViewServiceProviderDetails : BasePage
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                int userId = Convert.ToInt32(Request.QueryString["id"]);
                ViewState["UserId"] = userId;
                LoadUserData(userId);

                if (SP_Status.Text == "Pending" )
                {
                    btnApprove.Visible = true;
                    btnReject.Visible = true;
                }
                else if(SP_Status.Text== "Approved")
                {
                    btnApprove.Visible = false;
                    btnReject.Visible = true;
                }
                else
                {
                    btnApprove.Visible = true;
                    btnReject.Visible = false;
                }
            }
        }

        private void LoadUserData(int userId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_Worker_Details_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SP_ID", userId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // USER DETAILS
                    User_Name.Text = dr["User_Name"].ToString();
                    User_Email.Text = dr["User_EmailID"].ToString();
                    User_Contact.Text = dr["User_ContactNo"].ToString();
                    User_Role.Text = dr["User_Role"].ToString();
                    User_Address.Text = dr["User_Address"].ToString();

                    // LOCATION
                    State_Name.Text = dr["State_Name"].ToString();
                    City_Name.Text = dr["City_Name"].ToString();

                    // SERVICE PROVIDER DETAILS
                    Service_Name.Text = dr["Service_Name"].ToString();
                    Equipment_Name.Text = dr["Equipment_Name"].ToString();
                    SP_Age.Text = dr["SP_Age"].ToString();
                    SP_Experience.Text = dr["SP_Experience"].ToString();
                    SP_MinimumPrice.Text = dr["SP_MinimumPrice"].ToString();
                    SP_AverageRating.Text = dr["SP_AverageRating"] == DBNull.Value ? "N/A" : dr["SP_AverageRating"].ToString();
                    SP_Status.Text = dr["SP_Status"].ToString();
                    SP_ShopAddress.Text = dr["SP_ShopAddress"].ToString();

                    // Created
                    Created_At.Text = dr["Created_DateTime"].ToString();
                    Modified_At.Text = dr["Modified_DateTime"].ToString();


                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(ViewState["UserId"]);
            Response.Redirect("~/Pages/New_Admin/AddServiceProvider.aspx?id=" + userId);
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ViewState["UserId"]);
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Update_Worker_Status", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SP_ID", ViewState["UserId"]);
                cmd.Parameters.AddWithValue("@SP_Status", "Approved");

                con.Open();
                cmd.ExecuteNonQuery();
                LoadUserData(id);

                SqlCommand cmdn = new SqlCommand("Display_Worker_Details_ByID", con);
                cmdn.CommandType = CommandType.StoredProcedure;
                cmdn.Parameters.AddWithValue("@SP_ID", id);

                SqlDataReader dr = cmdn.ExecuteReader();

                if (dr.Read())
                {
                    SendEmail(id, "Approved", dr["User_Name"].ToString(), dr["User_EmailID"].ToString());
                }
            }
            btnApprove.Visible = false;
            btnReject.Visible = true;
            Response.Redirect("ServiceProvider.aspx");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ViewState["UserId"]);
            if (SP_Status.Text != "Rejected")
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("Update_Worker_Status", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SP_ID", ViewState["UserId"]);
                    cmd.Parameters.AddWithValue("@SP_Status", "Rejected");

                    con.Open();
                    cmd.ExecuteNonQuery();
                    LoadUserData(id);

                    SqlCommand cmdn = new SqlCommand("Display_Worker_Details_ByID", con);
                    cmdn.CommandType = CommandType.StoredProcedure;
                    cmdn.Parameters.AddWithValue("@SP_ID", id);

                    SqlDataReader dr = cmdn.ExecuteReader();

                    if (dr.Read())
                    {
                        SendEmail(id, "Rejected", dr["User_Name"].ToString(), dr["User_EmailID"].ToString());
                    }
                }
                btnReject.Visible = false;
                btnApprove.Visible = true;
                Response.Redirect("ServiceProvider.aspx");
            }
            
        }

        void SendEmail(int id, string msg, string name, string email)
        {
            string subject = "Service Provider Account Status";
            string body;

            if (msg == "Approved")
            {
                body = $@"
                <p>Hello <b>{name}</b>,</p>
                <p>🎉 Your service provider account has been <b style='color:green;'>APPROVED</b>.</p>
                <p>You can now log in and start accepting service requests.</p>
                <br/>
                <p>Regards,<br/>Home Service Finder Team</p>";
            }
            else
            {
                body = $@"
                <p>Hello <b>{name}</b>,</p>
                <p>❌ Your service provider account has been <b style='color:red;'>REJECTED</b>.</p>
                <p>If you believe this is a mistake, please contact support.</p>
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
    }
}
