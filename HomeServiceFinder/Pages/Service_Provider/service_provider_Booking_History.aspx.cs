using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    public partial class service_provider_Booking_History : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //pending_notification();
                if (Session["UserID"] != null)
                {
                    loadData("none");
                }
                else
                {
                    Response.Redirect("~/Pages/login_signup/loginPage.aspx");
                }
            }
        }
        protected void loadData(string status)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("View_Booking_Details", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.AddWithValue("@SP_ID", 7);
                    cmd.Parameters.AddWithValue("@User_ID", Convert.ToInt32(Session["UserID"]));
                    cmd.Parameters.AddWithValue("@Booking_Status", status);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    // Always bind, even if empty, to show the EmptyDataText
                    gvBookings.DataSource = dt;
                    gvBookings.DataBind();
                }
            }

        }

        protected void btnFetchAll_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string status = btn.CommandArgument.ToString();
            btn.CssClass = "tab-btn active-tab";
            if (status == "none")
            {
                btnFetchDeclined.CssClass = "tab-btn";
                btnFetchAccepted.CssClass = "tab-btn";
                btnFetchCancelled.CssClass = "tab-btn";
                btnFetchCompleted.CssClass = "tab-btn";
            }
            else if(status == "Accepted")
            {
                btnFetchAll.CssClass = "tab-btn";
                btnFetchDeclined.CssClass = "tab-btn";
                btnFetchCancelled.CssClass = "tab-btn";
                btnFetchCompleted.CssClass = "tab-btn";
            }
            else if(status == "Declined")
            {
                btnFetchAll.CssClass = "tab-btn";
                btnFetchAccepted.CssClass = "tab-btn";
                btnFetchCancelled.CssClass = "tab-btn";
                btnFetchCompleted.CssClass = "tab-btn";
            }
            else if(status == "Completed")
            {
                btnFetchAll.CssClass = "tab-btn";
                btnFetchAccepted.CssClass = "tab-btn";
                btnFetchCancelled.CssClass = "tab-btn";
                btnFetchDeclined.CssClass = "tab-btn";
            }
            else
            {
                btnFetchAll.CssClass = "tab-btn";
                btnFetchAccepted.CssClass = "tab-btn";
                btnFetchCompleted.CssClass = "tab-btn";
                btnFetchDeclined.CssClass = "tab-btn";
            }
            loadData(status);
        }

        protected void btnMoreInfo_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string UserID = btn.CommandArgument;
            Response.Redirect("service_provider_user_profile_new.aspx?id=" + UserID);
        }
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int Booking_ID = Convert.ToInt32(btn.CommandArgument);
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        cmd.Parameters.AddWithValue("@Booking_Status", "Accept");
                        int result = cmd.ExecuteNonQuery();
                        btnFetchAll.CssClass = "tab-btn active-tab";
                        btnFetchDeclined.CssClass = "tab-btn";
                        btnFetchAccepted.CssClass = "tab-btn";
                        btnFetchCancelled.CssClass = "tab-btn";
                        btnFetchCompleted.CssClass = "tab-btn";
                        loadData("none");
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int Booking_ID = Convert.ToInt32(btn.CommandArgument);
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Update_Booking_Status", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Booking_ID", Booking_ID);
                        cmd.Parameters.AddWithValue("@Booking_Status", "Decline");
                        int result = cmd.ExecuteNonQuery();
                        btnFetchAll.CssClass = "tab-btn active-tab";
                        btnFetchDeclined.CssClass = "tab-btn";
                        btnFetchAccepted.CssClass = "tab-btn";
                        btnFetchCancelled.CssClass = "tab-btn";
                        btnFetchCompleted.CssClass = "tab-btn";
                        loadData("none");
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}