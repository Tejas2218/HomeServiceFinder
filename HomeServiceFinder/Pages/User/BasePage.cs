using System;
using System.Web.UI;

namespace HomeServiceFinder.Pages.User
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