using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthorizeNet;
using System.Text;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;

public partial class CreditCard : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    List<int> pidList=new List<int>();
    List<int> qtyList = new List<int>();
    List<int> subtotList = new List<int>();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        pidList = (List<int>)Session["product"];
        qtyList = (List<int>)Session["quantity"];
        subtotList = (List<int>)Session["subtotal"];
        divCreditCard.Visible = true;
        //divSuccess.Visible = false;
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
            //divSuccess.Visible = false;
            //divFailed.Visible = true;
            //Label11.Text = "Please Enter Valid Credit Card Number and";
        }
    }
    public void authenticate(string a)
    {
        //step 1 - create the request       
        //var request = new AuthorizationRequest(a, "1216", 10.00M,
        //         "Test Transaction");
        string str = Session["gtotal"].ToString();
        string strSplit = "Rs ";
        StringBuilder strB = new StringBuilder("", 200);

        Regex r = new Regex(strSplit);
        string[] s = r.Split(str);

        foreach (object o in s)
        {
            strB.Append(o.ToString());
        }

        string ab = strB.ToString();
        int tot = Convert.ToInt32(ab);
        var request = new AuthorizationRequest(a, txtExpiryDate.Text, Convert.ToDecimal(tot),
               "Test Transaction");

        //step 2 - create the gateway, sending in your credentials
        var gate = new Gateway("7m3q7BT6", "4a593h7hQXM4v8k6");

        //step 3 - make some money
        var response = gate.Send(request);
        
        if (Convert.ToInt32(response.ResponseCode) == 1)
        {
            Billingdetail insert = new Billingdetail();            
            insert.UserId= Convert.ToInt32(Session["userid"]);
            insert.FullName = Session["fullname"].ToString();
            insert.ShippingAdd=Session["shippingadd"].ToString();
            insert.Region=Session["region"].ToString();
            insert.District=Session["district"].ToString();
            insert.Total = Convert.ToInt32(Session["total"]);
            insert.ShippingCharges = Convert.ToInt32(Session["shipcharge"]);
            insert.GTotal = Convert.ToInt32(Session["gtotal"]);
            insert.TransactionId = Convert.ToDecimal(response.TransactionID);
            insert.InsertionDate = DateTime.Now;
            cat.Billingdetails.InsertOnSubmit(insert);
            cat.SubmitChanges();

            var orderid = (from tblBill in cat.Billingdetails
                           where tblBill.UserId == Convert.ToInt32(Session["userid"])
                           orderby tblBill.BillingId descending
                           select tblBill.BillingId);

            var oid = orderid.First();
            for(int i=0;i<pidList.Count;i++)
            {
                for(int j=i;j<=i;j++)
                {
                    for(int k=i;k<=i;k++)
                    {
                        OrderProductDetail insertnew = new OrderProductDetail();
                        insertnew.BillingID = oid;
                        insertnew.PID = pidList[i];
                        insertnew.Qty = qtyList[j];
                        insertnew.SubTotal = subtotList[k];
                        insertnew.InsertionDate = DateTime.Now;
                        cat.OrderProductDetails.InsertOnSubmit(insertnew);

                        var qty = (from tblProduct in cat.Products
                                   where tblProduct.PID == pidList[i]
                                   select tblProduct).SingleOrDefault();
                        qty.TotalQuantity = qty.TotalQuantity - qtyList[j];
                        cat.SubmitChanges();
                    } 
                }                
               
            }
            
            cat.SubmitChanges();
            Profile.SCart.Items.Clear();
            Application["cartcount"] = null;
            txtCreditCard.Text = "";
            divCreditCard.Visible = false;
            //divSuccess.Visible = true;
            //divFailed.Visible = false;
            //Label15.Visible = true;
            //lblTransaction.Visible = true;
            Session["amount"]=response.Amount.ToString();
            Session["transactionid"] = response.TransactionID;
            var email = (from tblUser in cat.UserRegisters
                         where tblUser.UserName == Session["username"]
                         select tblUser).FirstOrDefault();


            string FromEmail = "airlinesairindia@gmail.com";
            //string ToMail = email.Email;
            string ToMail = "miteshvora18@gmail.com";
            MailMessage ms = new MailMessage(FromEmail, ToMail);
            ms.Subject = "Transaction Details";
            ms.IsBodyHtml = true;
            string Body = "<b>Welcome to FutureShop.com!!</b><br><BR>Online resource for shopping.<BR><BR>Your TransactionID is : " + Session["transactionid"] + "<BR> Transaction Amount is : Rs " + Session["amount"] +"<BR><b>Thank you for shopping with us</b>";
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
            Response.Redirect("Transaction.aspx");
        }
        else
        { 
            txtCreditCard.Text = "";
            divCreditCard.Visible = false;
            //divSuccess.Visible = false;
            divFailed.Visible = true;
            Label11.Text = response.Message;
            
        }
    }
    protected void btnOkFailed_Click(object sender, EventArgs e)
    {
        divCreditCard.Visible = true;
        //divSuccess.Visible = false;
        divFailed.Visible = false;
    }
   
}