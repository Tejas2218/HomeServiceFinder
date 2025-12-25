using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace HomeServiceFinder.Pages.login_signup
{
    public partial class User_SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStateList();
            }
        }

        protected void BindStateList()
        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using(SqlConnection con=new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_State",con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr=cmd.ExecuteReader();

                StateList.DataSource = dr;
                StateList.DataTextField = "State_Name";
                StateList.DataValueField = "State_ID";
                StateList.DataBind();
            }
            StateList.Items.Insert(0, new ListItem("Select State", ""));
        }

        protected void BindCityList(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection con=new SqlConnection(connString))
            {
                if (StateList.SelectedIndex <= 0)
                {
                    return; // Do NOT call SP when no state is selected
                }
                SqlCommand cmd = new SqlCommand("Display_City", con);
                cmd.CommandType=CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedItem.Text);

                con.Open();
                SqlDataReader dr=cmd.ExecuteReader();
                CityList.DataSource = dr;
                CityList.DataTextField = "City_Name";
                CityList.DataValueField = "City_ID";
                if(StateList.Text!="Select State")
                {
                    CityList.DataBind();
                }
                
            }
            CityList.Items.Insert(0, new ListItem("Select City", ""));
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (User_Password_TextBox.Text != User_Confirm_Password_TextBox.Text)
            {
                Response.Write("Passwords do not match!");
                return;
            }
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            try
            {
                using(SqlConnection con =new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("Insert_User_Details", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@User_Name", User_Name_TextBox.Text);
                    cmd.Parameters.AddWithValue("@User_EmailID", User_Email_TextBox.Text);
                    cmd.Parameters.AddWithValue("@User_Address", User_Address_TextBox.Text);
                    cmd.Parameters.AddWithValue("@User_ContactNo", User_Contact_TextBox.Text);
                    cmd.Parameters.AddWithValue("@User_Password", User_Password_TextBox.Text);
                    cmd.Parameters.AddWithValue("@User_Role", "User");
                    cmd.Parameters.AddWithValue("@City_Name", CityList.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedItem.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("loginPage.aspx");
                }
            }
            catch (SqlException ex)
            {
                string message = "";
                ErrorLabel.Enabled = true;
                switch (ex.Number)
                {
                    case 2601:     // Cannot insert duplicate key row
                    case 2627:     // Unique constraint violation
                        message = "Duplicate entry! Email or phone already exists.";
                        break;

                    case 547:      // Foreign key violation
                        message = "Invalid reference! Cannot insert because of related records.";
                        break;

                    case 4060:     // Cannot open database
                        message = "Database not reachable! Please contact support.";
                        break;

                    case 18456:    // Invalid login
                        message = "Database login failed!";
                        break;

                    default:
                        message = "Unexpected error: " + ex.Message;
                        break;
                }

                ErrorLabel.Text = message;
                ErrorLabel.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}