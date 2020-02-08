using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class User : System.Web.UI.Page
{ 
    SqlDataAdapter dadapter;
    DataSet dset;
    PagedDataSource adsource;
    string connstring = "database=FutureShop;server=.;Integrated Security=true";
    int pos;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["username"] == null)
        {            
            Response.Redirect("Home.aspx");
        }
        else if (Session["username"] == "vibha")
        {
            Response.Redirect("Admin.aspx");
        }
        if (!IsPostBack)
        {
            this.ViewState["vs"] = 0;
        }
        pos = (int)this.ViewState["vs"];  
       
        btnprevious.Visible = false;
       
        btnnext.Visible = false;
    }
    static int id = 0;
    protected void DataListCategory_ItemCommand(object source, DataListCommandEventArgs e)
    {
         id= Convert.ToInt32(DataListCategory.DataKeys[e.Item.ItemIndex]);
        Session["cid"] = id;
        databind();
        
        btnprevious.Visible=true;
   
        btnnext.Visible=true;
    }
    public void databind()
    {
       
        dadapter = new SqlDataAdapter("select * from SubCategory where CID=@CID", connstring);
        dadapter.SelectCommand.Parameters.AddWithValue("@CID", id);        
        dset = new DataSet();
        adsource = new PagedDataSource();
       
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        DataListSubCategory.RepeatColumns = 4;
        adsource.PageSize =4;
       
        adsource.AllowPaging = true;
        adsource.CurrentPageIndex = pos;
        
      
        btnprevious.Enabled = !adsource.IsFirstPage;
      
        btnnext.Enabled = !adsource.IsLastPage;
        DataListSubCategory.DataSource = adsource;
        DataListSubCategory.DataBind();
    }
   
    protected void btnprevious_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos -= 1;
        this.ViewState["vs"] = pos;
        databind();
   
        btnprevious.Visible = true;
      
        btnnext.Visible = true;
    }
    protected void btnnext_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos += 1;
        this.ViewState["vs"] = pos;
        databind();
       
        btnprevious.Visible = true;
       
        btnnext.Visible = true;
    }

    protected void DataListSubCategory_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int scid = Convert.ToInt32(DataListSubCategory.DataKeys[e.Item.ItemIndex]);
        Session["scid"] = scid;
        Response.Redirect("Products.aspx");
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session["username"] = "Guest";
        Profile.SCart.Items.Clear();
        Response.Redirect("Home.aspx");
    }
    protected void DataListSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
}