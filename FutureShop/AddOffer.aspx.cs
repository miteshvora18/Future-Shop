using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class AddNewsLetter : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
       
        if (!IsPostBack)
        {
            var product = (from tblOffer in cat.ProductOffers
                           where tblOffer.InsertionDate == DateTime.Now && tblOffer.Type == "User"
                           select tblOffer.PID).ToList();

            var pname = from tblProducts in cat.Products
                        where (!product.Contains(tblProducts.PID))
                        select tblProducts.ProductName;
            drpProduct.DataSource = pname;
            drpProduct.DataBind();
            drpProduct.Items.Insert(0, new ListItem("--Select--", string.Empty));
  
            var scheme = from tblScheme in cat.Schemes
                         select tblScheme.PlanName;
            drpPlan.DataSource = scheme;
            drpPlan.DataBind();
            drpPlan.Items.Insert(0, new ListItem("--Select--", string.Empty));

           

            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";          
            MainView.ActiveViewIndex = 0;

        }
    } 
    protected void Tab1_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Clicked";
        Tab2.CssClass = "Initial";
       
        MainView.ActiveViewIndex = 0;
    }
    protected void Tab2_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Clicked";
       
        btnTab1.CssClass = "Clicked";
       
        MainView.ActiveViewIndex = 1;
        MultiView1.ActiveViewIndex = 0;

    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
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
            var pid = (from tblProducts in cat.Products
                       where tblProducts.ProductName == drpProduct.SelectedValue
                       select tblProducts.PID).FirstOrDefault();
            ProductOffer insert = new ProductOffer();
            insert.Type = "User";
            insert.PID = pid;
            insert.Offer = Convert.ToInt32(txtDiscount.Text);
            insert.InsertionDate = DateTime.Now;
            cat.ProductOffers.InsertOnSubmit(insert);
            cat.SubmitChanges();
            txtDiscount.Text = "";
            drpProduct.SelectedIndex = 0;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Offer For the product has been added')", true);
            //Response.Redirect("AddOffer.aspx");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Offer For the product has been added'); window.location='AddOffer.aspx';", true);
        }
    }
    protected void btnSubMem_Click(object sender, EventArgs e)
    {
        lblEditError.Text = "";
        if (Convert.ToInt32(txtDisMem.Text) > 95)
        {
            lblEditError.Text = "Cannot be more than 95";
            txtDisMem.Text = "";
            txtDisMem.Focus();
        }
        else
        {
            var pid = (from tblProducts in cat.Products
                       where tblProducts.ProductName == drpProMem.SelectedValue
                       select tblProducts.PID).FirstOrDefault();
            ProductOffer insert = new ProductOffer();

            insert.Type = "Member";
            insert.PID = pid;
            insert.Plans = drpPlan.SelectedValue;
            insert.Offer = Convert.ToInt32(txtDisMem.Text);
            insert.InsertionDate = DateTime.Now;
            cat.ProductOffers.InsertOnSubmit(insert);
            cat.SubmitChanges();
            txtDisMem.Text = "";

            drpProMem.SelectedIndex = 0;
            drpPlan.SelectedIndex = 0;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Offer For the product has been added')", true);
        }
        
    }
    protected void Tab3_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Initial";
       
    }
    protected void btnTab1_Click(object sender, EventArgs e)
    {
       
        btnTab1.CssClass = "Clicked";

        MultiView1.ActiveViewIndex = 0;

    }
    protected void btnTab2_Click(object sender, EventArgs e)
    {
        btnTab1.CssClass = "Initial";
       

        MultiView1.ActiveViewIndex = 1;

    }
   
   
   

    protected void drpPlan_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpPlan.SelectedIndex == 0)
        {
            drpPlan.BorderStyle = BorderStyle.Solid;
            drpPlan.BorderWidth = 2;
            drpPlan.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpPlan.BorderStyle = BorderStyle.NotSet;
            drpPlan.BorderWidth = 1;
            drpPlan.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
        
        var product = (from tblOffer in cat.ProductOffers
                       where tblOffer.InsertionDate == DateTime.Now && tblOffer.Type == "Member" && tblOffer.Plans==drpPlan.SelectedValue
                       select tblOffer.PID).ToList();

       
            var productmem = from tblProduct in cat.Products
                             where (!product.Contains(tblProduct.PID))
                             select tblProduct.ProductName;
            drpProMem.DataSource = productmem;
            drpProMem.DataBind();
            drpProMem.Items.Insert(0, new ListItem("--Select--", string.Empty));
        
    }
    protected void drpProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpProduct.SelectedIndex == 0)
        {
            drpProduct.BorderStyle = BorderStyle.Solid;
            drpProduct.BorderWidth = 2;
            drpProduct.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpProduct.BorderStyle = BorderStyle.NotSet;
            drpProduct.BorderWidth = 1;
            drpProduct.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
    }
    protected void drpProMem_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpProMem.SelectedIndex == 0)
        {
            drpProMem.BorderStyle = BorderStyle.Solid;
            drpProMem.BorderWidth = 2;
            drpProMem.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpProMem.BorderStyle = BorderStyle.NotSet;
            drpProMem.BorderWidth = 1;
            drpProMem.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}