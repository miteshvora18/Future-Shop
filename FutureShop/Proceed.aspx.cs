using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

public partial class Proceed : System.Web.UI.Page
{
    DataClassesDataContext cat = new DataClassesDataContext();
    int tot;
    static int offers=0;
    protected void Page_Load(object sender, EventArgs e)
    {
       
            var offer = (from tblUser in cat.UserRegisters
                         where tblUser.FirstName == Session["username"].ToString()
                         select tblUser.PlanSelected).FirstOrDefault();

            

            if (offer == "Silver")
            {
                offers = 1;
            }
            else if (offer == "Gold")
            {
                offers = 2;
            }
            else if (offer == "Platinum")
            {
                offers = 3;
            }
       
       
         
        divAddress.Visible = false;
        divconfirm.Visible = true;
        divsure.Visible = false;
        divsuremem.Visible = false;
        List<int> pidList = (List<int>)Session["product"];       
        string total=Session["total"].ToString();
        string str = total;
        string strSplit = "Rs ";
        StringBuilder strB = new StringBuilder("", 200);

        Regex r = new Regex(strSplit);
        string[] s = r.Split(str);

        foreach (object o in s)
        {
            strB.Append(o.ToString());
        }

        string a = strB.ToString();
        tot = Convert.ToInt32(a);
       
        lblTotAmount.Text = tot.ToString() + " + Shipping Charges";
        if (!Page.IsPostBack)
        {
            foreach (int values in pidList)
            {
                var pname = (from tblProduct in cat.Products
                             where tblProduct.PID == values
                             select tblProduct.ProductName).FirstOrDefault();
                lstProduct.Items.Add(pname);
            }
            var region = from tblDistrict in cat.RegionMappings
                         select tblDistrict.RegionName;

            drpRegion.DataSource = region;
            drpRegion.DataBind();
            drpRegion.Items.Insert(0, new ListItem("--Select--", string.Empty));
        }
        
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        divAddress.Visible = true;
        divconfirm.Visible = false;           
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
    protected void drpRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        var rid=(from tblRegion in cat.RegionMappings
                   where tblRegion.RegionName==drpRegion.SelectedValue
                   select tblRegion.RID).FirstOrDefault();

        var district = from tblDistrict in cat.DisrictMappings
                       where tblDistrict.RID == rid
                       select tblDistrict.District;

        drpDistrict.DataSource = district;
        drpDistrict.DataBind();
        drpDistrict.Items.Insert(0, new ListItem("--Select--", string.Empty));
        divAddress.Visible = true;
        divconfirm.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var userid = (from tblUser in cat.UserRegisters
                      where tblUser.UserName == Session["username"].ToString()
                      select tblUser.UserID).FirstOrDefault();
       
        Session["fullname"] = txtFullName.Text;
        Session["userid"] = userid;
        Session["shippingadd"] = txtAdress1.Text + txtAdress2.Text;
        Session["region"] = drpRegion.SelectedValue;
        Session["district"] = drpDistrict.SelectedValue;

        var rid=(from tblRegion in cat.RegionMappings
                 where tblRegion.RegionName==drpRegion.SelectedValue
                 select tblRegion.RID).FirstOrDefault();
        var ship = (from tblShip in cat.ShippingCharges
                    where tblShip.RID == rid
                    select tblShip.Charges).FirstOrDefault();
        int gtotal = ship + tot;
        Session["shipcharge"] = ship;
        Session["total"] = tot;
        Session["gtotal"] = gtotal;
        divAddress.Visible = false;
        divconfirm.Visible = false;
        if (offers == 0)
        {
            divsure.Visible = true;
            lblDisp.Text = "Dear, " + Session["username"];
            lblTotal.Text = "Rs " + tot.ToString();
            lblShip.Text = "Rs " + ship.ToString();
            lblGTot.Text = "Rs " + gtotal.ToString();
        }
        else
        {
            if (offers == 1)
            {
                divsuremem.Visible = true;
               // lblDispMem.Text = "Dear, " + Session["username"];
                lblTotalMem.Text = "Rs " + tot.ToString();
                lblShipMem.Text = "Rs " + ship.ToString();
                //lblGTotMem.Text = "Rs " + gtotal.ToString();
               // lblMem.Text = "Silver ";
                lblOff.Text = "5";
                int total = gtotal * 5 / 100;
                int gtot = gtotal - total;
                lblGtotal.Text = "Rs " + gtot.ToString();
                Session["gtotal"] = gtot;
            }
            else if (offers == 2)
            {
                divsuremem.Visible = true;
                //lblDispMem.Text = "Dear, " + Session["username"];
                lblTotalMem.Text = "Rs " + tot.ToString();
                lblShipMem.Text = "Rs " + ship.ToString();
               // lblGTotMem.Text = "Rs " + gtotal.ToString();
                //lblMem.Text = "Gold ";
                lblOff.Text = "10";
                int total = gtotal * 10 / 100;
                int gtot = gtotal - total;
                lblGtotal.Text = "Rs " + gtot.ToString();
                Session["gtotal"] = gtot;
            }
            else if (offers == 3)
            {
                divsuremem.Visible = true;
                //lblDispMem.Text = "Dear, " + Session["username"];
                lblTotalMem.Text = "Rs " + tot.ToString();
                lblShipMem.Text = "Rs " + ship.ToString();
                //lblGTotMem.Text = "Rs " + gtotal.ToString();
                //lblMem.Text = "Gold ";
                lblOff.Text = "15";
                int total = gtotal * 15 / 100;
                int gtot = gtotal - total;
                lblGtotal.Text = "Rs " + gtot.ToString();
                Session["gtotal"] = gtot;
            }
        }
       
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreditCard.aspx");
    }
    protected void btnBackSure_Click(object sender, EventArgs e)
    {
        divAddress.Visible = true;
        divconfirm.Visible = false;
        divsure.Visible = false;

    }   
    protected void btnBackAddrss_Click(object sender, EventArgs e)
    {
        divAddress.Visible = false;
        divconfirm.Visible = true;
        divsure.Visible = false;
    }
}