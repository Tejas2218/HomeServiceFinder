using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HomeServiceFinder.login_signup
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            // Redirect if already logged in
            if (Session["UserID"] != null && Session["UserRole"] != null)
            {
                if (Session["UserRole"].ToString() == "Admin")
                {
                    Response.Redirect("~/Pages/New_Admin/admin_dashboard.aspx");
                }
                else if (Session["UserRole"].ToString() == "User")
                {
                    Response.Redirect("~/Pages/User/user_dashboard.aspx");
                }
                else if (Session["UserRole"].ToString() == "Worker")
                {
                    Response.Redirect("~/Pages/Service_Provider/service_provider_booking.aspx");
                }
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            try
            {
                string username = txtContact.Text.Trim();
                string password = txtPassword.Text.Trim();   // ✅ FIXED ID

                using (SqlConnection con = new SqlConnection(constr))
                using (SqlCommand cmd = new SqlCommand("LoginSP", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 100).Value = username;
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 100).Value = password;

                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        Session["UserID"] = dr["User_ID"].ToString();
                        Session["UserRole"] = dr["User_Role"].ToString();
                        Session["UserEmail"] = username.ToString();
                        

                        lblMessage.CssClass = "success-msg";
                        lblMessage.Text = "Login successful! Redirecting...";

                        if (dr["User_Role"].ToString() == "Admin")
                        {
                            Response.Redirect("~/Pages/New_Admin/AdminDashbord.aspx");
                        }
                        else if(dr["User_Role"].ToString() == "User")
                        {
                            Response.Redirect("~/Pages/User/user_dashboard.aspx");
                        }
                        else if (dr["User_Role"].ToString() == "Worker")
                        {
                            if (dr["SP_Status"].ToString() == "Pending")
                            {
                                Response.Redirect("Waiting_ServiceProvider.aspx");
                            }
                            else if (dr["SP_Status"].ToString() == "Rejected")
                            {
                                Response.Write("<script>Swal.fire({\r\n  icon: 'error',\r\n  title: 'Request Declined',\r\n  text: 'Your request could not be approved at this time.',\r\n  confirmButtonColor: '#d33',\r\n  confirmButtonText: 'Understood'\r\n});</script>");
                            }
                            else if (dr["SP_Status"].ToString() == "Approved")
                            {
                                Response.Redirect("~/Pages/Service_Provider/service_provider_booking.aspx");
                            }

                        }
                        

                    }
                    else
                    {
                        lblMessage.Text = "Invalid email/phone or password!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Something went wrong. Try again later!<br>"+ex;
            }
        }
    }
}
