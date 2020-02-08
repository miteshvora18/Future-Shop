using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

public partial class SelectedProduct : System.Web.UI.Page
{
    static int SCID;
    static string path = "";
    static int pid = 0;
    bool offers;
    static int qty;
    static string plan; 
    static string off;
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }
            divdiscount.Visible = false;
            lblNoMatch.Visible = false;
            Label5.Visible = false;
            btnCart.Visible = false;
            if (Session["username"] != null)
            {
                var type = (from tblUser in cat.UserRegisters
                            where tblUser.PlanSelected == null && tblUser.UserName == Session["username"]
                            select tblUser).FirstOrDefault();
                if (type != null)
                {
                    plan = "User";
                }
                else
                {
                    var types = (from tblUser in cat.UserRegisters
                                 where tblUser.PlanSelected != null && tblUser.UserName == Session["username"]
                                 select tblUser).FirstOrDefault();
                    plan = "Member";
                    off = types.PlanSelected;
                }
            }
            else
            {
                var types = (from tblUser in cat.UserRegisters
                             where tblUser.PlanSelected != null
                             select tblUser).FirstOrDefault();
                plan = "Member";
                off = types.PlanSelected;
            }
            if (Request.QueryString["PID"] != null)
            {
                pid = Convert.ToInt32(Request.QueryString["PID"]);
            }
            else if (Session["pid"] != null)
            {
                pid = Convert.ToInt32(Session["pid"]);
            }
            if (pid == 0)
            {
                lblNoMatch.Visible = true;
            }
            else
            {
                if (plan == "User")
                {
                    var offer = (from tblOffer in cat.ProductOffers
                                 where tblOffer.PID == pid && tblOffer.InsertionDate == DateTime.Now && tblOffer.Type == "User"
                                 select tblOffer).FirstOrDefault();

                    Label5.Visible = true;
                    btnCart.Visible = true;
                    var product = (from tblProduct in cat.Products
                                   where tblProduct.PID == pid
                                   select new { tblProduct.CID, tblProduct.SCID, tblProduct.PID, tblProduct.PicPath, tblProduct.Price, tblProduct.ProductName, tblProduct.TotalQuantity, tblProduct.BrandName, tblProduct.Description }).FirstOrDefault();
                    if (offer != null)
                    {
                        divdiscount.Visible = true;
                        lblOffer.Text = offer.Offer.ToString() + " % Off";
                        lblListPrice.Text = "Rs " + product.Price.ToString();
                        int calpercentage = (product.Price * offer.Offer) / 100;
                        lblDisPrice.Text = "(-) Rs " + calpercentage.ToString();
                        int totaldeal = product.Price - calpercentage;
                        lblTotDeal.Text = "Rs " + totaldeal.ToString();
                        offers = true;
                    }
                    else
                    {
                        offers = false;
                    }
                    SCID = product.CID;
                    imgProduct.ImageUrl = product.PicPath;
                    lblDescription.Text = product.Description;
                    lblPrice.Text = Convert.ToString(product.Price);
                    lblProductName.Text = product.ProductName;
                    lblQty.Text = "Hurry....only " + product.TotalQuantity + " products left !";
                    qty = product.TotalQuantity;
                    path = product.PicPath;
                }
                else
                {
                    if (off == "Gold")
                    {
                        var offer = (from tblOffer in cat.ProductOffers
                                     where tblOffer.PID == pid && tblOffer.InsertionDate == DateTime.Now && tblOffer.Type == "Member" && tblOffer.Plans == "Gold"
                                     select tblOffer).FirstOrDefault();

                        Label5.Visible = true;
                        btnCart.Visible = true;
                        var product = (from tblProduct in cat.Products
                                       where tblProduct.PID == pid
                                       select new { tblProduct.CID, tblProduct.SCID, tblProduct.PID, tblProduct.PicPath, tblProduct.Price, tblProduct.ProductName, tblProduct.TotalQuantity, tblProduct.BrandName, tblProduct.Description }).FirstOrDefault();
                        if (offer != null)
                        {
                            divdiscount.Visible = true;
                            lblOffer.Text = offer.Offer.ToString() + " % Off";
                            lblListPrice.Text = "Rs " + product.Price.ToString();
                            int calpercentage = (product.Price * offer.Offer) / 100;
                            lblDisPrice.Text = "(-) Rs " + calpercentage.ToString();
                            int totaldeal = product.Price - calpercentage;
                            lblTotDeal.Text = "Rs " + totaldeal.ToString();
                            offers = true;
                        }
                        else
                        {
                            offers = false;
                        }
                        SCID = product.CID;
                        imgProduct.ImageUrl = product.PicPath;
                        lblDescription.Text = product.Description;
                        lblPrice.Text = Convert.ToString(product.Price);
                        lblProductName.Text = product.ProductName;
                        lblQty.Text = "Hurry....only " + product.TotalQuantity + " products left !";
                        qty = product.TotalQuantity;
                        path = product.PicPath;
                    }
                    else if (off == "Silver")
                    {
                        var offer = (from tblOffer in cat.ProductOffers
                                     where tblOffer.PID == pid && tblOffer.InsertionDate == DateTime.Now && tblOffer.Type == "Member" && tblOffer.Plans == "Silver"
                                     select tblOffer).FirstOrDefault();

                        Label5.Visible = true;
                        btnCart.Visible = true;
                        var product = (from tblProduct in cat.Products
                                       where tblProduct.PID == pid
                                       select new { tblProduct.CID, tblProduct.SCID, tblProduct.PID, tblProduct.PicPath, tblProduct.Price, tblProduct.ProductName, tblProduct.TotalQuantity, tblProduct.BrandName, tblProduct.Description }).FirstOrDefault();
                        if (offer != null)
                        {
                            divdiscount.Visible = true;
                            lblOffer.Text = offer.Offer.ToString() + " % Off";
                            lblListPrice.Text = "Rs " + product.Price.ToString();
                            int calpercentage = (product.Price * offer.Offer) / 100;
                            lblDisPrice.Text = "(-) Rs " + calpercentage.ToString();
                            int totaldeal = product.Price - calpercentage;
                            lblTotDeal.Text = "Rs " + totaldeal.ToString();
                            offers = true;
                        }
                        else
                        {
                            offers = false;
                        }
                        SCID = product.CID;
                        imgProduct.ImageUrl = product.PicPath;
                        lblDescription.Text = product.Description;
                        lblPrice.Text = Convert.ToString(product.Price);
                        lblProductName.Text = product.ProductName;
                        lblQty.Text = "Hurry....only " + product.TotalQuantity + " products left !";
                        qty = product.TotalQuantity;
                        path = product.PicPath;
                    }
                    else if (off == "Platinum")
                    {
                        var offer = (from tblOffer in cat.ProductOffers
                                     where tblOffer.PID == pid && tblOffer.InsertionDate == DateTime.Now && tblOffer.Type == "Member" && tblOffer.Plans == "Platinum"
                                     select tblOffer).FirstOrDefault();

                        Label5.Visible = true;
                        btnCart.Visible = true;
                        var product = (from tblProduct in cat.Products
                                       where tblProduct.PID == pid
                                       select new { tblProduct.CID, tblProduct.SCID, tblProduct.PID, tblProduct.PicPath, tblProduct.Price, tblProduct.ProductName, tblProduct.TotalQuantity, tblProduct.BrandName, tblProduct.Description }).FirstOrDefault();
                        if (offer != null)
                        {
                            divdiscount.Visible = true;
                            lblOffer.Text = offer.Offer.ToString() + " % Off";
                            lblListPrice.Text = "Rs " + product.Price.ToString();
                            int calpercentage = (product.Price * offer.Offer) / 100;
                            lblDisPrice.Text = "(-) Rs " + calpercentage.ToString();
                            int totaldeal = product.Price - calpercentage;
                            lblTotDeal.Text = "Rs " + totaldeal.ToString();
                            offers = true;
                        }
                        else
                        {
                            offers = false;
                        }
                        SCID = product.CID;
                        imgProduct.ImageUrl = product.PicPath;
                        lblDescription.Text = product.Description;
                        lblPrice.Text = Convert.ToString(product.Price);
                        lblProductName.Text = product.ProductName;
                        lblQty.Text = "Hurry....only " + product.TotalQuantity + " products left !";
                        qty = product.TotalQuantity;
                        path = product.PicPath;
                    }





                }
            }
        }
        catch (Exception h)
        {

        }
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session["username"] = "Guest";
        Profile.SCart.Items.Clear();
        Response.Redirect("Home.aspx");
    }
    protected void btnCart_Click(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('You need to register with us to avail our services...'); Response.Redirect('Register.aspx');", true);
        }
        else
        {
            if (qty == 0)
            {
                // btnCart.Enabled = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Sorry this product is out of stock...'); Response.Redirect('Register.aspx');", true);
            }
            else
            {
                string pname = lblProductName.Text;
                int price = Convert.ToInt32(lblPrice.Text);

                if (Profile.SCart == null)
                {
                    Profile.SCart = new ShoppingCartExample.Cart();
                }
                if (offers == true)
                {
                    string str = lblTotDeal.Text;
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
                    Profile.SCart.Insert(pid, tot, 1, pname, path);
                }
                else
                {
                    Profile.SCart.Insert(pid, price, 1, pname, path);
                }
                Application["cartcount"] = Profile.SCart.Items.Count();
                Session["cid"] = SCID;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Item has been added to your cart'); window.location='SubCategories.aspx';", true);
                //Response.Redirect("SubCategories.aspx?Parameter=" + SCID);
            }
        }   
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}