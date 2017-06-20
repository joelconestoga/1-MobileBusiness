using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[Serializable]
public class Comment
{

    public string Email { get; set; }
    public string Name { get; set; }
    public string Feedback { get; set; }
    public DateTime Date { get; set; }

    public Comment()
    {        
    }
    
    public Comment(string email, string name, string feedback)
    {
        this.Email = email;
        this.Name = name;
        this.Feedback = feedback;
        this.Date = System.DateTime.Now;
    }
}