using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Membership : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    static string sname;
    static decimal cost;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
        divSubscribe.Visible = false;
        divChosen.Visible = false;
    }
    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        divSubscribe.Visible = false;
        divChosen.Visible = true;
       
        decimal Sum = 0.0m;
        lblChosenPlan.Text = sname;
        lblChosenTime.Text = "6 ";
        //if (drpDuration.SelectedIndex == 2)
        //{
        //    Sum = cost + cost;
            lblSumPrice.Text = cost.ToString();
            Session["ToatalSum"] = cost;
        //}
        //else
        //{
        //    lblSumPrice.Text = cost.ToString();
        //    Session["ToatalSum"] = cost;
        //}

    }
    protected void DoRedirect(object sender, EventArgs e)
    {
        Button theButton = sender as Button;
        sname = Convert.ToString(theButton.CommandArgument);
        var price = (from tblScheme in cat.Schemes
                     where tblScheme.PlanName == sname
                     select new { tblScheme.Price,tblScheme.PlanImage }).FirstOrDefault();
        divSubscribe.Visible = true; 
        divChosen.Visible = false;
        lblPlan.Text = sname;
        lblPrice.Text = price.Price.ToString();
        cost = price.Price;
        imgDisplay.ImageUrl = price.PlanImage;        
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        divSubscribe.Visible = true;
        divChosen.Visible = false;
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Session["plan"] = sname;
        Session["time"] = lblChosenTime.Text;
        Response.Redirect("MemCreditCard.aspx");
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}