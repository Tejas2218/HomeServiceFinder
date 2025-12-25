using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.User
{
    public partial class service_provider1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Create Dummy Provider Data
                var providerList = new System.Collections.Generic.List<object>
            {
                new { Id = "101", Name = "Rajesh Kumar", Role = "Senior Expert", Rating = "4.9", Jobs = "520", Img = "img/team-1.jpg" },
                new { Id = "102", Name = "Anita Desai", Role = "Cleaning Pro", Rating = "4.8", Jobs = "310", Img = "img/team-2.jpg" },
                new { Id = "103", Name = "Vikram Singh", Role = "Technician", Rating = "4.7", Jobs = "150", Img = "img/team-3.jpg" },
                new { Id = "104", Name = "Priya Sharma", Role = "Home Care", Rating = "5.0", Jobs = "800", Img = "img/team-4.jpg" }
            };

                rptProviders.DataSource = providerList;
                rptProviders.DataBind();
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            string pName = hfProviderName.Value;
            string date = txtDate.Text;
            string time = hfSelectedTime.Value;

            // Show Success Alert
            string script = $"alert('BOOKING SUCCESSFUL!\\nProvider: {pName}\\nDate: {date}\\nTime: {time}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}