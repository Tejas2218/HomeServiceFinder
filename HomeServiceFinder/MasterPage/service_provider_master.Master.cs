using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.Service_Provider
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetActiveLink();
            }

        }
        private void SetActiveLink()
        {
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath).ToLower();

            // Reset classes first (optional but cleaner)
            lnkBookings.Attributes["class"] = "";
            lnkHistory.Attributes["class"] = "";
            lnkCustomers.Attributes["class"] = "";
            lnkProfile.Attributes["class"] = "";

            // Apply the active class
            if (currentPage == "service_provider_booking.aspx")
                lnkBookings.Attributes.Add("class", "active");
            else if (currentPage == "service_provider_booking_history.aspx")
                lnkHistory.Attributes.Add("class", "active");
            else if (currentPage == "service_provider_user.aspx" || currentPage == "webform3.aspx")
                lnkCustomers.Attributes.Add("class", "active");
            else if (currentPage == "service_provider_profile.aspx")
                lnkProfile.Attributes.Add("class", "active");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Pages/login_signup/loginPage.aspx");
        }
    }
}