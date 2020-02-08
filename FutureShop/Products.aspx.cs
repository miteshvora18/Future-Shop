using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Products : System.Web.UI.Page
{
    int scid;
    static string plan;
    static string offer;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                ViewState["RefUrl"] = Request.UrlReferrer.ToString();

            }
            lblNoMatch.Visible = false;
            if (Request.QueryString["Parameter"] != null)
            {
                scid = Convert.ToInt32(Request.QueryString["Parameter"]);
            }
            else
            {
                scid = Convert.ToInt32(Session["scid"]);
            }
            if (scid == 0)
            {
                lblNoMatch.Visible = true;
            }
            using (DataClassesDataContext cat = new DataClassesDataContext())
            {
                var scname = (from tblCat in cat.SubCategories
                              where tblCat.SCID == scid
                              select tblCat.SCategoryName).FirstOrDefault();
                lblProduct.Text = scname;

                var dlist = (from tblCat in cat.Products
                             where tblCat.SCID == scid
                             select new { tblCat.ProductName, tblCat.PID, tblCat.SCID, tblCat.PicPath }).ToList();


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
                        offer = types.PlanSelected;
                    }
                    DataList1.DataSource = dlist;
                    DataList1.DataBind();
                }
                else
                {
                    var types = (from tblUser in cat.UserRegisters
                                 where tblUser.PlanSelected != null
                                 select tblUser).FirstOrDefault();
                    plan = "Member";
                    offer = types.PlanSelected;

                    DataList1.DataSource = dlist;
                    DataList1.DataBind();
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
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int id = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
        Session["pid"] = id;
       
        Response.Redirect("SelectedProduct.aspx");
    }
    List<string> pname = new List<string>();
    protected void btnCompare_Click(object sender, EventArgs e)
    {
        foreach (DataListItem li in DataList1.Items)
        {
            CheckBox cb = li.FindControl("SelectedCheckBox") as CheckBox;

            if (cb != null)
            {
                if (cb.Checked)
                {
                    Label lbl = li.FindControl("lblPName") as Label;
                    pname.Add(lbl.Text);
                    if (pname.Count > 3)
                    {
                        
                        pname.Clear();
                        Session["pname"] = pname;
                    }
                    else
                    {
                        Session["pname"] = pname;
                    }
                }
            }
        }
        if (pname.Count() == 1)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Select atleast 2 products to compare!')", true);
        }
        else if (pname.Count() != 0)
        {
            Response.Redirect("Compare.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You can select only 3 items at a time')", true);
        }
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string GetDynamicContent(string contextKey)
    {
        return default(string);
    }
   

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        int id = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
        using (DataClassesDataContext cat = new DataClassesDataContext())
        {
           
            var product = (from tblProducts in cat.Products
                           where tblProducts.PID == id
                           select tblProducts).FirstOrDefault();
            Label l = e.Item.FindControl("lblSoldOut") as Label;
            if (product.TotalQuantity == 0)
            {                
                ImageButton img = e.Item.FindControl("imgProducts") as ImageButton;
                //img.Enabled = false;
                l.Visible = true;

            }
            else 
            {
                l.Text = product.TotalQuantity.ToString();
            }
            Label o = e.Item.FindControl("lblOffer") as Label;
            string dates = Convert.ToDateTime(DateTime.Now).ToShortDateString();
            
            if (plan == "User")
            {
                var products = (from tblOffer in cat.ProductOffers
                                where tblOffer.PID == id && tblOffer.Type == "User"
                                orderby tblOffer.InsertionDate descending
                                //select new { tblOffer.Offer, tblOffer.StartDate, tblOffer.EndDate }).FirstOrDefault();
                                select new { tblOffer.Offer,tblOffer.InsertionDate }).FirstOrDefault();
                if (products != null)
                {
                    string date = Convert.ToDateTime(products.InsertionDate).ToShortDateString();
                    //string enddate = Convert.ToDateTime(products.EndDate).ToShortDateString();
                    DateTime edate = Convert.ToDateTime(date);
                    string isdate = DateTime.Now.ToShortDateString();
                    DateTime idate = Convert.ToDateTime(isdate);
                    if (edate == idate)
                    {
                        o.Text = products.Offer.ToString() + "% Off";
                    }
                }
                else
                {
                    o.Visible = false;
                }
            }
            else
            {
                if (offer == "Gold")
                {
                    var products = (from tblOffer in cat.ProductOffers
                                    where tblOffer.PID == id && tblOffer.Plans == "Gold" && tblOffer.Type == "Member"
                                    select new { tblOffer.Offer, tblOffer.InsertionDate }).FirstOrDefault();

                    if (products != null)
                    {
                        string date = Convert.ToDateTime(products.InsertionDate).ToShortDateString();
                        //string enddate = Convert.ToDateTime(products.EndDate).ToShortDateString();
                        DateTime edate = Convert.ToDateTime(date);
                        string isdate = DateTime.Now.ToShortDateString();
                        DateTime idate = Convert.ToDateTime(isdate);
                        if (edate == idate)
                        {
                            o.Text = products.Offer.ToString() + "% Off";
                        }
                    }
                    else
                    {
                        o.Visible = false;
                    }
                }
                else if (offer == "Silver")
                {
                    var products = (from tblOffer in cat.ProductOffers
                                    where tblOffer.PID == id && tblOffer.Plans == "Silver" && tblOffer.Type == "Member"
                                    select new { tblOffer.Offer, tblOffer.InsertionDate }).FirstOrDefault();

                    if (products != null)
                    {
                        string date = Convert.ToDateTime(products.InsertionDate).ToShortDateString();
                        //string enddate = Convert.ToDateTime(products.EndDate).ToShortDateString();
                        DateTime edate = Convert.ToDateTime(date);
                        string isdate = DateTime.Now.ToShortDateString();
                        DateTime idate = Convert.ToDateTime(isdate);
                        if (edate == idate)
                        {
                            o.Text = products.Offer.ToString() + "% Off";
                        }
                    }
                    else
                    {
                        o.Visible = false;
                    }

                }
                else if (offer == "Platinum")
                {
                    var products = (from tblOffer in cat.ProductOffers
                                    where tblOffer.PID == id && tblOffer.Plans == "Platinum" && tblOffer.Type == "Member"
                                    select new { tblOffer.Offer, tblOffer.InsertionDate }).FirstOrDefault();

                    if (products != null)
                    {
                        string date = Convert.ToDateTime(products.InsertionDate).ToShortDateString();
                        //string enddate = Convert.ToDateTime(products.EndDate).ToShortDateString();
                        DateTime edate = Convert.ToDateTime(date);
                        string isdate = DateTime.Now.ToShortDateString();
                        DateTime idate = Convert.ToDateTime(isdate);
                        if (edate == idate)
                        {
                            o.Text = products.Offer.ToString() + "% Off";
                        }
                    }
                    else
                    {
                        o.Visible = false;
                    }
                
                }
            
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