<%@ Page Title="" Language="C#" MasterPageFile="~/Categories.master" AutoEventWireup="true" CodeFile="NewCategories.aspx.cs" Inherits="NewCategories" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    <div style="height: 800px; background-color: #FFFFFF;">
        <div style="height: 34px">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" 
                ForeColor="#993333" 
                style="z-index: 1; left: 20px; top: 1px; position: absolute; width: 285px; height: 26px" 
                Text="NEW CATEGORIES"></asp:Label>
            <div style="z-index: 1; left: 4px; top: 38px; position: absolute; height: 758px; width: 750px">
                <asp:DataList ID="DataList1" runat="server" 
                     RepeatColumns="4"
              RepeatDirection="Horizontal" Width="243px" BorderColor="Black" DataKeyField="CID"
                CellSpacing="20" DataSourceID="SqlDataSource1" 
                    onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" Width="150px" Height="150px" 
                            ImageUrl='<%# Eval("PicPath") %>' BorderColor="Silver" BorderStyle="Solid" 
                    BorderWidth="4px"/>
                        <br />
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" 
                            Text='<%# Eval("CategoryName") %>' Width="154px" style="text-align:center" 
                            Height="20px"></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString10 %>" 
                    
                    SelectCommand="SELECT CategoryName, PicPath, CID FROM Category WHERE (CID NOT IN (SELECT TOP (9) CID FROM Category AS Category_1 ORDER BY CID))">
                </asp:SqlDataSource>
            </div>
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
                Font-Size="Large" onclick="lnkBack_Click" 
                style="z-index: 1; left: 597px; top: 14px; position: absolute">Back</asp:LinkButton>
    </a>
        
        </div>
    </div>
</asp:Content>

