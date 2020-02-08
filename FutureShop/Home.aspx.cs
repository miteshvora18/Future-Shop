using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Home : System.Web.UI.Page
{
    string conn = System.Configuration.ConfigurationManager.ConnectionStrings["fs"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //----Making the Back Button of Browser Disabled
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoServerCaching();
        HttpContext.Current.Response.Cache.SetNoStore();

        DateTime isdate = DateTime.Now;
        SqlConnection con = new SqlConnection(conn);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from DealOfDay where InsertionDate =convert(date,@date)",con);
        cmd.Parameters.AddWithValue("@date",isdate);
        cmd.ExecuteNonQuery();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {int pid=0;
            while (dr.Read())
            {
                pid= Convert.ToInt32(dr["PID"]);
            }
                pnlDealValid.Visible = true;
                pnlInValidDeal.Visible = false;
                using (DataClassesDataContext cat = new DataClassesDataContext())
                {
                    var panelvisible = (from tblDeal in cat.DealOfDays
                                        where tblDeal.PID==pid
                                        orderby tblDeal.InsertionDate descending
                                        select new { tblDeal.PID, tblDeal.ListPrice, tblDeal.TodaysDiscount_InPercent, tblDeal.TodaysDeal, tblDeal.DiscountedPrice });
                    var visible = panelvisible.First();

                    var productname = (from tblProducts in cat.Products
                                       where tblProducts.PID == visible.PID
                                       select new { tblProducts.Description, tblProducts.TotalQuantity, tblProducts.ProductName,tblProducts.PicPath }).FirstOrDefault();

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
            
        }
        else
        {
            pnlDealValid.Visible = false;
            pnlInValidDeal.Visible = true;
        }
       // FutureShopProductsView.ActiveViewIndex = 0;
        
    }
    
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int id = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
        Session["cid"] = id;
        Response.Redirect("SubCategories.aspx");
    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {        
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('You need to register with us to avail our services...'); Response.Redirect('Register.aspx');", true);
             
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}