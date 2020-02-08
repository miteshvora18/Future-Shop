using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

public partial class CartControl : System.Web.UI.UserControl
{
    DataClassesDataContext cat = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnProceed.Visible = true ;
        if (Profile.SCart == null)
        {
            Profile.SCart = new ShoppingCartExample.Cart();
        }
        if (!Page.IsPostBack)
        {
            ReBindGrid();
        }
        if (Profile.SCart.Items == null)
        {
            TotalLabel.Visible = false;            
        }
        if (Profile.SCart.Items.Count == 0)
        {
            btnProceed.Visible = false;
        }
    }
    protected void grdCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdCart.EditIndex = e.NewEditIndex;
        ReBindGrid();
    }
    
    Regex phNum = new Regex("^[0-9]+$");
    protected void grdCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
        string a = grdCart.Rows[e.RowIndex].Cells[1].Text;

         var qty = (from tblProducts in cat.Products
                    where tblProducts.ProductName == a
                    select tblProducts).FirstOrDefault();
         int totqty = qty.TotalQuantity;
        
        TextBox txtQuantity = (TextBox)
                 
        grdCart.Rows[e.RowIndex].Cells[2].Controls[0];
        try
        {
            int Quantity = Convert.ToInt32(txtQuantity.Text);
            if (Quantity > totqty)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry we have only " + totqty + " items left in our stock')", true);
            }
            else if (Quantity < 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter a valid quantity!')", true);
            }
            else if (Quantity == 0)
            {
                Profile.SCart.Items.RemoveAt(e.RowIndex);
            }
            else
            {
                Profile.SCart.Items[e.RowIndex].Quantity = Quantity;
            }
            grdCart.EditIndex = -1;
            ReBindGrid();
        }
        catch (Exception h)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter a valid quantity!')", true);
            txtQuantity.Text = "";
        }
    }
    protected void grdCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdCart.EditIndex = -1;
        ReBindGrid();
    }
    protected void grdCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Profile.SCart.Items.RemoveAt(e.RowIndex);
        Application["cartcount"] = Profile.SCart.Items.Count();
        ReBindGrid();
        Response.Redirect("Cart.aspx");
    }
    private void ReBindGrid()
    {
        grdCart.DataSource = Profile.SCart.Items;
        
        DataBind();
        int total=Convert.ToInt32(Profile.SCart.Total);
        TotalLabel.Text = "Rs "+total.ToString();
    }

    //private void ToSessionState(int productid, int qty, int subtotal, int total)
    //{
    //    int[, , ,] initialArray = new int[productid, qty, subtotal, total];

    //    Session["sessArray"] = initialArray;
    //}
    List<int> productid = new List<int>();
    List<int> qty = new List<int>();
    List<int> subtotal = new List<int>();
   
    protected void btnProceed_Click(object sender, EventArgs e)
    {         
        
        foreach (GridViewRow row in grdCart.Rows)
        {            
            int intpid = Convert.ToInt32(grdCart.DataKeys[row.RowIndex].Values[0]);
            int quantity = Convert.ToInt32(grdCart.Rows[row.RowIndex].Cells[2].Text);
            string subtotals = (grdCart.Rows[row.RowIndex].Cells[4].Text);
            string str = subtotals;
            string strSplit = "Rs ";
            StringBuilder strB = new StringBuilder("", 200);

            Regex r = new Regex(strSplit);
            string[] s = r.Split(str);

            foreach (object o in s)
            {
                strB.Append(o.ToString());
            }

            string a = strB.ToString();
            int subtot = Convert.ToInt32(a);
            //int tot = Convert.ToInt32(TotalLabel.Text);

            //ToSessionState(intpid, quantity, subtot, tot);
            productid.Add(intpid);
            qty.Add(quantity);
            subtotal.Add(subtot);
            //total.Add(tot);     
            //Profile.SCart.Items.Clear();
            Session["product"] = productid;
            Session["quantity"] = qty;
            Session["subtotal"] = subtotal;
           
        }
        Session["total"] = TotalLabel.Text;
        Response.Redirect("Proceed.aspx");
    }

    protected void grdCart_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}