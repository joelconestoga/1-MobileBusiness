using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedback : System.Web.UI.Page
{
    protected System.Web.SessionState.HttpSessionState session;

    private List<Comment> comments = new List<Comment>();

    protected void Page_Load(object sender, EventArgs e)
    {
        session = Session;

        loadFeedbacks();
    }

    private void loadFeedbacks()
    {
        comments = FileManager.ReadFromBinaryFile<List<Comment>>(Server.MapPath(Security.FILE_FEEDBACK));

        Comment feedback;
        String output = "";

        for (int i = 0; i < comments.Count; i++)
        {
            feedback = comments[i];

            output += (i + 1) + " - " + feedback.Date + "\n" +
                "From: " + feedback.Name + "\n" +
                "Email: " + feedback.Email + "\n" +
                "Comment: " + feedback.Feedback + "\n\n";
        }

        outputFeedbacks.InnerHtml = output;
    }

    protected void Feedback_Click(object sender, EventArgs e)
    {
        saveComment();

        inputEmail.Value = "";
        inputName.Value = "";
        inputComment.Value = "";

        Page_Load(sender, e);
    }

    private void saveComment()
    {
        string comment = inputComment.Value;
        comments.Add(new Comment(inputEmail.Value, inputName.Value, inputComment.Value));

        FileManager.WriteToBinaryFile(Server.MapPath(Security.FILE_FEEDBACK), comments);
    }
}