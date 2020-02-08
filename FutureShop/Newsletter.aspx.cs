using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Newsletter : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();       
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubscribe_Click(object sender, EventArgs e)
    {        
        var emails = (from tblUser in cat.UserRegisters
                        where tblUser.Email == txtEmail.Text
                        select tblUser).SingleOrDefault();
        if (emails == null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Register with us to avail with our services')", true);
            txtEmail.Text = "";
        }
        else
        {
            if (emails.NewsLetter == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You are already subscribed to our newsletter')", true);
                txtEmail.Text = "";
            }
            else
            {
                emails.NewsLetter = 1;
                emails.ModificationDate = DateTime.Now;
                cat.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thankyou for Subscribing..You will recieve our newsletter with best deals!')", true);
                txtEmail.Text = "";
            }
        }        
    }

    protected void lnkUnSubscribe_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please specify a EmailID !')", true);
        }
        else
        {
        
            var newsletter = (from tblUser in cat.UserRegisters
                              where tblUser.Email == txtEmail.Text
                              select tblUser).SingleOrDefault();
        
            if (newsletter == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You are not subscribed with us !')", true);
                txtEmail.Text = "";
            }
            else
            {
                newsletter.NewsLetter = 0;
                newsletter.ModificationDate = DateTime.Now;
                cat.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have been successfully unsubscribed !')", true);
                txtEmail.Text = "";
            }
        }

    }
}