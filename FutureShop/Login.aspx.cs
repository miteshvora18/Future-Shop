using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    bool userid;
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
      divFPassword.Visible = false;
      divResetPassword.Visible = false;
      divLogin.Visible = true;
      txtUserName.Focus();
    }
    public static string MD5Hash(string text)
    {
        MD5 md5 = new MD5CryptoServiceProvider();

        //compute hash from the bytes of text
        md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

        //get hash result after compute it
        byte[] result = md5.Hash;

        StringBuilder strBuilder = new StringBuilder();
        for (int i = 0; i < result.Length; i++)
        {
            //change it into 2 hexadecimal digits
            //for each byte
            strBuilder.Append(result[i].ToString("x2"));
        }

        return strBuilder.ToString();

    } 
    
    protected void lnkFPassword_Click(object sender, EventArgs e)
    {        
        if (txtUserName.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter the username')", true);
        }
        else
        {
           var userdetailsId = (from tbl in cat.UserRegisters
                             select tbl).ToList();

           foreach (var Id in userdetailsId)
           {
               if (Id.UserName == txtUserName.Text)
               {                  
                   userid = true;
               }
           }
           if (userid == true)
           {
               Session["user"] = txtUserName.Text;
               divFPassword.Visible = true;
               divLogin.Visible = false;

               var ques = (from tblUser in cat.UserRegisters
                           where tblUser.UserName == Convert.ToString(Session["user"])
                           select tblUser.SQuestion).FirstOrDefault();
               lblQuestion.Text = ques;
               txtSAnswer.Focus();
           }
           else
           {
               ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter valid username')", true);
               txtUserName.Text = "";
           }


            
        }    
    }
    
    protected void btnCanPass_Click(object sender, EventArgs e)
    {
        divFPassword.Visible = false;
        divLogin.Visible = true;
        txtUserName.Focus();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text == "vibha" && txtPassword.Text == "12345")
        {
            Profile.SCart.Items.Clear();
            Session["username"] = "vibha";
            Response.Redirect("Admin.aspx");
        }
        else
        {
            string pass = MD5Hash(txtPassword.Text);
           
            var password = (from tblLogin in cat.UserRegisters
                            where tblLogin.UserName == txtUserName.Text && tblLogin.Password == pass
                            select tblLogin).FirstOrDefault();
            if (password != null)
            {
                Profile.SCart.Items.Clear();
                Session["username"] = txtUserName.Text;
                Response.Redirect("User.aspx");


            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('UserName and Password do not Match')", true);
            }
            
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btnSubFPassword_Click(object sender, EventArgs e)
    {        
        var ans = (from tblUser in cat.UserRegisters
                    where tblUser.UserName == Convert.ToString(Session["user"])
                    select new { tblUser.SAnswer,tblUser.Email,tblUser.Password }).FirstOrDefault();

        if (ans == null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please provide the right answer')", true);
        }
        else
        {
            divLogin.Visible = false;
            divFPassword.Visible = false;
            divResetPassword.Visible = true;
            txtNewPassword.Focus();
        }       
    }
    protected void btnSubReset_Click(object sender, EventArgs e)
    {       
        var newpass = (from tblUser in cat.UserRegisters
                        where tblUser.UserName == Convert.ToString(Session["user"])
                        select tblUser).SingleOrDefault();
        string pass = MD5Hash(txtNewPassword.Text);
        newpass.Password = pass;
        newpass.ModificationDate = DateTime.Now;
        cat.SubmitChanges();        
    }
    protected void btnCanReset_Click(object sender, EventArgs e)
    {
        divFPassword.Visible = true;
        divLogin.Visible = false;
        divResetPassword.Visible = false;
    }
}