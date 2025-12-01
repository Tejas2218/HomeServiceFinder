using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HomeServiceFinder.login_signup
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            string contact = txtContact.Text.Trim();
            string password = txtpassword.Text.Trim();

            if (contact == "" || password == "")
            {
                lblMessage.Text = "Please enter Email / Phone and Password!";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Role FROM Users WHERE Contact=@Contact AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();
                object role = cmd.ExecuteScalar();
                con.Close();

                if (role != null)
                {
                    Session["User"] = contact;
                    Session["Role"] = role.ToString();

                    if (role.ToString() == "Admin")
                        Response.Redirect("AdminDashboard.aspx");
                    else if (role.ToString() == "ServiceProvider")
                        Response.Redirect("ServiceDashboard.aspx");
                    else
                        Response.Redirect("ClientDashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid Email / Phone or Password!";
                }
            }
        }
    }
}
