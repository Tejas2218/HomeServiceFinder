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
    public partial class AddBooking : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUser();
                BindService();
            }
        }

        void BindUser()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_User_Name", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlUser.DataSource = dr;
                ddlUser.DataTextField = "User_Name";
                ddlUser.DataValueField = "User_ID";
                ddlUser.DataBind();
            }
            ddlUser.Items.Insert(0, new ListItem("Select User", ""));
        }

        void BindService()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Count_Service", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlService.DataSource = dr;
                ddlService.DataTextField = "Service_Name";
                ddlService.DataValueField = "Service_ID";
                ddlService.DataBind();
            }
            ddlService.Items.Insert(0, new ListItem("Select Service", ""));
            BindServiceProvider();
        }

        void BindServiceProvider()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Bind_Name_ServiceProvider", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Service_ID", ddlEquipment.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlServiceProvider.DataSource = dr;
                ddlServiceProvider.DataTextField = "User_Name";
                ddlServiceProvider.DataValueField = "User_ID";
                ddlServiceProvider.DataBind();
            }
            ddlServiceProvider.Items.Insert(0, new ListItem("Select Service Provider", ""));
        }

        protected void btnAddBooking_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Insert_Booking_Details_Admin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Booking_Status", "Pending");
                cmd.Parameters.AddWithValue("@Booking_DateTime", txtServiceDate.Text);
                cmd.Parameters.AddWithValue("@User_Address", User_Address_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_ContactNo", User_Contact_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@User_Password", User_Password_TextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@State_Name", StateList.SelectedValue);
                cmd.Parameters.AddWithValue("@City_Name", CityList.SelectedValue);


                con.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("AdminBooking.aspx");
        }

        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                if (ddlService.SelectedIndex <= 0)
                {
                    return; // Do NOT call SP when no state is selected
                }
                SqlCommand cmd = new SqlCommand("View_Equipment_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Service_ID", ddlService.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ddlEquipment.DataSource = dr;
                ddlEquipment.DataTextField = "Equipment_Name";
                ddlEquipment.DataValueField = "Equipment_ID";
                if (ddlEquipment.Text != "Select Equipment")
                {
                    ddlEquipment.DataBind();
                }

            }
            ddlEquipment.Items.Insert(0, new ListItem("Select Equipment", ""));
        }

        protected void ddlEquipment_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindServiceProvider();
        }
    }
}