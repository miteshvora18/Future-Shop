<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddDealOfDay.aspx.cs" Inherits="AddDealOfDay" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        
         .style1
         {
             width: 50;
             height: 361px;
         }
        
       </style>
        <script type="text/javascript">
            function Deal() {
                var drpCat = document.getElementById('<%=drpCategoryDeal.ClientID %>');
                var drpSCat = document.getElementById('<%=drpSCatDeal.ClientID %>');
                var ProName = document.getElementById('<%=drpProductDeal.ClientID %>').value;
                var Discount = document.getElementById('<%=txtDiscount.ClientID %>').value;
               
                if (drpCat.selectedIndex == 0) {
                    document.getElementById("<%=drpCategoryDeal.ClientID%>").className = "error";
                    return false;
                }
                if (drpSCat.selectedIndex == 0) {
                    document.getElementById("<%=drpSCatDeal.ClientID%>").className = "error";
                    return false;
                }
                if (ProName == "") {
                    document.getElementById("<%=drpProductDeal.ClientID%>").className = "error";
                    return false;
                }
                if (Discount == "") {
                    document.getElementById("<%=txtDiscount.ClientID%>").className = "error";
                    return false;
                }                
            }
            function discount() {
                document.getElementById("<%=txtDiscount.ClientID%>").className = "errorgone";
                return false;
            }
            function EditDeal() {
                var drpCat = document.getElementById('<%=drpEditCat.ClientID %>');
                var drpSCat = document.getElementById('<%=drpEditSCat.ClientID %>');
                var ProName = document.getElementById('<%=drpEditProduct.ClientID %>').value;
                var Discount = document.getElementById('<%=txtEditDiscount.ClientID %>').value;

//                if (drpCat.selectedIndex == 0) {
//                    document.getElementById("<%=drpEditCat.ClientID%>").className = "error";
//                    return false;
//                }
//                if (drpSCat.selectedIndex == 0) {
//                    document.getElementById("<%=drpEditSCat.ClientID%>").className = "error";
//                    return false;
//                }
//                if (ProName == "") {
//                    document.getElementById("<%=drpEditProduct.ClientID%>").className = "error";
//                    return false;
//                }
                if (Discount == "") {
                    document.getElementById("<%=txtEditDiscount.ClientID%>").className = "error";
                    return false;
                }
            }
            function discount2() {
                document.getElementById("<%=txtEditDiscount.ClientID%>").className = "errorgone";
                return false;
            }
            
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 765px; margin-left: 4px">
        <div style="z-index: 1; left: 29px; top: 59px; position: absolute; height: 487px; width: 651px">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div style="height: 486px">                
                    <div ID="divTab" runat="server" 
                        
                        
                        style="border: thin solid #000000; z-index: 1; left: 15px; height: 447px; width: 620px; background-color: #FFFFFF; top: 23px; position: absolute;">
                        <asp:Button ID="Tab1" runat="server" BorderStyle="None" CssClass="Initial" 
                            Height="37px" OnClick="Tab1_Click" Text="Add Deal" />
                        <asp:Button ID="Tab2" runat="server" BorderStyle="None" 
                            CausesValidation="False" CssClass="Initial" Height="37px" OnClick="Tab2_Click" 
                            Text="Edit Deal" />                        
                         <asp:Button ID="Tab3" runat="server" BorderStyle="None" 
                        CausesValidation="False" CssClass="Initial" Height="37px" OnClick="Tab3_Click" 
                        Text="View Deals" />
                        <asp:MultiView ID="MainView" runat="server">
                            <asp:View ID="View1" runat="server">
                                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td class="style1">
                                           <div ID="divEditDeal" runat="server"                  
                        
                                                
                                                style="z-index: 1; left: -2px; top: 0px; position: relative; height: 282px; width: 606px">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 41px; top: 47px; position: absolute; width: 108px;" 
                                Text="Category"></asp:Label>
                            <asp:DropDownList ID="drpCategoryDeal" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="drpCategoryDeal_SelectedIndexChanged" 
                                
                                style="z-index: 1; left: 162px; top: 42px; position: absolute; height: 22px; width: 135px">
                            </asp:DropDownList>
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 322px; top: 47px; position: absolute; width: 108px" 
                                Text="SubCategory"></asp:Label>
                            <asp:DropDownList ID="drpSCatDeal" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="drpSCatDeal_SelectedIndexChanged" 
                                style="z-index: 1; left: 438px; top: 44px; position: absolute" width="135px">
                            </asp:DropDownList>
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 41px; top: 94px; position: absolute" Text="Product" 
                                width="108px"></asp:Label>
                            <asp:DropDownList ID="drpProductDeal" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="drpProductDeal_SelectedIndexChanged" 
                                style="z-index: 1; left: 162px; top: 91px; position: absolute" width="135px">
                            </asp:DropDownList>
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 41px; top: 135px; position: absolute" Text="Price" 
                                width="108px"></asp:Label>
                            <asp:TextBox ID="txtDiscount" runat="server" onFocus="discount();"
                                style="z-index: 1; left: 161px; top: 212px; position: absolute" width="135px"></asp:TextBox>
                            <asp:Label ID="lblPrice" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 162px; top: 135px; position: absolute; width: 135px"></asp:Label>
                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 39px; top: 173px; position: absolute" 
                                Text="Total Quantity" width="108px"></asp:Label>
                            <asp:Label ID="lblQty" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 162px; top: 173px; position: absolute" width="135px"></asp:Label>
                            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 39px; top: 213px; position: absolute" 
                                Text="Discount in %" width="108px"></asp:Label>
                            <asp:Button ID="btnSubmitDeal" runat="server" BackColor="Black" 
                                Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                                onclick="btnSubmitDeal_Click"  OnClientClick="return Deal();"
                                style="z-index: 1; left: 39px; top: 243px; position: absolute; width: 90px" 
                                Text="Submit" />
                            <asp:Label ID="lblDCat" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 23px; top: 46px; position: absolute" Text="*"></asp:Label>
                            <asp:Label ID="lblDSCat" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 307px; top: 40px; position: absolute" Text="*"></asp:Label>
                            <asp:Label ID="lblDProduct" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 23px; top: 91px; position: absolute" Text="*"></asp:Label>
                            <asp:Label ID="lblDiscount" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 23px; top: 212px; position: absolute" Text="*"></asp:Label>
                            <asp:Label ID="lblDealDisplay" runat="server" Font-Size="Large" 
                                ForeColor="Blue" 
                                style="z-index: 1; left: 192px; top: 245px; position: absolute"></asp:Label>
                                               <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" 
                                                   style="z-index: 1; left: 310px; top: 212px; position: absolute"></asp:Label>
                        </div> 
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td>
                                            <div ID="EditDeal2" runat="server"                  
                        
                                                
                                                style="z-index: 1; left: -2px; top: 0px; position: relative; height: 385px; width: 606px">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 41px; top: 173px; position: absolute; width: 108px;" 
                                Text="Category"></asp:Label>
                            <asp:DropDownList ID="drpEditCat" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="drpEditCat_SelectedIndexChanged" 
                                
                                style="z-index: 1; left: 162px; top: 173px; position: absolute; height: 22px; width: 135px">
                            </asp:DropDownList>
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 322px; top: 173px; position: absolute; width: 108px" 
                                Text="SubCategory"></asp:Label>
                            <asp:DropDownList ID="drpEditSCat" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="drpEditSCat_SelectedIndexChanged" 
                                style="z-index: 1; left: 438px; top: 173px; position: absolute" width="135px">
                            </asp:DropDownList>
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 41px; top: 219px; position: absolute" Text="Product" 
                                width="108px"></asp:Label>
                            <asp:DropDownList ID="drpEditProduct" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="drpEditProduct_SelectedIndexChanged" 
                                style="z-index: 1; left: 162px; top: 216px; position: absolute" width="135px">
                            </asp:DropDownList>
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 41px; top: 256px; position: absolute" Text="Price" 
                                width="108px"></asp:Label>
                            <asp:TextBox ID="txtEditDiscount" runat="server" onFocus="discount2();"
                                style="z-index: 1; left: 161px; top: 295px; position: absolute" width="135px"></asp:TextBox>
                            <asp:Label ID="lblEditPrice" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 162px; top: 256px; position: absolute; width: 135px"></asp:Label>
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 322px; top: 256px; position: absolute" 
                                Text="Total Quantity" width="108px"></asp:Label>
                            <asp:Label ID="lblEditQty" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 438px; top: 256px; position: absolute" width="135px"></asp:Label>
                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 40px; top: 295px; position: absolute" 
                                Text="Discount in %" width="108px"></asp:Label>
                            <asp:Button ID="btnEditSubmit" runat="server" BackColor="Black"  
                                Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                                onclick="btnEditSubmit_Click"  OnClientClick="return EditDeal();"
                                style="z-index: 1; left: 40px; top: 340px; position: absolute; width: 90px" 
                                Text="Submit" />
                            <asp:Label ID="lblC" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 23px; top: 173px; position: absolute" Text="*"></asp:Label>
                            <asp:Label ID="Label14" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 303px; top: 173px; position: absolute; width: 12px;" Text="*"></asp:Label>
                            <asp:Label ID="lblP" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 22px; top: 256px; position: absolute; height: 27px; width: 7px;" 
                                                    Text="*"></asp:Label>
                            <asp:Label ID="Label18" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 23px; top: 295px; position: absolute" Text="*"></asp:Label>
                            <asp:Label ID="lblEditDealDisplay" runat="server" Font-Size="Large" 
                                ForeColor="Blue" 
                                style="z-index: 1; left: 192px; top: 340px; position: absolute"></asp:Label>
                                                <asp:Label ID="Label21" runat="server" ForeColor="Red" 
                                                    style="z-index: 1; left: 388px; top: 4px; position: absolute" 
                                                    Text="You can edit only todays deal..."></asp:Label>
                                                <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Todays Date :"></asp:Label>
                                                <asp:GridView ID="grdDealEdit" runat="server"                                          
                                                    style="z-index: 1; left: 1px; top: 30px; position: absolute; height: 108px; width: 602px" 
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
                                                    AutoGenerateColumns="False" PageSize="1">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                    <asp:Image ID="Image1" runat="server" height="70px" Width="60px"
                                                                        ImageUrl='<%# Eval("PicPath") %>'/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True"/>
                                                        <asp:BoundField DataField="ListPrice" HeaderText="Price"/>
                                                        <asp:BoundField DataField="TodaysDiscount_InPercent" HeaderText="Discount" ReadOnly="True" />
                                                        <asp:BoundField DataField="TodaysDeal" HeaderText="Todays Deal" ReadOnly="True" />
                                                    </Columns>
                                  
                                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                  
                                                </asp:GridView>
                                                <asp:Label ID="lblDate" runat="server" Font-Bold="False" Font-Size="Large" 
                                                    ForeColor="Blue" 
                                                    style="z-index: 1; left: 95px; top: 0px; position: absolute; height: 20px; width: 174px"></asp:Label>
                                                <asp:Label ID="lblP0" runat="server" ForeColor="Red" 
                                                    style="z-index: 1; left: 23px; top: 219px; position: absolute" Text="*"></asp:Label>
                                                <asp:Label ID="lblEditError" runat="server" Font-Bold="True" ForeColor="Red" 
                                                    style="z-index: 1; left: 311px; top: 295px; position: absolute"></asp:Label>
                                            </div> 
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>                            
                              <asp:View ID="View3" runat="server">
                                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td>
                                            <div ID="Div2" runat="server"                                           
                                                style="z-index: 1; left: -2px; top: 0px; position: relative; height: 385px; width: 606px">
                            
                                                <telerik:RadSearchBox ID="RadSearchBox1" runat="server" 
                                                    DataSourceID="SqlDataSource1" DataTextField="ProductName" 
                                                    DataValueField="ProductName" ShowSearchButton="False" 
                                                    style="z-index: 1; left: 141px; top: 14px; position: absolute">
                                                </telerik:RadSearchBox>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString10 %>" 
                                                    SelectCommand="SELECT DISTINCT P.ProductName FROM Products AS P INNER JOIN DealOfDay AS d ON P.PID = d.PID">
                                                </asp:SqlDataSource>
                                                <asp:ImageButton ID="imgBtnSearch" runat="server" BorderColor="Black" 
                                                    ImageUrl="~/Images/search.JPG" onclick="imgBtnSearch_Click" 
                                                    style="z-index: 1; left: 550px; top: 13px; position: absolute; width: 30px; height: 22px;" />
                                                <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" 
                                                    style="z-index: 1; left: 376px; top: 11px; position: absolute" 
                                                    EnableTyping="False" Culture="en-US">
                                                    <calendar usecolumnheadersasselectors="False" 
                                                    userowheadersasselectors="False">
                                                    </calendar>
                                                    <dateinput dateformat="M/d/yyyy" displaydateformat="M/d/yyyy" 
                                                    labelwidth="40%" readonly="True">
                                                        <emptymessagestyle resize="None" />
                                                        <readonlystyle resize="None" />
                                                        <focusedstyle resize="None" />
                                                        <disabledstyle resize="None" />
                                                        <invalidstyle resize="None" />
                                                        <hoveredstyle resize="None" />
                                                        <enabledstyle resize="None" />
                                                    </dateinput>
                                                    <datepopupbutton hoverimageurl="" imageurl="" />
                                                </telerik:RadDatePicker>
                                                <asp:Label ID="Label24" runat="server" Font-Size="Large" 
                                                    style="z-index: 1; left: 324px; top: 14px; position: absolute" Text="Date"></asp:Label>
                                                <asp:Label ID="Label23" runat="server" Font-Size="Large" 
                                                    style="z-index: 1; left: 20px; top: 14px; position: absolute" 
                                                    Text="Product Name"></asp:Label>
                                                <asp:GridView ID="grdDealShows" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                                    GridLines="None" PageSize="3" 
                                                    
                                                    style="z-index: 1; left: 2px; top: 73px; position: absolute; height: 133px; width: 600px" 
                                                    onpageindexchanged="grdDealShows_PageIndexChanged" 
                                                    onpageindexchanging="grdDealShows_PageIndexChanging">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                                    <SortedDescendingHeaderStyle BackColor="#820000" />

                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                    <asp:Image ID="Image1" runat="server" height="70px" Width="60px"
                                                                        ImageUrl='<%# Eval("PicPath") %>'/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True"/>
                                                        <asp:BoundField DataField="ListPrice" HeaderText="Price"/>
                                                        <asp:BoundField DataField="TodaysDiscount_InPercent" HeaderText="Discount" ReadOnly="True" />
                                                        <asp:BoundField DataField="TodaysDeal" HeaderText="Deal" ReadOnly="True" />
                                                        <asp:BoundField DataField="InsertionDate" HeaderText="Date" ReadOnly="True" DataFormatString="{0:dd-MM-yyyy}"   />
                                                    </Columns>
                                                </asp:GridView>
                            
                                            </div> 
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </div>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSubmitDeal" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="drpCategoryDeal" 
                        EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="drpProductDeal" 
                        EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="drpSCatDeal" 
                        EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="btnEditSubmit" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="drpEditCat" 
                        EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="drpEditProduct" 
                        EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="drpEditSCat" 
                        EventName="SelectedIndexChanged" />
                    
                    
                    
                    <asp:AsyncPostBackTrigger ControlID="imgBtnSearch" EventName="Click" />
                    
                    
                    
                    <asp:AsyncPostBackTrigger ControlID="grdDealShows" 
                        EventName="PageIndexChanging" />
                    
                    
                    
                </Triggers>
            </asp:UpdatePanel>
        </div>
    
    <asp:Label ID="Label19" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 444px; top: 30px; position: absolute" 
                                Text="(Fields marked with * are mandatory)"></asp:Label>
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" Font-Size="Large" 
            onclick="lnkBack_Click" 
            style="z-index: 1; left: 592px; top: 6px; position: absolute" 
            CausesValidation="False">Back</asp:LinkButton>
    </a>
        
        </div>
</asp:Content>

