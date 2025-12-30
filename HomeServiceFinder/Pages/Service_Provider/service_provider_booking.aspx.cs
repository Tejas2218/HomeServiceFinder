using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    public partial class service_provider_booking : System.Web.UI.Page
    {
        public string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //loadData();
            if (!IsPostBack)
            {
                //pending_notification();
                if (Session["UserID"] != null)
                {
                    loadData("Accept");
                }
                else
                {
                    Response.Redirect("~/Pages/login_signup/loginPage.aspx");
                }
            }
        }

        protected void loadData(string status)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("View_Booking_Details", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SP_ID", Convert.ToInt32(Session["UserID"]));
                        cmd.Parameters.AddWithValue("@Booking_Status", status);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        // Always bind, even if empty, to show the EmptyDataText
                        gvBookings.DataSource = dt;
                        gvBookings.DataBind();
                        pending_notification();
                    }
                    using (SqlCommand cmd = new SqlCommand("Total_Booking", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SP_ID", Convert.ToInt32(Session["UserID"]));
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            lblTotalBooking.Text = dr["Total"].ToString();
                        }
                        else
                        {
                            lblTotalBooking.Text = "Data not found";
                        }
                        con.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("Avg_Rating", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SP_ID", Convert.ToInt32(Session["UserID"]));
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            lblAvgRating.Text = dr["SP_AverageRating"].ToString();
                        }
                        else
                        {
                            lblAvgRating.Text = "Data not found";
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
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
                        loadData("Pending");
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
                        loadData("Pending");
                    }
                }
            }
            catch (Exception ex)
            {
                // For debugging: This will show you if the SQL fails
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void btnFetchPending_Click(object sender, EventArgs e)
        {
            btnFetchPending.CssClass = "tab-btn active-tab";
            btnFetchAccepted.CssClass = "tab-btn";
            //String status = btnFetchPending.CommandName.ToString();
            loadData("Pending");
            //btnFetchPending.Text = "Pending";
        }

        protected void btnFetchAccepted_Click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            btnFetchAccepted.CssClass = "tab-btn active-tab";
            btnFetchPending.CssClass = "tab-btn";
            //String status = btnFetchAccepted.CommandName.ToString();
            loadData("Accept");
        }
        protected void pending_notification()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Notification_Pending_Booking", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SP_ID", Convert.ToInt32(Session["UserID"]));
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            btnFetchPending.Text = "Pending" + "<span id=\"spanNotification\" runat=\"server\" class=\"notification-badge\">" + dr["noti"].ToString() + "</span>";
                            lblPendingTask.Text = dr["noti"].ToString();
                        }
                        else
                        {
                            btnFetchPending.Text = "Data not found";
                            lblPendingTask.Text = "Data not found";
                        }
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