using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    private List<Post> savedPosts;
    private List<Post> posts;
    private List<string> images;

    private static String imageToDelete;
    private static bool showLoader = true;

    protected System.Web.SessionState.HttpSessionState session;

    protected void Page_Load(object sender, EventArgs e)
    {
        setupSession();

        setupBodyLoadForLoadingPage();

        loadPosts();
    }

    private void setupSession()
    {
        session = Session;
    }

    private void loadPosts()
    {
        posts = new List<Post>();
        savedPosts = loadSavedPosts();

        string[] images = Directory.GetFiles(Server.MapPath(Security.DIR_BOARD_IMG));

        foreach (string image in images)
        {
            string imageName = System.IO.Path.GetFileName(image);

            foreach (Post saved in savedPosts)
                if (saved.ImageName.Equals(Security.DIR_BOARD_IMG + "/" + imageName))
                    posts.Add(saved);
        }

        posts.Sort(new PostComparer());

        RepeaterImages.Dispose();
        RepeaterImages.DataSource = posts;
        RepeaterImages.DataBind();
    }

    private void setupBodyLoadForLoadingPage()
    {
        HtmlGenericControl body = (HtmlGenericControl)Master.FindControl("PageBody");

        if (showLoader)
        {
            body.Attributes.Add("onload", "showLoader();");
            showLoader = false;
        } else
        {
            body.Attributes.Remove("onload");
            body.Attributes.Add("onload", "hideLoader();");
        }
    }

    private List<Post> loadSavedPosts()
    {
        return FileManager.ReadFromBinaryFile<List<Post>>(Server.MapPath(Security.FILE_BOARD_POSTS));
    }

    protected void Upload_Click(object sender, EventArgs e)
    {
        if (!uploadFile.HasFile)
            return;

        saveImage(uploadFile.FileName);

        savePost(uploadFile.FileName);

        inputComments.InnerText = "";

        Page_Load(sender, e);
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        imageToDelete = ((Button)sender).CommandArgument;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenConfirmationDialog();", true);
    }

    protected void Delete_Confirmation_Click(object sender, EventArgs e)
    {
        DeletePost(imageToDelete);
        Page_Load(sender, e);
    }

    private void DeletePost(string imageToDelete)
    {
        foreach (Post post in posts)
        {
            if (post.ImageName == imageToDelete)
            {
                posts.Remove(post);
                break;
            }
        }
        FileManager.WriteToBinaryFile(Server.MapPath(Security.FILE_BOARD_POSTS), posts);
    }

    private void saveImage(string fileName)
    {
        uploadFile.SaveAs(Server.MapPath(Security.DIR_BOARD_IMG + "/" + fileName));
    }

    private void savePost(string fileName)
    {
        string comment = inputComments.InnerText;
        posts.Add(new Post(Security.DIR_BOARD_IMG + "/" + fileName, comment));

        FileManager.WriteToBinaryFile(Server.MapPath(Security.FILE_BOARD_POSTS), posts);
    }
}