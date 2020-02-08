using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Search : System.Web.UI.Page
{
    int choice;
    static int scid;
    int fromprice;
    int toprice;
     DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
     {
         if (!IsPostBack)
         {
             ViewState["RefUrl"] = Request.UrlReferrer.ToString();
         }
        divresult.Visible = false;
        if (!Page.IsPostBack)
        {            
            var scategor = from tblSCat in cat.SubCategories
                            select tblSCat.SCategoryName;

            drpSCategory.DataSource = scategor;
            drpSCategory.DataBind();
            drpSCategory.Items.Insert(0, new ListItem("--Select--", string.Empty));

            var brand = (from tblProduct in cat.Products                         
                         select tblProduct.BrandName).Distinct();
            rdBrandName.DataSource = brand;
            rdBrandName.DataBind(); 
        }
    }
    protected void rdPriceWish_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    List<string> brandname = new List<string>();
    public void binding()
    {
        switch (choice)
        { 
            case 1:
                Case1();
                break;
            case 2:
                Case2();
                break;
            case 3:
                Case3();
                break;
            case 4:
                Case4();
                break;
            case 5:
                Case5();
                break;
            case 6:
                Case6();
                break;
            case 7:
                Case7();
                break;
        }
        divresult.Visible = true;
      }
    public void SelectedCondition()
    {
        if (drpSCategory.SelectedIndex != 0 && rdBrandName.SelectedIndex != -1 && rdPriceWish.SelectedIndex != -1)
        {
            choice = 1;
            binding();
        }
        else if (drpSCategory.SelectedIndex != 0 && rdBrandName.SelectedIndex != -1)
        {
            choice = 2;
            binding();
        }
        else if (drpSCategory.SelectedIndex != 0 && rdPriceWish.SelectedIndex != -1)
        {
            choice = 3;
            binding();
        }
        else if (rdBrandName.SelectedIndex != -1 && rdPriceWish.SelectedIndex != -1)
        {
            choice = 4;
            binding();
        }
        else if (drpSCategory.SelectedIndex != 0)
        {
            choice = 5;
            binding();
        }
        else if (rdBrandName.SelectedIndex != -1)
        {
            choice = 6;
            binding();
        }
        else if (rdPriceWish.SelectedIndex != -1)
        {
            choice = 7;
            binding();
        }     
    }
    public void RadioSelection()
    {
        if (rdPriceWish.SelectedIndex == 0)
        {
            fromprice = 500;
            toprice = 700;
        }
        else if (rdPriceWish.SelectedIndex == 1)
        {
            fromprice = 701;
            toprice = 900;
        }
        else if (rdPriceWish.SelectedIndex == 2)
        {
            fromprice = 900;
            toprice = 1000;
        }
        else if (rdPriceWish.SelectedIndex == 3)
        {
            fromprice = 1000;           
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        foreach (System.Web.UI.WebControls.ListItem oItem in rdBrandName.Items)
        {
            if (oItem.Selected)
            {
                brandname.Add(oItem.Value);
            }
        }
        if (drpSCategory.SelectedIndex == 0 && rdBrandName.SelectedIndex == -1 && rdPriceWish.SelectedIndex == -1)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select to search!')", true);
        }
        else
        {
            var sucid = (from tblSCat in cat.SubCategories
                         where tblSCat.SCategoryName == drpSCategory.SelectedValue
                         select tblSCat.SCID).FirstOrDefault();
            scid = sucid;
            divresult.Visible = true;
            SelectedCondition();
        }
       
    }    
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SelectedCondition();
        binding();
        divresult.Visible = true;
    }
    public void Case5()  
    {        
        var query = (from tblProducts in cat.Products
                     where tblProducts.SCID == scid
                     select tblProducts);

        GridView1.DataSource = query;
        GridView1.DataBind();
    }
    public void Case6()
    {        
        var query = (from tblProducts in cat.Products
                     where tblProducts.BrandName == rdBrandName.SelectedValue
                     select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity }).ToList();

        GridView1.DataSource = query;
        GridView1.DataBind();     
    }
    public void Case2()
    {       
        var query = (from tblProducts in cat.Products
                        where tblProducts.SCID == scid && tblProducts.BrandName == rdBrandName.SelectedValue
                        select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
        GridView1.DataSource = query;
        GridView1.DataBind();   
    }
    public void Case7()
    {
        RadioSelection();
        if (rdPriceWish.SelectedIndex == 3)
        {
            var query = (from tblProducts in cat.Products
                         where tblProducts.Price > fromprice
                         select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        else
        {
            var query = (from tblProducts in cat.Products
                         where tblProducts.Price > fromprice && tblProducts.Price < toprice
                         select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
    }
    public void Case1()
    {
        RadioSelection();
        if (rdPriceWish.SelectedIndex == 3)
        {
            var query = (from tblProducts in cat.Products
                         where tblProducts.Price > fromprice && tblProducts.SCID == scid && tblProducts.BrandName == rdBrandName.SelectedValue
                            select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();
            
        }
        else
        {
            var query = (from tblProducts in cat.Products
                         where tblProducts.SCID == scid && tblProducts.BrandName == rdBrandName.SelectedValue && tblProducts.Price > fromprice && tblProducts.Price < toprice
                            select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();           
        }
    }
    public void Case3()
    {
        RadioSelection();
        if (rdPriceWish.SelectedIndex == 3)
        {            
            var query = (from tblProducts in cat.Products
                            where tblProducts.Price > fromprice && tblProducts.SCID == scid
                         select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();           
        }
        else
        {
            var query = (from tblProducts in cat.Products
                where tblProducts.SCID == scid && tblProducts.Price > fromprice && tblProducts.Price < toprice
                         select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();            
        }
    }
    public void Case4()
    { 
        RadioSelection();
        if (rdPriceWish.SelectedIndex == 3)
        {            
            var query = (from tblProducts in cat.Products
                         where tblProducts.Price > fromprice && tblProducts.BrandName == rdBrandName.SelectedValue
                            select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();
           
        }
        else
        {
            var query = (from tblProducts in cat.Products
                         where tblProducts.BrandName == rdBrandName.SelectedValue && tblProducts.Price > fromprice && tblProducts.Price < toprice
                            select new { tblProducts.PID, tblProducts.PicPath, tblProducts.ProductName, tblProducts.Price, tblProducts.BrandName, tblProducts.TotalQuantity });
            GridView1.DataSource = query;
            GridView1.DataBind();            
        }
    }    
    protected void DoRedirect(object sender, EventArgs e)
    {
        Button theButton = sender as Button;
        int pid=Convert.ToInt32(theButton.CommandArgument);
        Response.Redirect("SelectedProduct.aspx?PID=" + pid);
    }

    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
    protected void lnkBrandClear_Click(object sender, EventArgs e)
    {
        rdBrandName.SelectedIndex = -1;
    }
    protected void lnkPriceClear_Click(object sender, EventArgs e)
    {
        rdPriceWish.SelectedIndex = -1;
    }
}