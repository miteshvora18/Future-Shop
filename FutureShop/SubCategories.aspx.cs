using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class SubCategories : System.Web.UI.Page
{
    int pos;
    int cid;
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
                cid = Convert.ToInt32(Request.QueryString["Parameter"]);
            }
            else
            {
                cid = Convert.ToInt32(Session["cid"]);

            }
            if (cid == 0)
            {
                lblNoMatch.Visible = true;
            }
            using (DataClassesDataContext cat = new DataClassesDataContext())
            {
                var cname = (from tblCat in cat.Categories
                             where tblCat.CID == cid
                             select tblCat.CategoryName).FirstOrDefault();
                lblCategory.Text = cname;

                var dlist = (from tblCat in cat.SubCategories
                             where tblCat.CID == cid
                             select new { tblCat.SCategoryName, tblCat.SCID, tblCat.PicPath }).ToList();

                DataList1.DataSource = dlist;
                DataList1.DataBind();
            }
        }
        catch (Exception h)
        {

        }
        
        
    }    
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int id = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
        Session["scid"] = id;
        Response.Redirect("Products.aspx");
       
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