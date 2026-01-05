using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace HomeServiceFinder.Pages.New_Admin
{
    public class BasePage : Page
    {
        protected override void OnLoad(EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Pages/login_signup/loginPage.aspx");
            }
            base.OnLoad(e);
        }
    }
}