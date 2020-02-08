using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.IO;

public partial class AddProducts : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
        lblPriceError.Visible = false;
        lblQtyError.Visible = false;
        
        lblPCatName.Visible = true;
        lblPName.Visible = true;
        lblPScatName.Visible = true;
        lblPPrice.Visible = true;
        lblTQ.Visible = true;
        lblDescription.Visible = true;
        lblPPic.Visible = true;
        lblBName.Visible = true;

        if (!Page.IsPostBack)
        {
            var categor = from c in cat.Categories
                          select c.CategoryName;
            drpCatAddProduct.DataSource = categor;
            drpCatAddProduct.DataBind();
            drpCatAddProduct.Items.Insert(0, new ListItem("--Select--", string.Empty));
        }
    }
    protected void btnSubmitProduct_Click(object sender, EventArgs e)
    {
        Regex phNum = new Regex("^[0-9]+$");
        Match getmatch = phNum.Match(txtPrice.Text);
        Match getmatch1 = phNum.Match(txtQty.Text);
        if (!getmatch.Success)
        {

            divAddProducts.Visible = true;
            
            lblPriceError.Visible = true;
        }
        else if (!getmatch1.Success)
        {
            divAddProducts.Visible = true;
            
            lblQtyError.Visible = true;
        }
        else
        {

            string filePath = "";
            string path = "";
            if (PictureUpload.HasFile && Path.GetExtension(PictureUpload.FileName) == ".jpg" || PictureUpload.HasFile && Path.GetExtension(PictureUpload.FileName) == ".jpeg" || PictureUpload.HasFile && Path.GetExtension(PictureUpload.FileName) == ".gif" || PictureUpload.HasFile && Path.GetExtension(PictureUpload.FileName) == ".png" || PictureUpload.HasFile && Path.GetExtension(PictureUpload.FileName) == ".JPG")
            {
                // create posted file
                // make sure we have a place for the file in the directory structure
                EnsureDirectoriesExist();
                filePath = Server.MapPath(@"~/pix/" + PictureUpload.FileName);
                PictureUpload.SaveAs(filePath);
                path = @"pix/" + PictureUpload.FileName;

                var catid = (from tblCat in cat.Categories
                             where tblCat.CategoryName == drpCatAddProduct.SelectedItem.Value
                             select tblCat.CID).FirstOrDefault();

                var scatid = (from tblSCat in cat.SubCategories
                              where tblSCat.SCategoryName == drpSubCatAddPro.SelectedValue
                              select tblSCat.SCID).FirstOrDefault();
                Product insert = new Product();
                insert.CID = catid;
                insert.SCID = scatid;
                insert.ProductName = txtProductName.Text;
                insert.Price = Convert.ToInt32(txtPrice.Text);
                insert.Description = txtDescription.Text;
                insert.BrandName = txtBrandName.Text;
                insert.PicPath = path;
                insert.TotalQuantity = Convert.ToInt32(txtQty.Text);
                cat.Products.InsertOnSubmit(insert);
                cat.SubmitChanges();
                lblProDisplay.Text = "New product has been added";

                divAddProducts.Visible = true;
                drpCatAddProduct.SelectedIndex = 0;
                drpSubCatAddPro.SelectedIndex = 0;
                txtProductName.Text = "";
                txtPrice.Text = "";
                txtDescription.Text = "";
                txtBrandName.Text = "";
                txtQty.Text = "";


            }
            else
            {
                divAddProducts.Visible = true;
                lblProDisplay.Text = "Please select a correct file";
            }
        }
    }
    public void EnsureDirectoriesExist()
    {
        // if the \pix directory doesn't exist - create it. 
        if (!System.IO.Directory.Exists(Server.MapPath(@"~/pix/")))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(@"~/pix/"));
        }
    }  
    protected void drpCatAddProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        var catid = (from tblCat in cat.Categories
                     where tblCat.CategoryName == drpCatAddProduct.SelectedItem.Value
                     select tblCat.CID).FirstOrDefault();

        var categor = from tblSCat in cat.SubCategories
                      where tblSCat.CID == catid
                      select tblSCat.SCategoryName;

        drpSubCatAddPro.DataSource = categor;
        drpSubCatAddPro.DataBind();
        drpSubCatAddPro.Items.Insert(0, new ListItem("--Select--", string.Empty));

        divAddProducts.Visible = true;
    }
    protected void drpSubCatAddPro_SelectedIndexChanged(object sender, EventArgs e)
    {
        divAddProducts.Visible = true;
        if (drpSubCatAddPro.SelectedIndex == 0)
        {
            drpSubCatAddPro.BorderStyle = BorderStyle.Solid;
            drpSubCatAddPro.BorderWidth = 2;
            drpSubCatAddPro.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpSubCatAddPro.BorderStyle = BorderStyle.NotSet;
            drpSubCatAddPro.BorderWidth = 1;
            drpSubCatAddPro.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
    }

    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}