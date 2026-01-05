using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.Pages.User
{
    public partial class about_us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) {
                if (Session["UserID"] != null && Session["UserRole"] != null)
                {
                    profile.Visible = true;
                    signin.Visible = false;
                }
                else
                {
                    profile.Visible = false;
                    signin.Visible = true;
                }
                btnLogout.Visible = Session["UserID"] != null;
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Pages/login_signup/loginPage.aspx");
        }
    }
}