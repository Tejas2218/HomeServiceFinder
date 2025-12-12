using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.User
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                bindUserData();
            }
        }

        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

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
                        txtEmail.Text = dr["User_EmailID"].ToString();
                        txtContact.Text = dr["User_ContactNo"].ToString(); //what should i do here?
                        txtAddress.Text = dr["User_Address"].ToString();

                    }
                    else
                    {
                        lblMessage.Text = "No user data found.";
                    }
                }
            }
            catch(Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}