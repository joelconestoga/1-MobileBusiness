using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Template : System.Web.UI.MasterPage
{
    protected System.Web.SessionState.HttpSessionState session;

    protected void Page_Load(object sender, EventArgs e)
    {
        session = Session;
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Security.Logout(Session);
    }

}
