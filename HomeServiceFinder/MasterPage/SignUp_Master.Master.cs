using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeServiceFinder.login_signup
{
    public partial class SignUp_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void User_SignUpPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_SignUp.aspx");
        }

        protected void Worker_SignUpPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Worker_SignUp.aspx");
        }
    }
}