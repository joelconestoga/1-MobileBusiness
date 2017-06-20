using System;
using System.Collections;
using System.Collections.Generic;

[Serializable]
public class Post
{
    public string ImageName { get; set; }
    public string Comment { get; set; }
    public DateTime Date { get; set; }

    public Post(string imageName, string comment)
    {
        this.ImageName = imageName;
        this.Comment = comment;
        this.Date = System.DateTime.Now;
    }

}


public class PostComparer : IComparer<Post>
{
    public int Compare(Post x, Post y)
    {
        if (x.Date == y.Date)
            return 0;

        return x.Date < y.Date ? -1 : 1;
    }
}