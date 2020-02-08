<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddOffer.aspx.cs" Inherits="AddNewsLetter" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 256px;
        }
        .error 
        {
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
        </style>
         <script type="text/javascript">
                  function addpro() {
                      var drpProduct = document.getElementById('<%=drpProduct.ClientID %>');
                      
                      var Discount = document.getElementById('<%=txtDiscount.ClientID %>').value;
                     

                  if (drpProduct.selectedIndex == 0) {
                      document.getElementById("<%=drpProduct.ClientID%>").className = "error";
                      return false;
                  }                 
                  if (Discount == "") {
                      document.getElementById("<%=txtDiscount.ClientID%>").className = "error";
                      return false;
                  }                 

              }
              function addpros() {
                  
                  var drpPlan = document.getElementById('<%=drpPlan.ClientID %>');
                  var drpProMem = document.getElementById('<%=drpProMem.ClientID %>');
                 
                  var DiscountMem = document.getElementById('<%=txtDisMem.ClientID %>').value;

                 
                  if (drpPlan.selectedIndex == 0) {
                      document.getElementById("<%=drpPlan.ClientID%>").className = "error";
                      return false;
                  }
                  if (drpProMem.selectedIndex == 0) {
                      document.getElementById("<%=drpProMem.ClientID%>").className = "error";
                      return false;
                  }                  
                  if (DiscountMem == "") {
                      document.getElementById("<%=txtDisMem.ClientID%>").className = "error";
                      return false;
                  }

              }              
              function dismem() {
                  document.getElementById("<%=txtDisMem.ClientID%>").className = "errorgone";
                  return false;
              }
         </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 766px">    
        <div style="z-index: 1; left: -1px; top: 1px; position: absolute; height: 767px; width: 707px">
            <div style="z-index: 1; left: 40px; top: 69px; position: absolute; height: 686px; width: 630px">                   
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>   
                        
                        <div ID="divTab" runat="server" 
                            style="border: thin solid #FF00FF; z-index: 1; left: 15px; height: 400px; width: 620px; background-color: #FFFFFF; top: 23px; position: absolute;">
                            <asp:Button ID="Tab1" runat="server" BorderStyle="None" CssClass="Initial" 
                                Height="37px" OnClick="Tab1_Click" Text="Users" Width="120px" />
                            <asp:Button ID="Tab2" runat="server" BorderStyle="None" 
                                CausesValidation="False" CssClass="Initial" Height="37px" OnClick="Tab2_Click" 
                                Text="Members" />
                            <asp:MultiView ID="MainView" runat="server">
                                <asp:View ID="View1" runat="server">
                                    <table style="width: 100%;border-top-style: solid; border-top-width: medium; border-top-color: #B30000">
                                        <tr>
                                            <td class="style1">
                                                <div ID="divEditDeal" runat="server" 
                                                    style="z-index: 1; left: -2px; top: 0px; position: relative; height: 316px; width: 606px">
                                                    <asp:Label ID="Label6" runat="server" Font-Size="Large" 
                                                        style="z-index: 1; left: 36px; top: 80px; position: absolute" Text="Product"></asp:Label>
                                                    <asp:DropDownList ID="drpProduct" runat="server" AutoPostBack="True" 
                                                        onselectedindexchanged="drpProduct_SelectedIndexChanged" 
                                                        style="z-index: 1; left: 183px; top: 78px; position: absolute; height: 22px; width: 154px">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="Label7" runat="server" Font-Size="Large" 
                                                        style="z-index: 1; left: 36px; top: 143px; position: absolute" 
                                                        Text="Discount (in %)"></asp:Label>
                                                    <asp:TextBox ID="txtDiscount" runat="server" onFocus="dis();" 
                                                        style="z-index: 1; left: 183px; top: 141px; position: absolute; height: 22px; width: 154px;"></asp:TextBox>
                                                    <asp:Button ID="btnSubmit" runat="server" BackColor="Black" 
                                                        BorderStyle="Outset" Font-Size="Medium" ForeColor="White" 
                                                        onclick="btnSubmit_Click" OnClientClick="return addpro();" 
                                                        style="z-index: 1; left: 106px; top: 225px; position: absolute; width: 115px;" 
                                                        Text="Submit" />
                                                    <asp:Label ID="lblPCatName" runat="server" ForeColor="Red" 
                                                        style="z-index: 1; left: 14px; top: 144px; position: absolute; bottom: 156px;" 
                                                        Text="*" Width="15px"></asp:Label>
                                                    <asp:Label ID="lblPCatName0" runat="server" ForeColor="Red" 
                                                        style="z-index: 1; left: 14px; top: 82px; position: absolute; bottom: 218px;" 
                                                        Text="*" Width="15px"></asp:Label>
                                                    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" 
                                                        style="z-index: 1; left: 355px; top: 141px; position: absolute"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View2" runat="server">
                                    <table style="width: 100%; border-top-style: solid; border-top-width: medium; border-top-color: #B30000">
                                        <tr>
                                            <td>
                                                <div ID="EditDeal2" runat="server" 
                                                    style="z-index: 1; left: -2px; top: 0px; position: relative; height: 378px; width: 606px">
                                                    <asp:Button ID="btnTab1" runat="server" BorderStyle="None" 
                                                        CausesValidation="False" CssClass="Initial" Height="37px" 
                                                        OnClick="btnTab1_Click" Text="Products" />
                                                    <br>
                                                    <asp:MultiView ID="MultiView1" runat="server">
                                                        <asp:View ID="View3" runat="server">
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td class="style2">
                                                                        <div style="z-index: 1; left: -2px; top: 0px; position: relative; height: 295px; width: 606px">
                                                                            <asp:Label ID="Label1" runat="server" Font-Size="Large" 
                                                                                style="z-index: 1; left: 36px; top: 116px; position: absolute" Text="Product"></asp:Label>
                                                                            <asp:DropDownList ID="drpProMem" runat="server" AutoPostBack="True" 
                                                                                onselectedindexchanged="drpProMem_SelectedIndexChanged" 
                                                                                style="z-index: 1; left: 183px; top: 112px; position: absolute; height: 22px; width: 154px">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label2" runat="server" Font-Size="Large" 
                                                                                style="z-index: 1; left: 36px; top: 183px; position: absolute" 
                                                                                Text="Discount (in %)"></asp:Label>
                                                                            <asp:TextBox ID="txtDisMem" runat="server" onFocus="dismem();" 
                                                                                style="z-index: 1; left: 183px; top: 181px; position: absolute; height: 22px; width: 154px;"></asp:TextBox>
                                                                            <asp:Button ID="btnSubMem" runat="server" BackColor="Black" 
                                                                                BorderStyle="Outset" Font-Size="Medium" ForeColor="White" 
                                                                                onclick="btnSubMem_Click" OnClientClick="return addpros();" 
                                                                                style="z-index: 1; left: 106px; top: 257px; position: absolute; width: 115px;" 
                                                                                Text="Submit" />
                                                                            <asp:Label ID="Label14" runat="server" Font-Size="Large" 
                                                                                style="z-index: 1; left: 36px; top: 52px; position: absolute" Text="Plan"></asp:Label>
                                                                            <asp:DropDownList ID="drpPlan" runat="server" AutoPostBack="True" 
                                                                                onselectedindexchanged="drpPlan_SelectedIndexChanged" 
                                                                                style="z-index: 1; left: 183px; top: 50px; position: absolute; height: 22px; width: 154px">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="lblPCatName1" runat="server" ForeColor="Red" 
                                                                                style="z-index: 1; left: 14px; top: 52px; position: absolute; bottom: 230px;" 
                                                                                Text="*" Width="15px"></asp:Label>
                                                                            <asp:Label ID="lblPCatName2" runat="server" ForeColor="Red" height="13" 
                                                                                style="z-index: 1; left: 14px; top: 183px; position: absolute; " Text="*" 
                                                                                Width="15px"></asp:Label>
                                                                            <asp:Label ID="lblPCatName3" runat="server" ForeColor="Red" height="13" 
                                                                                style="z-index: 1; left: 14px; top: 116px; position: absolute; " Text="*" 
                                                                                Width="15px"></asp:Label>
                                                                            <asp:Label ID="lblEditError" runat="server" Font-Bold="True" ForeColor="Red" 
                                                                                style="z-index: 1; left: 355px; top: 181px; position: absolute"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:View>
                                                    </asp:MultiView>
                                                   
                                                   
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                        </div>
                                      
  
            </ContentTemplate> 
                          
                   
                          
        </asp:UpdatePanel>            
                   
     </div>
    
    <asp:Label ID="Label19" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 444px; top: 43px; position: absolute" 
                                Text="(Fields marked with * are mandatory)"></asp:Label>
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
                Font-Size="Large" onclick="lnkBack_Click" 
                style="z-index: 1; left: 565px; top: 12px; position: absolute">Back</asp:LinkButton>
    </a>
        
     </div>
    </div>
</asp:Content>

