using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyPage : System.Web.UI.Page
{
    
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var uid = (from tblUser in cat.UserRegisters
                  where tblUser.UserName == Session["username"]
                  select tblUser).FirstOrDefault();
        Session["userid"] = uid.UserID;

    }
    protected void grdOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grdOrders.Rows)
        {
            Session["id"] = Convert.ToInt32(grdOrders.DataKeys[row.RowIndex].Values[0]);
        }
    }
    protected void DoRedirect(object sender, EventArgs e)
    {
        Button theButton = sender as Button;
        Session["id"] = Convert.ToInt32(theButton.CommandArgument);
        Redirect();
    }
    public void Redirect()
    {
        var result = (from tblProducts in cat.Products
                      join tblOrder in cat.OrderProductDetails
                      on tblProducts.PID equals tblOrder.PID
                      join tblBilling in cat.Billingdetails
                      on tblOrder.BillingID equals tblBilling.BillingId
                      where tblOrder.BillingID == Convert.ToInt32(Session["id"])
                      select new { tblBilling.BillingId, tblProducts.PicPath, tblProducts.ProductName, tblOrder.Qty, tblOrder.SubTotal });
        grdFullOrder.DataSource = result;
        grdFullOrder.DataBind();
    }
    protected void grdOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOrders.PageIndex = e.NewPageIndex;
    }
    protected void grdFullOrder_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdFullOrder.PageIndex = e.NewPageIndex;
        Redirect();
    }
}