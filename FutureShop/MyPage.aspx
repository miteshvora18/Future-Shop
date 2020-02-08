<%@ Page Title="" Language="C#" MasterPageFile="~/Dependent.master" AutoEventWireup="true" CodeFile="MyPage.aspx.cs" Inherits="MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 773px">
    <div style="background-color: #FFFFFF; z-index: 1; left: 2px; top: 231px; position: absolute; height: 537px; width: 717px;">
        <asp:Label ID="Label14" runat="server" Font-Size="Large" 
            style="z-index: 1; left: 24px; top: 23px; position: absolute" 
            Text="Products Ordered By Me...."></asp:Label>
        <div style="z-index: 1; left: 3px; top: 59px; position: absolute; height: 477px; width: 717px">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div style="height: 477px">
                        <div style="height: 220px">
                            <asp:GridView ID="grdOrders" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" DataKeyNames="BillingId" DataSourceID="SqlDataSource1" 
                                ForeColor="#333333" GridLines="None"  
                                
                                style="z-index: 1; left: 25px; top: 19px; position: absolute; height: 181px; width: 662px" 
                                AllowPaging="True" PageSize="3" 
                                onselectedindexchanged="grdOrders_SelectedIndexChanged" 
                                onpageindexchanging="grdOrders_PageIndexChanging">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="BillingId" HeaderText="BillingId" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="BillingId" />
                                    <asp:BoundField DataField="ShippingAdd" HeaderText="ShippingAdd" 
                                        SortExpression="ShippingAdd" />
                                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                    <asp:BoundField DataField="ShippingCharges" HeaderText="ShippingCharges" 
                                        SortExpression="ShippingCharges" />
                                    <asp:BoundField DataField="GTotal" HeaderText="GTotal" 
                                        SortExpression="GTotal" />
                                    <asp:BoundField DataField="InsertionDate" HeaderText="InsertionDate"  DataFormatString="{0:dd/MM/yyyy}"
                                        SortExpression="InsertionDate" />

                                         <asp:templatefield headertext="Button">
                                        <itemtemplate>
                                          <asp:Button id="btnRedirect"
                                            Text= "Click me"
                                            CommandArgument='<%#Eval("BillingId")%>'
                                            OnClick="DoRedirect"
                                            runat="server"/> 
                                        </itemtemplate>
                                    </asp:templatefield>
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConflictDetection="CompareAllValues" 
                                ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString10 %>" 
                                DeleteCommand="DELETE FROM [Billingdetails] WHERE [BillingId] = @original_BillingId AND [ShippingAdd] = @original_ShippingAdd AND [Total] = @original_Total AND [ShippingCharges] = @original_ShippingCharges AND [GTotal] = @original_GTotal AND [InsertionDate] = @original_InsertionDate" 
                                InsertCommand="INSERT INTO [Billingdetails] ([ShippingAdd], [Total], [ShippingCharges], [GTotal], [InsertionDate]) VALUES (@ShippingAdd, @Total, @ShippingCharges, @GTotal, @InsertionDate)" 
                                OldValuesParameterFormatString="original_{0}" 
                                SelectCommand="SELECT [BillingId], [ShippingAdd], [Total], [ShippingCharges], [GTotal], [InsertionDate] FROM [Billingdetails] WHERE ([UserId] = @UserId)" 
                                UpdateCommand="UPDATE [Billingdetails] SET [ShippingAdd] = @ShippingAdd, [Total] = @Total, [ShippingCharges] = @ShippingCharges, [GTotal] = @GTotal, [InsertionDate] = @InsertionDate WHERE [BillingId] = @original_BillingId AND [ShippingAdd] = @original_ShippingAdd AND [Total] = @original_Total AND [ShippingCharges] = @original_ShippingCharges AND [GTotal] = @original_GTotal AND [InsertionDate] = @original_InsertionDate">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_BillingId" Type="Int32" />
                                    <asp:Parameter Name="original_ShippingAdd" Type="String" />
                                    <asp:Parameter Name="original_Total" Type="Int32" />
                                    <asp:Parameter Name="original_ShippingCharges" Type="Int32" />
                                    <asp:Parameter Name="original_GTotal" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="original_InsertionDate" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ShippingAdd" Type="String" />
                                    <asp:Parameter Name="Total" Type="Int32" />
                                    <asp:Parameter Name="ShippingCharges" Type="Int32" />
                                    <asp:Parameter Name="GTotal" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="InsertionDate" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ShippingAdd" Type="String" />
                                    <asp:Parameter Name="Total" Type="Int32" />
                                    <asp:Parameter Name="ShippingCharges" Type="Int32" />
                                    <asp:Parameter Name="GTotal" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="InsertionDate" />
                                    <asp:Parameter Name="original_BillingId" Type="Int32" />
                                    <asp:Parameter Name="original_ShippingAdd" Type="String" />
                                    <asp:Parameter Name="original_Total" Type="Int32" />
                                    <asp:Parameter Name="original_ShippingCharges" Type="Int32" />
                                    <asp:Parameter Name="original_GTotal" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="original_InsertionDate" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <div style="z-index: 1; left: 1px; top: 225px; position: absolute; height: 253px; width: 717px">
                                <asp:GridView ID="grdFullOrder" runat="server" CellPadding="4" 
                                    ForeColor="#333333" GridLines="None" 
                                    
                                    style="z-index: 1; left: 23px; top: 13px; position: absolute; height: 218px; width: 662px" 
                                    AutoGenerateColumns="False" AllowPaging="True" 
                                    onpageindexchanging="grdFullOrder_PageIndexChanging" PageSize="2">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="BillingID" HeaderText="BillingID" 
                                            SortExpression="BillingID" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" height="70px" Width="60px"
                                                ImageUrl='<%# Eval("PicPath") %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:BoundField DataField="ProductName" HeaderText="Product NAme" SortExpression="ProductName" />
                                        <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" />
                                        <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" 
                                            SortExpression="SubTotal" />
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
                            </div>
                            <asp:Label ID="Label15" runat="server" Font-Size="Large" 
                                style="z-index: 1; left: 26px; top: 208px; position: absolute" 
                                Text="Order Details"></asp:Label>
                        </div>
                    </div>
                </ContentTemplate>
                <triggers>
                    <asp:AsyncPostBackTrigger ControlID="grdFullOrder" 
                        EventName="PageIndexChanging" />
                    <asp:AsyncPostBackTrigger ControlID="grdOrders" EventName="PageIndexChanging" />
                </triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
</asp:Content>

