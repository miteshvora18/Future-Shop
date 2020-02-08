using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
       
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int id = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
        Session["cid"] = id;
        Response.Redirect("SubCategories.aspx");
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session["username"] = "Guest";
        Profile.SCart.Items.Clear();
        Response.Redirect("Home.aspx");
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}