using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace HomeServiceFinder.login_signup
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"]!=null && Session["UserRole"].ToString() == "User")
            {
                //Response.Redirect("homePage.aspx");
            }else if (Session["UserID"] != null && Session["UserRole"].ToString() == "Admin")
            {
                Response.Redirect("~/Pages/Admin/admin_dashboard.aspx");
            }
        }

        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;

        public void connection()
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
        }
        public void open_connection()
        {
            cmd.Connection.Open();
        }
        public void close_connection()
        {
            cmd.Connection.Close();
        }
        public void dispose_connection()
        {
            cmd.Connection.Dispose();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtContact.Text.Trim();
                string password = txtpassword.Text.Trim();
                connection();
                cmd.CommandText = "LoginSP";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 100).Value = username;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 100).Value = password;

                open_connection();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["UserID"] = dr["User_ID"].ToString();
                    Session["UserRole"] = dr["User_Role"].ToString();
                    lblMessage.Text = "Your are loged in";
                    if (dr["User_Role"].ToString() == "Admin")
                    {
                        Response.Redirect("~/Pages/Admin/admin_dashboard.aspx"); 
                    }
                    
                }
                else
                { 
                    lblMessage.Text = "Invalid Login Details!";
                }
                close_connection();
                dispose_connection();
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}
