using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.New_Admin
{
    public partial class AddServiceProvider : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStateList();
                BindServiceList();
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    BindWorkerData(id);
                    btnEdit.Visible = false;
                    btnUpdate.Visible = true;
                }
            }
        }
        void BindWorkerData(int id)
        {
            ViewState["id"] = id;
            using(SqlConnection con=new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Display_Worker_Details_ByID",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SP_ID",id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    UserName.Text = dr["User_Name"].ToString();
                    UserEmail.Text = dr["User_EmailID"].ToString();
                    UserContact.Text = dr["User_ContactNo"].ToString();
                    StateList.SelectedValue = dr["State_ID"].ToString();
                    BindCityList(null, null);
                    CityList.SelectedValue = dr["City_ID"].ToString();
                    UserAddress.Text = dr["User_Address"].ToString();

                    // SERVICE PROVIDER DETAILS
                    ServiceList.SelectedValue = dr["Service_ID"].ToString();
                    BindEquipmentList(null,null);
                    EquipmentList.SelectedValue = dr["Equipment_ID"].ToString();
                    SPAge.Text = dr["SP_Age"].ToString();
                    SPExperience.Text = dr["SP_Experience"].ToString();
                    SPMinimumPrice.Text = dr["SP_MinimumPrice"].ToString();
                    SPShopAddress.Text = dr["SP_ShopAddress"].ToString();


                }
            }
        }
        protected void BindStateList()
        {

            using (SqlConnection con = new SqlConnection(connString))
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

        protected void BindCityList(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
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

            }
            CityList.Items.Insert(0, new ListItem("Select City", ""));
        }

        protected void BindServiceList()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("View_ServiceMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ServiceList.DataSource = dr;
                ServiceList.DataTextField = "Service_Name";
                ServiceList.DataValueField = "Service_ID";
                ServiceList.DataBind();
            }
            ServiceList.Items.Insert(0, new ListItem("Select Service", ""));
        }

        protected void BindEquipmentList(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                if (ServiceList.SelectedIndex <= 0)
                {
                    return; // Do NOT call SP when no state is selected
                }
                SqlCommand cmd = new SqlCommand("View_Equipment_ByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Service_ID", ServiceList.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                EquipmentList.DataSource = dr;
                EquipmentList.DataTextField = "Equipment_Name";
                EquipmentList.DataValueField = "Equipment_ID";
                if (EquipmentList.Text != "Select Equipment")
                {
                    EquipmentList.DataBind();
                }

            }
            EquipmentList.Items.Insert(0, new ListItem("Select Equipment", ""));
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Insert_Worker_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();

                cmd.Parameters.AddWithValue("@User_Name", UserName.Text);
                cmd.Parameters.AddWithValue("@User_EmailID", UserEmail.Text);
                cmd.Parameters.AddWithValue("@User_Address", UserAddress.Text);
                cmd.Parameters.AddWithValue("@User_ContactNo", UserContact.Text);
                cmd.Parameters.AddWithValue("@User_Password", Password.Text);
                cmd.Parameters.AddWithValue("@User_Role", "Worker");
                cmd.Parameters.AddWithValue("@City_ID", CityList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@State_ID", StateList.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@SP_Age", Convert.ToInt32(SPAge.Text));
                cmd.Parameters.AddWithValue("@SP_ShopAddress", SPShopAddress.Text);
                cmd.Parameters.AddWithValue("@SP_Service", ServiceList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SP_Experience", Convert.ToInt32(SPExperience.Text));
                cmd.Parameters.AddWithValue("@SP_MinimumPrice", Convert.ToInt32(SPMinimumPrice.Text));
                cmd.Parameters.AddWithValue("@SP_AverageRating", Convert.ToInt32("0"));
                cmd.Parameters.AddWithValue("@Service_ID", ServiceList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Equipment_ID", EquipmentList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SP_Status", "Approved");



                cmd.ExecuteNonQuery();
                Response.Redirect("ServiceProvider.aspx");
            }


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using(SqlConnection con=new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("Update_Worker_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@SP_ID", Convert.ToInt32(ViewState["id"]));
                cmd.Parameters.AddWithValue("@User_Name", UserName.Text);
                cmd.Parameters.AddWithValue("@User_EmailID", UserEmail.Text);
                cmd.Parameters.AddWithValue("@User_Address", UserAddress.Text);
                cmd.Parameters.AddWithValue("@User_ContactNo", UserContact.Text);
                cmd.Parameters.AddWithValue("@User_Password", Password.Text);
                cmd.Parameters.AddWithValue("@City_ID", CityList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@State_ID", StateList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Service_ID", ServiceList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Equipment_ID", EquipmentList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SP_Age", SPAge.Text);
                cmd.Parameters.AddWithValue("@SP_ShopAddress", SPShopAddress.Text);
                cmd.Parameters.AddWithValue("@SP_Experience", SPExperience.Text);
                cmd.Parameters.AddWithValue("@SP_MinimumPrice", SPMinimumPrice.Text);
                con.Open();
                cmd.ExecuteNonQuery();

            }
            Response.Redirect("ViewServiceProviderDetails.aspx?id="+ Convert.ToInt32(ViewState["id"]));
        }
    }
}