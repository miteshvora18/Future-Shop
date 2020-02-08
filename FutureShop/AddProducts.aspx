<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .error {
         BORDER-RIGHT: red 2px solid;
        BORDER-TOP: red 2px solid;
        BORDER-LEFT: red 2px solid;
        BORDER-BOTTOM: red 2px solid 
        }
        .errorgone
        {
            BORDER-RIGHT: NotSet;
            BORDER-TOP: NotSet;
            BORDER-LEFT: NotSet;
            BORDER-BOTTOM: NotSet
        }
        .errorfp
        {
            color:Red  
        }
        .errorgonefp
        {
            color:Black  
        }
        
   </style>
                  <script type="text/javascript">
                  function addpro() {
                  var drpCat = document.getElementById('<%=drpCatAddProduct.ClientID %>');
                  var drpSCat = document.getElementById('<%=drpSubCatAddPro.ClientID %>');
                  var ProName = document.getElementById('<%=txtProductName.ClientID %>').value;
                  var Price = document.getElementById('<%=txtPrice.ClientID %>').value;
                  var Desc = document.getElementById('<%=txtDescription.ClientID %>').value;
                  var bname = document.getElementById('<%=txtBrandName.ClientID %>').value;
                  var qty = document.getElementById('<%=txtQty.ClientID %>').value;
                  var Fupload1 = document.getElementById('<%=PictureUpload.ClientID %>').value;
                  if (drpCat.selectedIndex == 0) {
                      document.getElementById("<%=drpCatAddProduct.ClientID%>").className = "error";
                      return false;
                  }
                  if (drpSCat.selectedIndex == 0) {
                      document.getElementById("<%=drpSubCatAddPro.ClientID%>").className = "error";
                      return false;
                  }
                  if (ProName == "") {
                      document.getElementById("<%=txtProductName.ClientID%>").className = "error";
                      return false;
                  }
                  if (Price == "") {
                      document.getElementById("<%=txtPrice.ClientID%>").className = "error";
                      return false;
                  }
                  if (Desc == "") {
                      document.getElementById("<%=txtDescription.ClientID%>").className = "error";
                      return false;
                  }
                  if (bname == "") {
                      document.getElementById("<%=txtBrandName.ClientID%>").className = "error";
                      return false;
                  }
                  if (qty == "") {
                      document.getElementById("<%=txtQty.ClientID%>").className = "error";
                      return false;
                  }
                  if (Fupload1 == "") {
                      document.getElementById("<%=PictureUpload.ClientID%>").className = "errorfp";
                      return false;
                  }

              }
              function pname() {
                  document.getElementById("<%=txtProductName.ClientID%>").className = "errorgone";
                  return false;
              }
              function qty() {
                  document.getElementById("<%=txtQty.ClientID%>").className = "errorgone";
                  return false;
              }
              function price() {
                  document.getElementById("<%=txtPrice.ClientID%>").className = "errorgone";
                  return false;
              }
              function desc() {
                  document.getElementById("<%=txtDescription.ClientID%>").className = "errorgone";
                  return false;
              }
              function bname() {
                  document.getElementById("<%=txtBrandName.ClientID%>").className = "errorgone";
                  return false;
              }
              function funup3() {
                  document.getElementById("<%=PictureUpload.ClientID%>").className = "errorgonefp";
                  return false;

              }
              </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 768px">
    
        <div style="z-index: 1; left: 2px; top: 0px; position: absolute; height: 764px; width: 689px">
            <div style="z-index: 1; left: 17px; top: 75px; position: absolute; height: 460px; width: 672px">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div style="height: 455px">
                            <div ID="divAddProducts" runat="server" 
                                style="border: thin solid #000000; z-index: 1; left: 6px; top: 3px; position: relative; height: 438px; width: 655px">
                                <asp:TextBox ID="txtDescription" runat="server" onFocus="desc();" 
                                    style="z-index: 1; left: 172px; top: 158px; position: absolute; height: 70px; width: 285px" 
                                    TextMode="MultiLine"></asp:TextBox>
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 248px; position: absolute" 
                                    Text="Brand Name"></asp:Label>
                                <asp:TextBox ID="txtBrandName" runat="server" onFocus="bname();" 
                                    style="z-index: 1; left: 172px; top: 251px; position: absolute" width="149px"></asp:TextBox>
                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 344px; top: 27px; position: absolute" 
                                    Text="SubCategory Name"></asp:Label>
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 28px; position: absolute" 
                                    Text="Category Name"></asp:Label>
                                <asp:DropDownList ID="drpCatAddProduct" runat="server" AutoPostBack="True" 
                                    
                                    onselectedindexchanged="drpCatAddProduct_SelectedIndexChanged" 
                                    style="z-index: 1; left: 172px; top: 27px; position: absolute; height: 22px; width: 149px">
                                    <asp:ListItem Selected="True">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="lblQtyError" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 340px; top: 342px; position: absolute">Only Numbers Allowed</asp:Label>
                                <asp:Label ID="lblPPrice" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 14px; top: 121px; position: absolute" Text="*"></asp:Label>
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 81px; position: absolute" 
                                    Text="Name Of Product"></asp:Label>
                                <asp:TextBox ID="txtProductName" runat="server" onFocus="pname();" 
                                    style="z-index: 1; left: 172px; top: 76px; position: absolute" width="149px"></asp:TextBox>
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 120px; position: absolute" Text="Price"></asp:Label>
                                <asp:TextBox ID="txtPrice" runat="server" onFocus="price();" 
                                    style="z-index: 1; left: 172px; top: 119px; position: absolute" width="149px"></asp:TextBox>
                                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 163px; position: absolute" 
                                    Text="Description"></asp:Label>
                                <asp:FileUpload ID="PictureUpload" runat="server" onFocus="funup3();" 
                                    style="z-index: 1; left: 173px; top: 298px; position: absolute; width: 214px" />
                                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 295px; position: absolute" 
                                    Text="Product Picture"></asp:Label>
                                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 342px; position: absolute" 
                                    Text="Total Quantity"></asp:Label>
                                <asp:TextBox ID="txtQty" runat="server" onFocus="qty();" 
                                    style="z-index: 1; left: 172px; top: 342px; position: absolute" width="149px"></asp:TextBox>
                                <asp:DropDownList ID="drpSubCatAddPro" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="drpSubCatAddPro_SelectedIndexChanged" 
                                    style="z-index: 1; left: 482px; top: 26px; position: absolute" width="149px">
                                </asp:DropDownList>
                                <asp:Button ID="btnSubmitProduct" runat="server" BackColor="Black" 
                                    BorderStyle="Inset" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                                    onclick="btnSubmitProduct_Click" OnClientClick="return addpro();" 
                                    style="z-index: 1; left: 32px; top: 388px; position: absolute; width: 90px;" 
                                    Text="Submit" ValidationGroup="Pro" />
                                <asp:Label ID="lblPCatName" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 14px; top: 27px; position: absolute; bottom: 404px;" 
                                    Text="*" Width="15px"></asp:Label>
                                <asp:Label ID="lblDescription" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 14px; top: 158px; position: absolute" Text="*"></asp:Label>
                                <asp:Label ID="lblBName" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 14px; top: 251px; position: absolute" Text="*"></asp:Label>
                                <asp:Label ID="lblPPic" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 14px; top: 298px; position: absolute" Text="*"></asp:Label>
                                <asp:Label ID="lblPScatName" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 329px; top: 28px; position: absolute" Text="*"></asp:Label>
                                <asp:Label ID="lblTQ" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 14px; top: 342px; position: absolute" Text="*"></asp:Label>
                                <asp:Label ID="lblPName" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 14px; top: 76px; position: absolute" Text="*"></asp:Label>
                                <asp:Label ID="lblProDisplay" runat="server" Font-Size="Large" ForeColor="Blue" 
                                    style="z-index: 1; left: 202px; top: 390px; position: absolute"></asp:Label>
                                <asp:Label ID="lblPriceError" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 340px; top: 119px; position: absolute">Only Numbers Allowed</asp:Label>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="drpCatAddProduct" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="drpSubCatAddPro" 
                            EventName="SelectedIndexChanged" />
                            <asp:PostBackTrigger ControlID="btnSubmitProduct"  />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
    
    <asp:Label ID="Label19" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 444px; top: 43px; position: absolute" 
                                Text="(Fields marked with * are mandatory)"></asp:Label>
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
                Font-Size="Large" onclick="lnkBack_Click" 
                style="z-index: 1; left: 580px; top: 10px; position: absolute">Back</asp:LinkButton>
    </a>
        
        </div>
    </div>
</asp:Content>

