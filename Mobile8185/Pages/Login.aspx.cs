using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Login_Click(object sender, EventArgs e)
    {
        string user = username.Value;
        string pass = password.Value;

        if (Security.Authenticate(user, pass, Session))
            Response.Redirect("Home.aspx");
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenDialog();", true);
        }
    }
}