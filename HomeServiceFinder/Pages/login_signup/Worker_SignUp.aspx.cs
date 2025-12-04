using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.login_signup
{
    public partial class Worker_SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;

        protected void Worker_Signup_Button_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.Connection.Open();

            String name = Worker_Name_TextBox.Text;
            String email = Worker_Email_TextBox.Text;
            String phone = Worker_Phone_TextBox.Text;
            String age = Worker_Age_TextBox.Text;
            //String gender = Worker_Gender_DropDown.SelectedValue;
            String address = Worker_Address_TextBox.Text;
            String service = Worker_ServiceType_DropDown.SelectedValue;
            String experience = Worker_Experience_TextBox.Text;
            String password = Worker_Confirm_Password_TextBox.Text;

            cmd.CommandText = "Insert_User_Details";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User_Name", name);
            cmd.Parameters.AddWithValue("@User_EmailID", email); ;
            cmd.Parameters.AddWithValue("@User_Address", name);
            cmd.Parameters.AddWithValue("@User_ContactNo", name);
            cmd.Parameters.AddWithValue("@User_Role", name);
            cmd.Parameters.AddWithValue("@City_ID", name);


        }
    }
}