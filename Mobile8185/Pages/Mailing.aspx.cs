using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mailing : System.Web.UI.Page
{
    protected System.Web.SessionState.HttpSessionState session;

    private List<string> mailing = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        session = Session;

        loadMailing();
    }

    private void loadMailing()
    {
        mailing = FileManager.ReadFromBinaryFile<List<string>>(Server.MapPath(Security.FILE_MAILING));

        String emails = "";

        for (int i = 0; i < mailing.Count; i++)
        {
            emails += (i + 1) + " - " + mailing[i] + "\n";
        }

        outputMailing.InnerHtml = emails;
    }

    protected void Join_Mailing_Click(object sender, EventArgs e)
    {
        saveEmail();

        inputEmail.Value = "";

        Page_Load(sender, e);
    }

    private void saveEmail()
    {
        string email = inputEmail.Value;
        mailing.Add(email);

        FileManager.WriteToBinaryFile(Server.MapPath(Security.FILE_MAILING), mailing);
    }
}