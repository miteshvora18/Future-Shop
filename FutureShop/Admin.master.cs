using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        lnkRegister.Visible = false;
        Label2.Visible = false;
        lnkSignIn.Visible = false;

       

        if (Session["username"] == null)
        {
            Label1.Visible = true;
            lnkRegister.Visible = true;
            Label2.Visible = true;
            lnkSignIn.Visible = true;
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
        using (DataClassesDataContext cat = new DataClassesDataContext())
        {
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
    }
    protected void lnkSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void lnkRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
    protected void lnkMember_Click(object sender, EventArgs e)
    {
        Response.Redirect("BeMember.aspx");
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
        Session.RemoveAll();
        Profile.SCart.Items.Clear();
        Response.Redirect("Home.aspx");
    }
    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        using (DataClassesDataContext cat = new DataClassesDataContext())
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

    }
    protected void lnkAdvanceSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search.aspx");
    }
    protected void lnkAddCat_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCategories.aspx");
    }
    protected void lnkAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProducts.aspx");
    }
    protected void lnkDealOfDay_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddDealOfDAy.aspx");
    }   
    protected void lnkSchemes_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddOffer.aspx");
    }
    protected void lnkNewsLetter_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewsLetter.aspx");
    }
}
