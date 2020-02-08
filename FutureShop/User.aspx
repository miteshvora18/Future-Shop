<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>



<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div style="height: 796px">
        <asp:DataList ID="DataListCategory" runat="server" DataKeyField="CID" RepeatColumns="2"
            DataSourceID="SqlDataSource1" RepeatDirection="Vertical" 
            BorderColor="Black" CellSpacing="5" 
            
            style="z-index: 1; left: 8px; top: 7px; position: absolute; height: 470px; width: 239px" 
            onitemcommand="DataListCategory_ItemCommand" >
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" runat="server" Width="100" Height="120" 
    ImageUrl='<%# Eval("PicPath") %>' BorderColor="#CCCCCC" 
                        BorderStyle="Solid" BorderWidth="2px" />
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" 
                    ForeColor="White" Text='<%# Eval("CategoryName") %>' Width="110px" 
                    style="text-align:center"></asp:Label>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString12 %>" 
            SelectCommand="SELECT Top 9 [PicPath], [CategoryName],[CID] FROM [Category]">
        </asp:SqlDataSource>
    </div>
</asp:Content>




<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    <div style="height: 796px; background-color: #FFFFFF;">
        <div style="height: 238px">
            <div style="z-index: 1; left: 1px; top: 290px; position: absolute; height: 502px; width: 710px">
              
               
                <asp:UpdatePanel ID="UpdatePanelSubCategory" runat="server">
                <ContentTemplate>
                
                    <div style="height: 494px">
                        <asp:DataList ID="DataListSubCategory" runat="server" CellSpacing="6" 
                            DataKeyField="SCID" RepeatColumns="4" RepeatDirection="Horizontal" 
                            onitemcommand="DataListSubCategory_ItemCommand" 
                            onselectedindexchanged="DataListSubCategory_SelectedIndexChanged">
                            <ItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton2" runat="server" BorderColor="Silver" 
                                                BorderStyle="Solid" BorderWidth="4px" Height="150" 
                                                ImageUrl='<%# Eval("PicPath") %>' width="150" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" 
                                                style="text-align:center; font-weight:bold" Text='<%# Eval("SCategoryName") %>' 
                                                Width="155"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <table>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Height="31px" 
                                        onclick="btnprevious_Click" Text="&lt;" Width="43px" />
                                </td>
                                <td>
                                    <asp:Button ID="btnnext" runat="server" Font-Bold="true" Height="31px" 
                                        onclick="btnnext_Click" Text="&gt;" Width="43px" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </div>
                
                </ContentTemplate>
                    <Triggers>                 
                        <asp:AsyncPostBackTrigger ControlID="btnnext" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnprevious" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="DataListSubCategory" 
                            EventName="ItemCommand" />
                    </Triggers>
                </asp:UpdatePanel>
                
            </div>
        
        </div>
    </div>
</asp:Content>





