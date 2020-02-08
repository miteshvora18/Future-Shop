﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AboutUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (ViewState["RefUrl"] != null)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
       
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }
}