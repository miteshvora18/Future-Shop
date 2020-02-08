using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Compare : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    static int pr1;
    static int pr2;
    static int pr3;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
        List<string> pname = (List<string>)Session["pname"];
        for (int i = 0; i < pname.Count; i++)
        {
            if (i == 0)
            {
                string p1 = pname[0].ToString();
                var query = from tblProduct in cat.Products
                            where tblProduct.ProductName == p1
                            select new { tblProduct.PID,tblProduct.ProductName, tblProduct.PicPath, tblProduct.Price, tblProduct.TotalQuantity, tblProduct.Description, tblProduct.BrandName };
                DataList1.DataSource = query;
                DataList1.DataBind();
                var pid = query.FirstOrDefault();
                pr1 = pid.PID;
            }
            else if (i == 1)
            {
                string p1 = pname[1].ToString();
                var query = from tblProduct in cat.Products
                            where tblProduct.ProductName == p1
                            select new { tblProduct.PID, tblProduct.ProductName, tblProduct.PicPath, tblProduct.Price, tblProduct.TotalQuantity, tblProduct.Description, tblProduct.BrandName };
                DataList2.DataSource = query;
                DataList2.DataBind();
                var pid = query.FirstOrDefault();
                pr2 = pid.PID;
            }
            else
            {
                string p1 = pname[2].ToString();
                var query = from tblProduct in cat.Products
                            where tblProduct.ProductName == p1
                            select new { tblProduct.PID, tblProduct.ProductName, tblProduct.PicPath, tblProduct.Price, tblProduct.TotalQuantity, tblProduct.Description, tblProduct.BrandName };
                DataList3.DataSource = query;
                DataList3.DataBind();
                var pid = query.FirstOrDefault();
                pr3 = pid.PID;
            }

        }

    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        Session["pid"] = pr1;
        Response.Redirect("SelectedProduct.aspx");
    }
    protected void btnSelect0_Click(object sender, EventArgs e)
    {
        Session["pid"] = pr2;
        Response.Redirect("SelectedProduct.aspx");
    }
    protected void btnSelect1_Click(object sender, EventArgs e)
    {
        Session["pid"] = pr3;
        Response.Redirect("SelectedProduct.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
       
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}