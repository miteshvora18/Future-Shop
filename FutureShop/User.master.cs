using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;

public partial class User : System.Web.UI.MasterPage
{
    string conn = System.Configuration.ConfigurationManager.ConnectionStrings["FutureShopConnectionString12"].ConnectionString;
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
                       where tblUser.UserName == Session["username"]
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
        divGold.Visible = false;
        divPlatinum.Visible = false;
        divSilver.Visible = false;
        divNoOffer.Visible = true;
        lnkLogOut.Visible = false;
        var offer = (from tblUser in cat.UserRegisters
                     where tblUser.FirstName == Session["username"].ToString()
                     select tblUser.PlanSelected).FirstOrDefault();
        if (offer == "Silver")
        {
            divSilver.Visible = true;
            var schemeid = (from tblPlan in cat.Schemes
                            where tblPlan.PlanName == "Silver"
                            select new { tblPlan.PlanID,tblPlan.DiscountInPercentage }).FirstOrDefault();
            //var plan = (from tblPlan in cat.Discounts
            //            where tblPlan.SchemeID == schemeid
            //            select tblPlan.DiscountInPercentage).FirstOrDefault();
            lblOffer.Text = schemeid.DiscountInPercentage.ToString();
        }
        else if (offer == "Gold")
        {
            divGold.Visible = true;
            var schemeid = (from tblPlan in cat.Schemes
                            where tblPlan.PlanName == "Gold"
                            select new { tblPlan.PlanID, tblPlan.DiscountInPercentage }).FirstOrDefault();
            //var plan = (from tblPlan in cat.Discounts
            //            where tblPlan.SchemeID == schemeid
            //            select tblPlan.DiscountInPercentage).FirstOrDefault();
            Label10.Text = schemeid.DiscountInPercentage.ToString();
        }
        else if (offer == "Platinum")
        {
            divPlatinum.Visible = true;
            var schemeid = (from tblPlan in cat.Schemes
                            where tblPlan.PlanName == "Platinum"
                            select new { tblPlan.PlanID, tblPlan.DiscountInPercentage }).FirstOrDefault();
            //var plan = (from tblPlan in cat.Discounts
            //            where tblPlan.SchemeID == schemeid
            //            select tblPlan.DiscountInPercentage).FirstOrDefault();
            Label12.Text = schemeid.DiscountInPercentage.ToString();
        }

        
        
        if (Session["username"] == null)
        {
            lblUName.Text = "Welcome Guest...";
        }
        else if (Session["username"] != null)
        {
            lblUName.Text = "Welcome " + Session["username"].ToString() + "...";
            lnkLogOut.Visible = true;
        }
        DateTime isdate = DateTime.Now;
        SqlConnection con = new SqlConnection(conn);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from DealOfDay where convert(date,InsertionDate)=convert(date,@date)", con);
        cmd.Parameters.AddWithValue("@date", isdate);
        cmd.ExecuteNonQuery();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            int pid = 0;
            while (dr.Read())
            {
                pid = Convert.ToInt32(dr["PID"]);
            }
            pnlDealValid.Visible = true;
            pnlInValidDeal.Visible = false;
            
                var panelvisible = (from tblDeal in cat.DealOfDays
                                    where tblDeal.PID == pid
                                    orderby tblDeal.InsertionDate descending
                                    select new { tblDeal.PID, tblDeal.ListPrice, tblDeal.TodaysDiscount_InPercent, tblDeal.TodaysDeal, tblDeal.DiscountedPrice });
                var visible = panelvisible.First();

                var productname = (from tblProducts in cat.Products
                                   where tblProducts.PID == visible.PID
                                   select new { tblProducts.Description, tblProducts.TotalQuantity, tblProducts.ProductName, tblProducts.PicPath }).FirstOrDefault();

                lblProductName.Text = productname.ProductName;
                lblDescription.Text = productname.Description;
                lblListPrice.Text = visible.ListPrice.ToString() + " Rs";
                lblOffPercent.Text = visible.TodaysDiscount_InPercent.ToString() + "%";
                lblTodaysDiscount.Text = visible.DiscountedPrice.ToString() + " Rs";
                lblDealPrice.Text = visible.TodaysDeal.ToString() + " Rs";
                //Session["image"] = productname.PicPath;
                imgDealOfDay.Visible = true;
                imgDealOfDay.ImageUrl = productname.PicPath;
        }
        else
        {
            pnlDealValid.Visible = false;
            pnlInValidDeal.Visible = true;
        }
        
            if (drpChoice.SelectedValue == "Category")
            {
                var sname = from tblCat in cat.Categories
                            select tblCat.CategoryName;
                RadSearchBox.DataSource = sname;
                RadSearchBox.DataBind();
            }
            else if (drpChoice.SelectedValue == "SubCategory")
            {
                var scname = from tblSCat in cat.SubCategories
                             select tblSCat.SCategoryName;
                RadSearchBox.DataSource = scname;
                RadSearchBox.DataBind();
            }
            else if (drpChoice.SelectedValue == "Products")
            {
                var pname = from tblProduct in cat.Products
                            select tblProduct.ProductName;
                RadSearchBox.DataSource = pname;
                RadSearchBox.DataBind();
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
        Response.Redirect("Membership.aspx");
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
        Session.Abandon();
        Profile.SCart.Items.Clear();
        Application["cartcount"] = null;
        Response.Redirect("Home.aspx");
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
    protected void btnCart_Click(object sender, EventArgs e)
    {
       
            var product = (from tblProduct in cat.Products
                           where tblProduct.ProductName == lblProductName.Text
                           select new { tblProduct.PID, tblProduct.PicPath }).FirstOrDefault();

            string pname = lblProductName.Text;
            int pid = product.PID;
            string path = product.PicPath;

            string str = lblDealPrice.Text;
            string strSplit = " Rs";
            StringBuilder strB = new StringBuilder("", 200);

            Regex r = new Regex(strSplit);
            string[] s = r.Split(str);

            foreach (object o in s)
            {
                strB.Append(o.ToString());
            }

            string p = strB.ToString();
            int price = Convert.ToInt32(p);

            if (Profile.SCart == null)
            {
                Profile.SCart = new ShoppingCartExample.Cart();
            }
            Profile.SCart.Insert(pid, price, 1, pname, path);
            Application["cartcount"] = Profile.SCart.Items.Count();
            Response.Redirect("User.aspx");
        
    }
    protected void lnkAdvanceSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search.aspx");
    }
    protected void lnkUpgrade_Click(object sender, EventArgs e)
    {

    }
   
}
