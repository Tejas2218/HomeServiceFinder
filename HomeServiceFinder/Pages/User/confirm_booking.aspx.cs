using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.User
{
    public partial class service_provider : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Simulate retrieving data from QueryString (e.g., booking_success.aspx?id=5029&p=Rajesh)
                // In a real app, you would query the Database using the Booking ID.

                lblBookingID.Text = Request.QueryString["id"] ?? "APX-" + new Random().Next(1000, 9999);
                lblProvider.Text = Request.QueryString["provider"] ?? "Rajesh Kumar";
                lblDate.Text = DateTime.Now.AddDays(1).ToString("dd MMM yyyy"); // Dummy date
                lblTime.Text = "10:00 AM";
                lblAmount.Text = "₹ 499.00";
            }
        }
    }
}