using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Categories : System.Web.UI.MasterPage
{
    string conn = System.Configuration.ConfigurationManager.ConnectionStrings["FutureShopConnectionString12"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            fill_ParentAssTask();
        }
    }
    protected DataSet PDatasetAssTAsk(string Select_Statement)
    {
        SqlConnection SqlCon = new SqlConnection(conn);
        SqlDataAdapter ad = new SqlDataAdapter("Select Top 9 * from Category", SqlCon);

        DataSet ds = new DataSet();

        ad.Fill(ds);

        return ds;
    }
    void fill_ParentAssTask()
    {
        DataSet PrSet = PDatasetAssTAsk("Select Top 9 CategoryName,CID from Category");
        TreeView1.Nodes.Clear();
        foreach (DataRow dr in PrSet.Tables[0].Rows)
        {
            TreeNode tnParent = new TreeNode();
            tnParent.Text = dr["CategoryName"].ToString();
            tnParent.Value = dr["CategoryName"].ToString();
            int id = Convert.ToInt32(dr["CID"]);  
            tnParent.Expand();
            tnParent.Selected = true;
            TreeView1.Nodes.Add(tnParent);
            FillChildAssTAsk(tnParent, id);
            tnParent.NavigateUrl = "SubCategories.aspx?Parameter="+id;
        }
    }
    public void FillChildAssTAsk(TreeNode parent, int catid)
    {

        SqlConnection SqlCon = new SqlConnection(conn);
        SqlCon.Open();
        SqlCommand cmd = new SqlCommand("Select SCategoryName,SCID from SubCategory where CID =@id", SqlCon);
        cmd.Parameters.AddWithValue("@id", catid);
        SqlDataReader dr = cmd.ExecuteReader();
     
        while (dr.Read())
        {

            TreeNode child = new TreeNode();
           

            child.Text = dr["SCategoryName"].ToString().Trim();
            child.Value = dr["SCategoryName"].ToString().Trim();
            int id = Convert.ToInt32(dr["SCID"]);
            foreach (TreeNode node in TreeView1.Nodes)
            {
                string scname = child.Text;
                child.NavigateUrl = "Products.aspx?Parameter=" + id;
            }
            parent.ChildNodes.Add(child);
        }
        TreeView1.CollapseAll();
    }
}
