using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthorizeNet;
using System.Net;
using System.Net.Mail;
using System.Text;

public partial class CreditCard : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();    
    protected void Page_Load(object sender, EventArgs e)
    {       
        divCreditCard.Visible = true;
        divSuccess.Visible = false;
        divFailed.Visible = false;
        System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {        

        if (txtCreditCard.Text == "370000000000002")
        {
            authenticate("370000000000002");
        }
        else if (txtCreditCard.Text == "6011000000000012")
        {
            authenticate("6011000000000012");
        }
        else if (txtCreditCard.Text == "4007000000027")
        {
            authenticate("4007000000027");
        }
        else
        {      
            txtCreditCard.Text = "";
            divCreditCard.Visible = false;
            divSuccess.Visible = false;
            divFailed.Visible = true;
            Label11.Text = "Please Enter Valid Credit Card Number";
        }
    }
    public void authenticate(string a)
    {
        //step 1 - create the request       
        //var request = new AuthorizationRequest(a, "1216", 10.00M,
        //         "Test Transaction");
        var request = new AuthorizationRequest(a, txtExpiryDate.Text, Convert.ToDecimal(Session["ToatalSum"]),
               "Test Transaction");

        //step 2 - create the gateway, sending in your credentials
        var gate = new Gateway("7m3q7BT6", "4a593h7hQXM4v8k6");

        //step 3 - make some money
        var response = gate.Send(request);
        if (Convert.ToInt32(response.ResponseCode) == 1)
        {
            var member = (from tblUser in cat.UserRegisters
                          where tblUser.UserName == Session["username"].ToString()
                          select tblUser).SingleOrDefault();
            member.PlanSelected = Session["plan"].ToString();
            member.PlanDuration = Convert.ToInt32(Session["time"]);
            member.ModificationDate = DateTime.Now;
            cat.SubmitChanges();


            var email = (from tblUser in cat.UserRegisters
                         where tblUser.UserName == Session["username"]
                         select tblUser).FirstOrDefault();


            string FromEmail = "airlinesairindia@gmail.com";
            //string ToMail = email.Email;
            string ToMail = "miteshvora18@gmail.com";
            MailMessage ms = new MailMessage(FromEmail, ToMail);
            ms.Subject = "Membership Transaction Details";
            ms.IsBodyHtml = true;
            string Body = "<b>Welcome to FutureShop.com!!</b><br><BR>Online resource for shopping.<BR><BR>Your TransactionID is : " + response.TransactionID + "<BR> Transaction Amount is : Rs " + response.Amount + "<BR><b>Thank you for registering with us as a member...</b>";
            ms.Body = Body;
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(ms.Body, Encoding.UTF8, "text/html");
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
            txtCreditCard.Text = "";
            divCreditCard.Visible = false;
            lblTransaction.Text = response.TransactionID;
            lblTotAmount.Text = "Rs "+response.Amount.ToString();
            divSuccess.Visible = true;
            divFailed.Visible = false;
           
        }
        else
        {           
          
            txtCreditCard.Text = "";
            divCreditCard.Visible = false;
            divSuccess.Visible = false;
            divFailed.Visible = true;
            Label11.Text = response.Message;
            
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        Response.Redirect("User.aspx");
    }
    protected void btnOkFailed_Click(object sender, EventArgs e)
    {
        divCreditCard.Visible = true;
        divSuccess.Visible = false;
        divFailed.Visible = false;
    }
}