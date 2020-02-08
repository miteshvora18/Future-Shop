using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class AddCategories : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            
        }
        Page.Form.Attributes.Add("enctype", "multipart/form-data");

        
        divSubcategory.Visible = false;
        lblCatName.Visible = true;
        lblCatPic.Visible = true;
        drpCatName.Visible = true;
        lblSCat.Visible = true;
        lblSCatPic.Visible = true;
            
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblCatDisplay.Visible = true;
        string filePath = "";
        string path = "";


        if (FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".jpg" || FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".jpeg" || FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".gif" || FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".png")
        {
            // create posted file
            // make sure we have a place for the file in the directory structure
            EnsureDirectoriesExist();
            filePath = Server.MapPath(@"~/pix/" + FileUpload1.FileName);
            FileUpload1.SaveAs(filePath);
            path = @"pix/" + FileUpload1.FileName;

            Category insert = new Category();
            insert.CategoryName = txtCategory.Text;
            insert.PicPath = path;
            cat.Categories.InsertOnSubmit(insert);
            cat.SubmitChanges();
            lblCatDisplay.Text = "A new category has been added !";

            divCategory.Visible = true;
            chkCategory.Checked = false;
            divSubcategory.Visible = false;
            txtCategory.Text = "";
            FileUpload1.ForeColor = System.Drawing.Color.Black;
        }
        else
        {
            divCategory.Visible = true;

            lblCatDisplay.Text = "Please Select the right file";
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //StringCollection sc = new StringCollection();
        //for (int i = 1; i <= 6; i++)
        //{
        //    TextBox txtBox = (TextBox)pnlSubCategory.FindControl("txtCat" + i);
        //    if (txtBox.Text == "")
        //    {
        //        break;
        //    }
        //    else
        //    {
        //        sc.Add(txtBox.Text);
        //    }
        //}

        //foreach (string item in sc)
        //{
        string filePath = "";
        string path = "";

        if (FileUpload2.HasFile && Path.GetExtension(FileUpload2.FileName) == ".jpg" || FileUpload2.HasFile && Path.GetExtension(FileUpload2.FileName) == ".jpeg" || FileUpload2.HasFile && Path.GetExtension(FileUpload2.FileName) == ".gif" || FileUpload2.HasFile && Path.GetExtension(FileUpload2.FileName) == ".png")
        {
            // create posted file
            // make sure we have a place for the file in the directory structure
            EnsureDirectoriesExist();
            filePath = Server.MapPath(@"~/pix/" + FileUpload2.FileName);
            FileUpload2.SaveAs(filePath);
            path = @"pix/" + FileUpload2.FileName;

            var cid = (from tblCat in cat.Categories
                       where tblCat.CategoryName == drpCategory.SelectedItem.Value
                       select tblCat.CID).FirstOrDefault();

            SubCategory insert = new SubCategory();
            insert.CID = cid;
            insert.SCategoryName = txtCat1.Text;
            insert.PicPath = path;
            cat.SubCategories.InsertOnSubmit(insert);
            cat.SubmitChanges();

            lblSCatDisplay.Text = "New Sub Category has been added !";
            divCategory.Visible = true;
            txtCat1.Text = "";
            drpCategory.SelectedIndex = 0;
            //chkCategory.Checked = false;
            divSubcategory.Visible = true;            
        }
        else
        {
            divCategory.Visible = true;
            divSubcategory.Visible = true;
            lblSCatDisplay.Text = "Please Select the right file";
        }
       
    }
    protected void chkCategory_CheckedChanged(object sender, EventArgs e)
    {
        if (chkCategory.Checked)
        {
            divCategory.Visible = true;
            divSubcategory.Visible = true;
            txtCategory.Enabled = false;
            FileUpload1.Enabled = false;
            btnAdd.Enabled = false;
            lblCatDisplay.Visible = false;
            lblSCatDisplay.Text = "";
            var categor = from c in cat.Categories
                          select c.CategoryName;

            drpCategory.DataSource = categor;
            drpCategory.DataBind();
            drpCategory.Items.Insert(0, new ListItem("--Select--", string.Empty));
        }
        else
        {
            divCategory.Visible = true;
            divSubcategory.Visible = false;
            txtCategory.Enabled = true;
            FileUpload1.Enabled = true;
            btnAdd.Enabled = true;
        }        
    }
    protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        divCategory.Visible = true;
        divSubcategory.Visible = true;
        if (drpCategory.SelectedIndex == 0)
        {
            drpCategory.BorderStyle = BorderStyle.Solid;
            drpCategory.BorderWidth = 2;
            drpCategory.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            drpCategory.BorderStyle = BorderStyle.NotSet;
            drpCategory.BorderWidth = 1;
            drpCategory.BorderColor = System.Drawing.ColorTranslator.FromHtml("#7F9DB9");
        }
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}