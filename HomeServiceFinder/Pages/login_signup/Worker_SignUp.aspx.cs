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

namespace HomeServiceFinder.Pages.login_signup
{
    public partial class Worker_SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStateList();
            }
            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "restoreStep",
                $"showStep({CurrentStep.Value});",
                true
            );

        }

        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlDataAdapter sda;
        public SqlCommand cmd;

        protected void BindStateList()
        {

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("Display_State", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                StateList.DataSource = dr;
                StateList.DataTextField = "State_Name";
                StateList.DataValueField = "State_ID";
                StateList.DataBind();
            }
            StateList.Items.Insert(0, new ListItem("Select State", ""));
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("View_ServiceMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                Worker_ServiceType_DropDown.DataSource = dr;
                Worker_ServiceType_DropDown.DataTextField = "Service_Name";
                Worker_ServiceType_DropDown.DataValueField = "Service_ID";
                Worker_ServiceType_DropDown.DataBind();
            }
            Worker_ServiceType_DropDown.Items.Insert(0, new ListItem("Select Service", ""));
        }

        protected void StateList_SelectedIndexChanged(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(constr))
            {
                if (StateList.SelectedIndex <= 0)
                {
                    return; // Do NOT call SP when no state is selected
                }
                SqlCommand cmd = new SqlCommand("Display_City", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedItem.Text);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                CityList.DataSource = dr;
                CityList.DataTextField = "City_Name";
                CityList.DataValueField = "City_ID";
                if (StateList.Text != "Select State")
                {
                    CityList.DataBind();
                }
                CurrentStep.Value = "2";
            }
            CityList.Items.Insert(0, new ListItem("Select City", ""));
        }

        protected void Worker_Signup_Button_Click(object sender, EventArgs e)
        {
            try {
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
                String ShopAddress = Worker_ShopAddress_TextBox.Text;
                String service = Worker_ServiceType_DropDown.SelectedValue;
                String experience = Worker_Experience_TextBox.Text;
                String password = Worker_Confirm_Password_TextBox.Text;
                String city = CityList.SelectedItem.Value;
                String state = StateList.SelectedItem.Value;
                String Service_ID = Worker_ServiceType_DropDown.SelectedItem.Value;
                String Equipment_ID = Worker_Equipment_DropDown.SelectedItem.Value;
                String minPrice = Worker_MinimumPrice_TextBox.Text;

                cmd.CommandText = "Insert_Worker_Details";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_Name", name);
                cmd.Parameters.AddWithValue("@User_EmailID", email);
                cmd.Parameters.AddWithValue("@User_Address", address);
                cmd.Parameters.AddWithValue("@User_ContactNo", phone);
                cmd.Parameters.AddWithValue("@User_Password", password);
                cmd.Parameters.AddWithValue("@User_Role", "Worker");
                cmd.Parameters.AddWithValue("@City_ID", city);
                cmd.Parameters.AddWithValue("@State_ID", state);

                cmd.Parameters.AddWithValue("@SP_Age", Convert.ToInt32(age));
                cmd.Parameters.AddWithValue("@SP_ShopAddress", ShopAddress);
                cmd.Parameters.AddWithValue("@SP_Service", service);
                cmd.Parameters.AddWithValue("@SP_Experience", Convert.ToInt32(experience));
                cmd.Parameters.AddWithValue("@SP_MinimumPrice", Convert.ToInt32(minPrice));
                cmd.Parameters.AddWithValue("@SP_AverageRating", Convert.ToInt32("0"));
                cmd.Parameters.AddWithValue("@Service_ID", Service_ID);
                cmd.Parameters.AddWithValue("@Equipment_ID", Equipment_ID);



                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Data inserted successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Data not inserted successfully');</script>");
                }

                cmd.Connection.Close();
                cmd.Connection.Dispose();

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


        protected void Worker_ServiceType_DropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr)) { 
                if(Worker_ServiceType_DropDown.SelectedIndex<=0)
                {
                    return;
                }
                SqlCommand cmd = new SqlCommand("View_Equipment_ByID",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Service_ID",Worker_ServiceType_DropDown.SelectedValue);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Worker_Equipment_DropDown.DataSource = dr;
                Worker_Equipment_DropDown.DataTextField = "Equipment_Name";
                Worker_Equipment_DropDown.DataValueField = "Equipment_ID";
                if (Worker_ServiceType_DropDown.Text != "Select Service")
                {
                    Worker_Equipment_DropDown.DataBind();
                }
            }
            Worker_Equipment_DropDown.Items.Insert(0, new ListItem("Select Equipment", ""));
        }
    }
}
