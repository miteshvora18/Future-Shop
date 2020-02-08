<%@ Page Title="" Language="C#" MasterPageFile="~/Categories.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products"  %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    <div style="height: 798px; background-color: #FFFFFF;">
    <div style="z-index: 1; left: 1px; top: 0px; position: absolute; height: 800px; width: 980px">
        <div style="z-index: 1; left: 4px; top: 3px; position: absolute; height: 46px; width: 763px">
        <asp:Label ID="lblNoMatch" runat="server" Font-Bold="True" Font-Size="20pt" 
            style="z-index: 1; left: 179px; top: 37px; position: absolute; height: 55px; width: 450px" 
            Text="Sorry No Match Found !"></asp:Label>
            <asp:Label ID="lblProduct" runat="server" Font-Bold="True" Font-Size="X-Large" 
                ForeColor="#CC0000" 
                style="z-index: 1; left: 21px; top: 7px; position: absolute"></asp:Label>
        
            
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
                Font-Size="Large" onclick="lnkBack_Click" 
                style="z-index: 1; left: 597px; top: 14px; position: absolute">Back</asp:LinkButton>
    </a>
        
            
        
        </div>
        <div style="z-index: 1; left: 7px; top: 54px; position: absolute; height: 741px; width: 737px; margin-right: 12px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
                <div style="height: 546px">
                <asp:Button ID="btnCompare" runat="server" BackColor="Black" 
                BorderStyle="Outset" Font-Size="Medium" ForeColor="White" 
                onclick="btnCompare_Click" 
                style="z-index: 1; left: 566px; top: 2px; position: absolute; width: 145px" 
                Text="CompareProducts" />
                <div runat="server" id="division" style="height: 240px; border:2 solid black; width: 361px;">
                    <asp:DataList ID="DataList1" runat="server" BorderColor="Black" 
                        CellSpacing="40" DataKeyField="PID" EnableViewState="False" 
                        onitemcommand="DataList1_ItemCommand" onitemdatabound="DataList1_ItemDataBound" 
                        RepeatColumns="4" RepeatDirection="Horizontal" Width="243px">
                        <ItemTemplate>
                        <table>
                        <tr>
                        <td style="width: 98px">
                            <asp:Label ID="lblSoldOut" runat="server" BackColor="Yellow" Font-Size="Large" 
                                Text="Out Of Stock"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td style="width: 98px">
                            <asp:ImageButton ID="imgProducts" runat="server" BorderColor="Silver" 
                                BorderStyle="Solid" BorderWidth="4px" Height="115" 
                                ImageUrl='<%# Eval("PicPath") %>' Width="115" CssClass="txtbox"/>
                                
                                  
                                 </td>
                        </tr>
                        <tr>
                        <td style="width: 98px">                    
                            <asp:CheckBox ID="SelectedCheckBox" runat="server" />
                            <asp:Label ID="lblOffer" runat="server" BackColor="Yellow" CssClass="lbl" 
                                Font-Size="Large"></asp:Label>
                            </td>
                            </tr>
                            <tr>
                            <td>
                            <asp:Label ID="lblPName" runat="server" Font-Bold="True" Font-Size="Medium" 
                                Height="18px" style="text-align:center" Text='<%# Eval("ProductName") %>' 
                                Width="115px"></asp:Label>
                            <br />                       
                       </td>
                       </tr>
                       </table>
                             </ItemTemplate>
                    </asp:DataList>
                    
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString9 %>" 
                        SelectCommand="SELECT [PicPath], [SCID], [CID],[ProductName],[PID] FROM [Products] WHERE ([SCID] = @SCID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="SCID" SessionField="scid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DataList1" EventName="ItemCommand" />
                    <asp:AsyncPostBackTrigger ControlID="btnCompare" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    </div>
</asp:Content>



