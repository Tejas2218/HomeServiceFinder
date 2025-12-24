using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class EditUserDetails : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int userId = Convert.ToInt32(Request.QueryString["id"]);
                    LoadUserData(userId);
                    // Use userId here
                }
            }
        }
        protected void BindUserStateList()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_State", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                StateList.DataSource = dr;
                StateList.DataTextField = "State_Name";
                StateList.DataValueField = "State_Name";
                StateList.DataBind();
            }
            StateList.Items.Insert(0, new ListItem("Select State", ""));
        }

        protected void BindCityList(object sender, EventArgs e)
        {
            CityList.Items.Clear();
            CityList.Items.Insert(0, new ListItem("Select City", ""));

            if (string.IsNullOrEmpty(StateList.SelectedValue))
                return;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_City", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                CityList.DataSource = dr;
                CityList.DataTextField = "City_Name";
                CityList.DataValueField = "City_Name";
                CityList.DataBind();
            }
            CityList.Items.Insert(0, new ListItem("Select City", ""));
        }

        protected void LoadUserData(int userId)
        {
            BindUserStateList();
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Details_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", userId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    User_Name_TextBox.Text = dr["User_Name"].ToString();
                    User_Email_TextBox.Text = dr["User_EmailID"].ToString();
                    User_Address_TextBox.Text = dr["User_Address"].ToString();
                    User_Contact_TextBox.Text = dr["User_ContactNo"].ToString();

                    StateList.SelectedValue = dr["State_Name"].ToString();
                    BindCityList(null,null);
                    CityList.SelectedValue = dr["City_Name"].ToString();
                    User_Password_TextBox.Text = dr["User_Password"].ToString();
                }
            }
            ViewState["UserId"] = userId;
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (ViewState["UserId"] == null) return;

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Update_User_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@User_ID", ViewState["UserId"]);
                cmd.Parameters.AddWithValue("@User_Name", User_Name_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_EmailID", User_Email_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_Address", User_Address_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_ContactNo", User_Contact_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_Password", User_Password_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedValue);
                cmd.Parameters.AddWithValue("@City_Name", CityList.SelectedValue);


                con.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("User.aspx");

            
        }
    }
}