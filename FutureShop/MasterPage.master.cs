using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Label1.Visible = false;
        lnkRegister.Visible = false;
        Label2.Visible = false;
        lnkSignIn.Visible = false;
        lnkMember.Visible = false;
        if (Session["username"] == null)
        {
            Label1.Visible = true;
            lnkRegister.Visible = true;
            Label2.Visible = true;
            lnkSignIn.Visible = true;
        }
        if (Session["username"] != null)
        {
            var mem = (from tblUser in cat.UserRegisters
                       where tblUser.FirstName == Session["username"]
                       select tblUser).FirstOrDefault();
            if (mem != null)
            {
                if (mem.PlanSelected == null)
                {
                    lnkMember.Visible = true;
                }
                else
                {
                    lnkMember.Visible = false;
                }
            }
            else
            { 
            
            }
        }
        
        if (Application["cartcount"] == null)
        {
            lblCount.Visible = false;
        }
        else
        {
            lblCount.Visible = true;
            lblCount.Text = Application["cartcount"].ToString();
        }
        lnkLogOut.Visible = false;
        if (Session["username"] == null)
        {
            lblUName.Text = "Welcome Guest...";
           
        }
        else if (Session["username"] != null)
        {
            lblUName.Text = "Welcome " + Session["username"].ToString() + "...";
            lnkLogOut.Visible = true;
        }
       
            //if (drpChoice.SelectedValue == "Category")
            //{
            //    var sname = from tblCat in cat.Categories
            //                select tblCat.CategoryName;
            //    RadSearchBox.DataSource = sname;                
            //    RadSearchBox.DataBind();
            //}
            //else if (drpChoice.SelectedValue == "SubCategory")
            //{
            //    var scname = from tblSCat in cat.SubCategories
            //                 select tblSCat.SCategoryName;
            //    RadSearchBox.DataSource = scname;               
            //    RadSearchBox.DataBind();
            //}
            //else if (drpChoice.SelectedValue == "Products")
            //{

            //    var pname = from tblProduct in cat.Products
            //                select tblProduct.ProductName;
            //    RadSearchBox.DataSource = pname;
            //    RadSearchBox.DataBind();
            //}  
        
           
    }
    protected void lnkSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void lnkRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
   
    protected void imbBtnShopNow_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("NewCategories.aspx");
    }
    protected void imgBtnCart_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        //Session["username"] = null;
       
        //this.Session.Abandon();


        Session.RemoveAll();
        
        Profile.SCart.Items.Clear();
        Application["cartcount"] = null;
        
        Response.Redirect("Home.aspx");
    }
    
    protected void lnkAdvanceSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search.aspx");
    }
   

    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        
       
            if (drpChoice.SelectedValue == "Category")
            {               
                var cid = (from tblCat in cat.Categories
                            where tblCat.CategoryName == RadSearchBox.Text
                           select tblCat.CID).FirstOrDefault();
               
                    Session["cid"] = cid;
                    Response.Redirect("SubCategories.aspx");
                
            }
            else if (drpChoice.SelectedValue == "SubCategory")
            {
                var scid = (from tblSC in cat.SubCategories
                            where tblSC.SCategoryName == RadSearchBox.Text
                            select tblSC.SCID).FirstOrDefault();
                
                    Session["scid"] = scid;
                    Response.Redirect("Products.aspx");
                
            }
            else if (drpChoice.SelectedValue == "Products")
            {
                var pid = (from tblProducts in cat.Products
                           where tblProducts.ProductName == RadSearchBox.Text
                           select tblProducts.PID).FirstOrDefault();
               
                    Session["pid"] = pid;
                    Response.Redirect("SelectedProduct.aspx");
                
            }
           
         

    }
    protected void lnkMember_Click(object sender, EventArgs e)
    {
        Response.Redirect("Membership.aspx");
    }
   
}
