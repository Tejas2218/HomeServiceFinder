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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStateList();
                bindUserData();

                if (!string.IsNullOrEmpty(userState))
                {
                    StateList.SelectedValue = userState;
                    BindCityList();
                }

                if (!string.IsNullOrEmpty(userCity))
                {
                    CityList.SelectedValue = userCity;
                }
            }

        }

        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string userState = "";
        string userCity = "";

        protected void BindStateList()
        {
            try
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

            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }


        protected void BindCityList()
        {
            if (string.IsNullOrEmpty(StateList.SelectedValue))
                return;

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                using (SqlCommand cmd = new SqlCommand("Display_City", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@State_ID", SqlDbType.Int)
                                  .Value = StateList.SelectedValue;

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    CityList.DataSource = dr;
                    CityList.DataTextField = "City_Name";
                    CityList.DataValueField = "City_ID";
                    CityList.DataBind();
                }

                CityList.Items.Insert(0, new ListItem("Select City", ""));
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }


        protected void bindUserData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                using (SqlCommand cmd = new SqlCommand("Display_User_Details_ByID", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@User_ID", SqlDbType.Int).Value = Session["UserID"];

                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtName.Text = dr["User_Name"].ToString();
                        txtContact.Text = dr["User_ContactNo"].ToString();
                        txtAddress.Text = dr["User_Address"].ToString();
                        userState = dr["State_ID"].ToString();
                        userCity = dr["City_ID"].ToString();
                        //lblMessage.Text = "State=" + dr["State_ID"] + " City=" + dr["City_ID"];

                    }
                    else
                    {
                        lblMessage.Text = "No user data found.";
                    }
                    dr.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void StateList_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCityList();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand cmd = new SqlCommand("Update_User_Details", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@User_ID", Session["UserID"]);
                    cmd.Parameters.AddWithValue("@User_Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@User_Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@User_ContactNo", txtContact.Text);
                    cmd.Parameters.AddWithValue("@City_Name", CityList.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedItem.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("user_dashboard.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnPassword_Click(object sender, EventArgs e)
        {

        }

    }
}