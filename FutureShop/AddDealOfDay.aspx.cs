using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AddDealOfDay : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    string conn = System.Configuration.ConfigurationManager.ConnectionStrings["FutureShopConnectionString12"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            
        }
        RadDatePicker1.Attributes.Add("readonly", "readonly");
        Tab1.CssClass = "Clicked";
        MainView.ActiveViewIndex = 0;
        lblDCat.Visible = true;
        lblDSCat.Visible = true;
        lblDProduct.Visible = true;
        lblDiscount.Visible = true;
        
        if (!Page.IsPostBack)
        {
            var categor = from c in cat.Categories
                          select c.CategoryName;
            drpCategoryDeal.DataSource = categor;
            drpCategoryDeal.DataBind();
            drpCategoryDeal.Items.Insert(0, new ListItem("--Select--", string.Empty));

            drpEditCat.DataSource = categor;
            drpEditCat.DataBind();
            drpEditCat.Items.Insert(0, new ListItem("--Select--", string.Empty));
            
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
            drpCategoryDeal.Enabled = false;
            drpSCatDeal.Enabled = false;
            drpProductDeal.Enabled = false;
            txtDiscount.Enabled = false;
            btnSubmitDeal.Enabled = false;
            MainView.ActiveViewIndex = 0;

            divEditDeal.Visible = true;
            lblDealDisplay.Text = "Sorry there is already a deal present for today";
            drpCategoryDeal.SelectedIndex = 0;
           
            lblPrice.Text = "";
            lblQty.Text = "";
            txtDiscount.Text = "";
            divEditDeal.Visible = true;
            MainView.ActiveViewIndex = 0;
        }
    }

    protected void btnSubmitDeal_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (Convert.ToInt32(txtDiscount.Text) > 95)
        {
            lblError.Text = "Cannot be more than 95";
            txtDiscount.Text = "";
            txtDiscount.Focus();
        }
        else
        {
            int Price = Convert.ToInt32(lblPrice.Text);
            int discount = Convert.ToInt32(txtDiscount.Text);
            int calpercentage = (Price * discount) / 100;
            int totaldeal = Price - calpercentage;

            DateTime isdate = DateTime.Now;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from DealOfDay where convert(date,InsertionDate)=convert(date,@date)", con);
            cmd.Parameters.AddWithValue("@date", isdate);
            cmd.ExecuteNonQuery();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                drpCategoryDeal.Enabled = false;
                drpSCatDeal.Enabled = false;
                drpProductDeal.Enabled = false;
                txtDiscount.Enabled = false;
                btnSubmitDeal.Enabled = false;
                MainView.ActiveViewIndex = 0;
                divEditDeal.Visible = true;
                lblDealDisplay.Text = "Sorry there is already a deal present for today";
                drpCategoryDeal.SelectedIndex = 0;
                drpSCatDeal.SelectedIndex = 0;
                drpProductDeal.SelectedIndex = 0;
                lblPrice.Text = "";
                lblQty.Text = "";
                txtDiscount.Text = "";
                divEditDeal.Visible = true;
                MainView.ActiveViewIndex = 0;
            }
            else
            {
                drpCategoryDeal.Enabled = true;
                drpSCatDeal.Enabled = true;
                drpProductDeal.Enabled = true;
                txtDiscount.Enabled = true;
                btnSubmitDeal.Enabled = true;
                var pid = (from tblProduct in cat.Products
                           where tblProduct.ProductName == drpProductDeal.SelectedItem.Value
                           select tblProduct.PID).FirstOrDefault();

                DealOfDay inserts = new DealOfDay();
                inserts.PID = pid;
                inserts.ListPrice = Price;
                inserts.TodaysDiscount_InPercent = discount;
                inserts.DiscountedPrice = calpercentage;
                inserts.TodaysDeal = totaldeal;
                inserts.InsertionDate = DateTime.Now;
                cat.DealOfDays.InsertOnSubmit(inserts);
                cat.SubmitChanges();
                lblDealDisplay.Text = "Deal Of the Day has been added!";
                drpCategoryDeal.SelectedIndex = 0;
                drpSCatDeal.SelectedIndex = 0;
                drpProductDeal.SelectedIndex = 0;
                lblPrice.Text = "";
                lblQty.Text = "";
                txtDiscount.Text = "";
                divEditDeal.Visible = true;
                MainView.ActiveViewIndex = 0;

            }
        }
                       
    }
    protected void drpCategoryDeal_SelectedIndexChanged(object sender, EventArgs e)
    {
        MainView.ActiveViewIndex = 0;
        divEditDeal.Visible = true;
        if (drpCategoryDeal.SelectedIndex == 0)
        {
            drpCategoryDeal.BorderStyle = BorderStyle.Solid;
            drpCategoryDeal.BorderWidth = 2;
            drpCategoryDeal.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpCategoryDeal.BorderStyle = BorderStyle.NotSet;
            drpCategoryDeal.BorderWidth = 1;
            drpCategoryDeal.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
        var catid = (from tblCat in cat.Categories
                     where tblCat.CategoryName == drpCategoryDeal.SelectedItem.Value
                     select tblCat.CID).FirstOrDefault();

        var categor = from tblSCat in cat.SubCategories
                      where tblSCat.CID == catid
                      select tblSCat.SCategoryName;
        drpSCatDeal.DataSource = categor;
        drpSCatDeal.DataBind();
        drpSCatDeal.Items.Insert(0, new ListItem("--Select--", string.Empty));

        divEditDeal.Visible = true;
        MainView.ActiveViewIndex = 0;
    }
    protected void drpSCatDeal_SelectedIndexChanged(object sender, EventArgs e)
    {
        MainView.ActiveViewIndex = 0;
        divEditDeal.Visible = true;
        if (drpSCatDeal.SelectedIndex == 0)
        {
            drpSCatDeal.BorderStyle = BorderStyle.Solid;
            drpSCatDeal.BorderWidth = 2;
            drpSCatDeal.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpSCatDeal.BorderStyle = BorderStyle.NotSet;
            drpSCatDeal.BorderWidth = 1;
            drpSCatDeal.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
        var scatid = (from tblSCat in cat.SubCategories
                      where tblSCat.SCategoryName == drpSCatDeal.SelectedItem.Value
                      select tblSCat.SCID).FirstOrDefault();

        var products = from tblProduct in cat.Products
                       where tblProduct.SCID == scatid
                       select tblProduct.ProductName;
        drpProductDeal.DataSource = products;
        drpProductDeal.DataBind();
        drpProductDeal.Items.Insert(0, new ListItem("--Select--", string.Empty));


        divEditDeal.Visible = true;
        MainView.ActiveViewIndex = 0;
    }
    protected void drpProductDeal_SelectedIndexChanged(object sender, EventArgs e)
    {
        MainView.ActiveViewIndex = 0;
        divEditDeal.Visible = true;
        if (drpProductDeal.SelectedIndex == 0)
        {
            drpProductDeal.BorderStyle = BorderStyle.Solid;
            drpProductDeal.BorderWidth = 2;
            drpProductDeal.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpProductDeal.BorderStyle = BorderStyle.NotSet;
            drpProductDeal.BorderWidth = 1;
            drpProductDeal.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
        var product = (from tblProduct in cat.Products
                       where tblProduct.ProductName == drpProductDeal.SelectedItem.Value
                       select new { tblProduct.Price, tblProduct.TotalQuantity }).FirstOrDefault();
        lblPrice.Text = product.Price.ToString();
        lblQty.Text = product.TotalQuantity.ToString();

        divEditDeal.Visible = true;
        MainView.ActiveViewIndex = 0;
    }
    protected void drpEditCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        MainView.ActiveViewIndex = 1;
        EditDeal2.Visible = true;
        if (drpEditCat.SelectedIndex == 0)
        {
            drpEditCat.BorderStyle = BorderStyle.Solid;
            drpEditCat.BorderWidth = 2;
            drpEditCat.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpEditCat.BorderStyle = BorderStyle.NotSet;
            drpEditCat.BorderWidth = 1;
            drpEditCat.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
        var catid = (from tblCat in cat.Categories
                     where tblCat.CategoryName == drpEditCat.SelectedItem.Value
                     select tblCat.CID).FirstOrDefault();

        var categor = from tblSCat in cat.SubCategories
                      where tblSCat.CID == catid
                      select tblSCat.SCategoryName;
        drpEditSCat.DataSource = categor;
        drpEditSCat.DataBind();
        drpEditSCat.Items.Insert(0, new ListItem("--Select--", string.Empty));

        EditDeal2.Visible = true;
        MainView.ActiveViewIndex = 1;
    }

    protected void drpEditSCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        MainView.ActiveViewIndex = 1;
        EditDeal2.Visible = true;
        if (drpEditSCat.SelectedIndex == 0)
        {
            drpEditSCat.BorderStyle = BorderStyle.Solid;
            drpEditSCat.BorderWidth = 2;
            drpEditSCat.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpEditSCat.BorderStyle = BorderStyle.NotSet;
            drpEditSCat.BorderWidth = 1;
            drpEditSCat.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
        var scatid = (from tblSCat in cat.SubCategories
                      where tblSCat.SCategoryName == drpEditSCat.SelectedItem.Value
                      select tblSCat.SCID).FirstOrDefault();

        var products = from tblProduct in cat.Products
                       where tblProduct.SCID == scatid
                       select tblProduct.ProductName;
        drpEditProduct.DataSource = products;
        drpEditProduct.DataBind();
        drpEditProduct.Items.Insert(0, new ListItem("--Select--", string.Empty));


        EditDeal2.Visible = true;
        MainView.ActiveViewIndex = 1;
    }
    protected void drpEditProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        MainView.ActiveViewIndex = 1;
        EditDeal2.Visible = true;
        if (drpEditProduct.SelectedIndex == 0)
        {
            drpEditProduct.BorderStyle = BorderStyle.Solid;
            drpEditProduct.BorderWidth = 2;
            drpEditProduct.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpEditProduct.BorderStyle = BorderStyle.NotSet;
            drpEditProduct.BorderWidth = 1;
            drpEditProduct.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
        var product = (from tblProduct in cat.Products
                       where tblProduct.ProductName == drpEditProduct.SelectedItem.Value
                       select new { tblProduct.Price, tblProduct.TotalQuantity }).FirstOrDefault();
        lblEditPrice.Text = product.Price.ToString();
        lblEditQty.Text = product.TotalQuantity.ToString();

        EditDeal2.Visible = true;
        MainView.ActiveViewIndex = 1;
    }
    protected void Tab1_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Clicked";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Initial";
        MainView.ActiveViewIndex = 0;
    }
    protected void Tab2_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Clicked";
        Tab3.CssClass = "Initial";

        MainView.ActiveViewIndex = 1;
        string date = DateTime.Now.ToShortDateString();
        DateTime isdate = DateTime.Now;
        lblDate.Text = isdate.ToShortDateString();
        SqlConnection con = new SqlConnection(conn);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from DealOfDay where convert(date,InsertionDate)=convert(date,@date)", con);
        cmd.Parameters.AddWithValue("@date", isdate);
        cmd.ExecuteNonQuery();

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            lblEditDealDisplay.Text = "";
            int prid = 0;
            while (dr.Read())
            {
                prid = Convert.ToInt32(dr["PID"]);
            }
            var panelvisible = (from tblDeal in cat.DealOfDays
                                where tblDeal.PID == prid
                                orderby tblDeal.DID descending
                                select new { tblDeal.DID, tblDeal.PID, tblDeal.ListPrice, tblDeal.TodaysDiscount_InPercent, tblDeal.TodaysDeal, tblDeal.DiscountedPrice });
            var visible = panelvisible.First();
            var result = (from tblProduct in cat.Products
                          where tblProduct.PID == visible.PID
                          select new { tblProduct.CID, tblProduct.SCID, tblProduct.ProductName,tblProduct.TotalQuantity}).FirstOrDefault();
            var pname = from tblProduct in cat.Products
                          where tblProduct.PID == visible.PID
                          select tblProduct.ProductName ;
            var cid = (from tblCat in cat.Categories
                       where tblCat.CID == result.CID
                       select tblCat.CategoryName).FirstOrDefault();
            var scid = (from tblSCat in cat.SubCategories
                        where tblSCat.SCID == result.SCID
                        select tblSCat.SCategoryName);
            drpEditCat.SelectedValue = cid;
            drpEditSCat.DataSource = scid;
            drpEditSCat.DataBind();
            drpEditProduct.DataSource = pname;
            drpEditProduct.DataBind();
            txtEditDiscount.Text = visible.TodaysDiscount_InPercent.ToString();
            lblEditPrice.Text = visible.ListPrice.ToString();
            lblEditQty.Text = result.TotalQuantity.ToString();
            drpEditCat.Enabled = true;
            drpEditSCat.Enabled = true;
            drpEditProduct.Enabled = true;
            txtEditDiscount.Enabled = true;
            btnEditSubmit.Enabled = true;
            var productname = (from tblProducts in cat.Products
                               join tblDeals in cat.DealOfDays
                               on tblProducts.PID equals tblDeals.PID
                               where tblDeals.DID == visible.DID
                               select new { tblProducts.ProductName, tblProducts.PicPath,tblDeals.ListPrice,tblDeals.TodaysDiscount_InPercent,tblDeals.TodaysDeal }).Distinct();
           
            grdDealEdit.DataSource = productname;
            grdDealEdit.DataBind();
        }
        else
        {
            drpEditCat.Enabled = false;
            drpEditSCat.Enabled = false;
            drpEditProduct.Enabled = false;
            txtEditDiscount.Enabled = false;
            btnEditSubmit.Enabled = false;
            lblEditDealDisplay.Text = "Sorry No deal available today";
        }
    }
    
    protected void btnEditSubmit_Click(object sender, EventArgs e)
    {
        lblEditError.Text = "";
        if (Convert.ToInt32(txtEditDiscount.Text) > 95)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            Tab3.CssClass = "Initial";
            MainView.ActiveViewIndex = 1;
            lblEditError.Text = "Cannot be more than 95";
            txtEditDiscount.Text = "";
            txtEditDiscount.Focus();
        }
        else
        {
            int Price = Convert.ToInt32(lblEditPrice.Text);
            int discount = Convert.ToInt32(txtEditDiscount.Text);
            int calpercentage = (Price * discount) / 100;
            int totaldeal = Price - calpercentage;

            DateTime isdate = DateTime.Now;

            var pid = (from tblProduct in cat.Products
                       where tblProduct.ProductName == drpEditProduct.SelectedItem.Value
                       select tblProduct.PID).FirstOrDefault();

            DealOfDay inserts = new DealOfDay();
            inserts.PID = pid;
            inserts.ListPrice = Price;
            inserts.TodaysDiscount_InPercent = discount;
            inserts.DiscountedPrice = calpercentage;
            inserts.TodaysDeal = totaldeal;
            inserts.InsertionDate = DateTime.Now;
            cat.DealOfDays.InsertOnSubmit(inserts);
            cat.SubmitChanges();
            lblEditDealDisplay.Text = "The Deal Of the Day is edited !";

            string date = DateTime.Now.ToShortDateString();
            //DateTime isdate = DateTime.Now;
            lblDate.Text = isdate.ToShortDateString();
            SqlConnection con = new SqlConnection(conn);
            con.Open(); SqlCommand cmd = new SqlCommand("select * from DealOfDay where convert(date,InsertionDate)=convert(date,@date)", con);
            cmd.Parameters.AddWithValue("@date", isdate);
            cmd.ExecuteNonQuery();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                int prid = 0;
                while (dr.Read())
                {
                    prid = Convert.ToInt32(dr["PID"]);
                }
                var panelvisible = (from tblDeal in cat.DealOfDays
                                    where tblDeal.PID == prid
                                    orderby tblDeal.DID descending
                                    select new { tblDeal.DID, tblDeal.PID, tblDeal.ListPrice, tblDeal.TodaysDiscount_InPercent, tblDeal.TodaysDeal, tblDeal.DiscountedPrice });
                var visible = panelvisible.First();

                drpEditCat.Enabled = true;
                drpEditSCat.Enabled = true;
                drpEditProduct.Enabled = true;
                txtEditDiscount.Enabled = true;
                btnEditSubmit.Enabled = true;
                var productname = (from tblProducts in cat.Products
                                   join tblDeals in cat.DealOfDays
                                   on tblProducts.PID equals tblDeals.PID
                                   where tblDeals.DID == visible.DID
                                   select new { tblProducts.ProductName, tblProducts.PicPath, tblDeals.ListPrice, tblDeals.TodaysDiscount_InPercent, tblDeals.TodaysDeal });

                grdDealEdit.DataSource = productname;
                grdDealEdit.DataBind();
            }
            else
            {
                lblEditDealDisplay.Text = "Sorry No deal available today";
            }
            drpEditCat.SelectedIndex = 0;
            drpEditSCat.SelectedIndex = 0;
            drpEditProduct.SelectedIndex = 0;
            lblEditPrice.Text = "";
            lblEditQty.Text = "";
            txtEditDiscount.Text = "";
            //Response.Redirect("AddDealOfDay.aspx");
            EditDeal2.Visible = true;
            MainView.ActiveViewIndex = 1;
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            Tab3.CssClass = "Initial";
        }
    }
    

    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Clicked";
        selection();
    }

    public void selection()
    {
        if (RadSearchBox1.Text != "" && RadDatePicker1.SelectedDate != null)
        {
            var result = from tblProducts in cat.Products
                         join tblDeals in cat.DealOfDays
                         on tblProducts.PID equals tblDeals.PID
                         where tblProducts.ProductName == RadSearchBox1.Text && tblDeals.InsertionDate == RadDatePicker1.SelectedDate
                         select new { tblProducts.PicPath, tblProducts.ProductName, tblDeals.ListPrice, tblDeals.TodaysDiscount_InPercent, tblDeals.TodaysDeal, tblDeals.InsertionDate };
            grdDealShows.DataSource = result;
            grdDealShows.DataBind();
            MainView.ActiveViewIndex = 2;
        }
        else if (RadSearchBox1.Text != "")
        {
            var result = from tblProducts in cat.Products
                         join tblDeals in cat.DealOfDays
                         on tblProducts.PID equals tblDeals.PID
                         where tblProducts.ProductName == RadSearchBox1.Text
                         select new { tblProducts.PicPath, tblProducts.ProductName, tblDeals.ListPrice, tblDeals.TodaysDiscount_InPercent, tblDeals.TodaysDeal, tblDeals.InsertionDate };
            grdDealShows.DataSource = result;
            grdDealShows.DataBind();
            MainView.ActiveViewIndex = 2;
        }
        else if (RadDatePicker1.SelectedDate != null)
        {
            var result = from tblProducts in cat.Products
                         join tblDeals in cat.DealOfDays
                         on tblProducts.PID equals tblDeals.PID
                         where tblDeals.InsertionDate == RadDatePicker1.SelectedDate
                         select new { tblProducts.PicPath, tblProducts.ProductName, tblDeals.ListPrice, tblDeals.TodaysDiscount_InPercent, tblDeals.TodaysDeal, tblDeals.InsertionDate };
            grdDealShows.DataSource = result;
            grdDealShows.DataBind();
            MainView.ActiveViewIndex = 2;
        }
    }
    protected void Tab3_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Clicked";

        
        MainView.ActiveViewIndex = 2;
    }
    protected void grdDealShows_PageIndexChanged(object sender, EventArgs e)
    {
        MainView.ActiveViewIndex = 2;
    }
    protected void grdDealShows_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Clicked";
        grdDealShows.PageIndex = e.NewPageIndex;
        selection();
        MainView.ActiveViewIndex = 2;
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}