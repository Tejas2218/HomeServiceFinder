using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HomeServiceFinder.Pages.User
{
    public partial class user_dashboard : System.Web.UI.Page
    {
        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;
        public DataSet sd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    // User is logged in
                    phProfileBtn.Visible = true;
                    phSignupBtn.Visible = false;
                }
                else
                {
                    // User not logged in
                    phProfileBtn.Visible = false;
                    phSignupBtn.Visible = true;
                }

                //LoadProviders();
            }
        }

        private void LoadProviders()
        {
            
        }

        //private void LoadBookings()
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(constr))
        //        using (SqlCommand cmd = new SqlCommand("Display_Booking_Details", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;

        //            //cmd.Parameters.Add("@User_ID", SqlDbType.Int).Value = Session["UserID"];

        //            con.Open();

        //            SqlDataReader dr = cmd.ExecuteReader();

        //            if (dr.Read())
        //            {
        //                txtName.Text = dr["User_Name"].ToString();
        //                txtEmail.Text = dr["User_EmailID"].ToString();
        //                txtContact.Text = dr["User_ContactNo"].ToString();
        //                txtAddress.Text = dr["User_Address"].ToString();
        //                userState = dr["State_ID"].ToString();
        //                userCity = dr["City_ID"].ToString();
        //                lblMessage.Text = "State=" + dr["State_ID"] + " City=" + dr["City_ID"];


        //            }
        //            else
        //            {
        //                lblMessage.Text = "No user data found.";
        //            }
        //            dr.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMessage.Text = ex.Message;
        //    }
        //}


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

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/User/Profile.aspx");
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/login_signup/User_SignUp.aspx");
        }
    }
}