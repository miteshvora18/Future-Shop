using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Net;


public partial class AddNewsLetter : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
    }
    public void EnsureDirectoriesExist()
    {
        // if the \pix directory doesn't exist - create it. 
        if (!System.IO.Directory.Exists(Server.MapPath(@"~/mail/")))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(@"~/mail/"));
        }
    }  
    protected void btnLetter_Click(object sender, EventArgs e)
    {
        EnsureDirectoriesExist();
        string filePath = Server.MapPath(@"~/mail/" + FileUpload1.FileName);
        FileUpload1.SaveAs(filePath);
        string path = @"mail/" + FileUpload1.FileName;
        var email = from tblUser in cat.UserRegisters
                    where tblUser.NewsLetter == 1
                    select tblUser.Email;
        List<string> Emailnews = new List<string>();
        foreach (var v in email)
        {
            Emailnews.Add(v);
        }

        foreach (string emailaddress in Emailnews)
        {
            string FromEmail = "airlinesairindia@gmail.com";
            //string ToMail = emailaddress;
            string ToMail = "miteshvora18@gmail.com";
            MailMessage ms = new MailMessage(FromEmail, ToMail);
            ms.Subject = txtSubject.Text;
            ms.IsBodyHtml = true;
            string Body = "<b><center>Welcome to FutureShop.com!!</center></b><br><BR><center>Online resource for shopping.</center><BR><BR><center><img hspace=0 src=\"cid:imageId\" align=baseline border=0 height=\"200\" width=\"300\" ><BR></center><center>" + txtBody.Text + "</center>";
            ms.Body = Body;
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(ms.Body, Encoding.UTF8, "text/html");
            LinkedResource imagelink = new LinkedResource(filePath, System.Net.Mime.MediaTypeNames.Image.Jpeg);
            imagelink.ContentId = "imageId";
            imagelink.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;
            htmlView.LinkedResources.Add(imagelink);
            ms.AlternateViews.Add(htmlView);

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = new NetworkCredential()
            {
                UserName = "miteshvora18@gmail.com",
                Password = "mahavir18"
            };
            smtp.EnableSsl = true;
            smtp.Send(ms);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('NewsLetter sent Successfully!')", true);
            lblMsg.Text = "Newsletter has been sent successfully!";
        }
        txtBody.Text = "";
        txtSubject.Text = "";
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}