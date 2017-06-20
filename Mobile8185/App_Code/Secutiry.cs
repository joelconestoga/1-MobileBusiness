using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

public class Security
{
    public const string DIR_BOARD = "~/board-content";
    public const string DIR_BOARD_IMG = DIR_BOARD + "/img";
    public const string FILE_BOARD_POSTS = DIR_BOARD + "/Posts.txt";
    public const string FILE_MAILING = DIR_BOARD + "/Mailing.txt";
    public const string FILE_FEEDBACK = DIR_BOARD + "/Feedbacks.txt";

    private const string ADMIN_USR = "admin";
    private const string ADMIN_PWD = "123";

    public Security()
    {
    }

    public static bool Authenticate(string user, string pass, HttpSessionState Session)
    {
        if (!ADMIN_USR.Equals(user) || !ADMIN_PWD.Equals(pass))
        {
            Session["username"] = "";
            Session["password"] = "";
            return false;
        }

        Session["username"] = user;
        Session["password"] = pass;

        return true;
    }

    public static bool IsAuthenticated(HttpSessionState Session)
    {
        return ADMIN_USR.Equals(Session["username"]) && 
            ADMIN_PWD.Equals(Session["password"]);
    }

    public static void Logout(HttpSessionState Session)
    {
        Session["username"] = "";
        Session["password"] = "";
    }
}