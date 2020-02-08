using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class Register : System.Web.UI.Page
{
    DataClassesDataContext cat=new DataClassesDataContext();
    bool userid;
    bool email;
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        
        var userdetailsId = (from tbl in cat.UserRegisters
                             select tbl).ToList();

        foreach (var Id in userdetailsId)
        {
            if (Id.UserName == txtUserName.Text)
            {
                lblMsg.Text = "UserName Already Exists.";
                txtUserName.Text = "";
                userid = true;
            }
            if (Id.Email == txtEmail.Text)
            {
                lblEMsg.Text = "E-mail Id Already Exists.";
                txtEmail.Text = "";
                email = true;
            }
        }
        if(userid==false && email==false)        
        {
           
                   
                string pass = MD5Hash(txtPassword.Text);
                using (DataClassesDataContext tblReg = new DataClassesDataContext())
                {
                    UserRegister insert = new UserRegister();
                    insert.FirstName = txtFirstName.Text;
                    insert.LastName = txtLastName.Text;
                    insert.Email = txtEmail.Text;
                    insert.Password = pass;
                    insert.SQuestion = drpSQuestion.SelectedValue;
                    insert.SAnswer = txtSAnswer.Text;
                    insert.UserName = txtUserName.Text;

                    if (chkNewsLetter.Checked == true)
                    {
                        insert.NewsLetter = 1;
                    }
                    else
                    {
                        insert.NewsLetter = 0;
                    }
                    insert.InsertionDate = DateTime.Now;
                    tblReg.UserRegisters.InsertOnSubmit(insert);
                    tblReg.SubmitChanges();
                    Session["username"] = txtUserName.Text;
                    Response.Redirect("User.aspx");
                }
                   
            }
        }
    }
   

 