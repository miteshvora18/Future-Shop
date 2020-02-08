<%@ Page Title="" Language="C#" MasterPageFile="~/Categories.master" AutoEventWireup="true" CodeFile="SubCategories.aspx.cs" Inherits="SubCategories" %>



<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    <div style="height: 801px; background-color: #FFFFFF;">
    <div style="z-index: 1; left: 5px; top: 52px; position: absolute; height: 759px; width: 744px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="height: 598px">
                    <asp:DataList ID="DataList1" runat="server" BorderColor="Black" 
                        CellSpacing="40" DataKeyField="SCID" EnableViewState="False" 
                        onitemcommand="DataList1_ItemCommand" RepeatColumns="4" 
                        RepeatDirection="Horizontal" Width="243px">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" BorderColor="Silver" 
                                BorderStyle="Solid" BorderWidth="4px" Height="115" 
                                ImageUrl='<%# Eval("PicPath") %>' Width="115" CssClass="txtbox" />
                            <br />
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                                style="text-align:center" Text='<%# Eval("SCategoryName") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:DataList>
                     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString8 %>" 
                        SelectCommand="SELECT [PicPath],[SCategoryName],[SCID] FROM [SubCategory] WHERE ([CID] = @CID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="CID" SessionField="cid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </ContentTemplate>
           
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DataList1" EventName="ItemCommand" />
            </Triggers>
           
        </asp:UpdatePanel>
        </div>
        <div style="z-index: 1; left: 4px; top: 3px; position: absolute; height: 33px; width: 750px">
        <asp:Label ID="lblCategory" runat="server" Font-Bold="True" Font-Size="X-Large" 
                ForeColor="#CC0000" 
                style="z-index: 1; left: 9px; top: 1px; position: absolute"></asp:Label>
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
                Font-Size="Large" onclick="lnkBack_Click" 
                style="z-index: 1; left: 597px; top: 7px; position: absolute; height: 20px">Back</asp:LinkButton>
    </a>
        
        </div>
        <asp:Label ID="lblNoMatch" runat="server" Font-Bold="True" Font-Size="20pt" 
            style="z-index: 1; left: 179px; top: 37px; position: absolute; height: 55px; width: 450px" 
            Text="Sorry No Match Found !"></asp:Label>
    </div>
</asp:Content>




