<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Compare.aspx.cs" Inherits="Compare" EnableEventValidation="false" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 771px; background-color: #FFFFFF;">
        <div style="z-index: 1; left: 50px; top: 51px; position: absolute; height: 625px; width: 882px">
            <div style="z-index: 1; left: 114px; top: 7px; position: absolute; height: 614px; width: 249px">
                <asp:DataList ID="DataList1" runat="server" 
                    style="z-index: 1; left: 0px; top: 0px; position: absolute">
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("PicPath") %>' 
                            style="z-index: 1; left: 6px; top: -2px; position: absolute; height: 151px; width: 154px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="ProductNameLabel" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 167px; position: absolute; height: 19px; width: 211px" 
                            Text='<%# Eval("ProductName") %>' />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="PriceLabel" runat="server" Font-Bold="True" ForeColor="#BB0000" 
                            style="z-index: 1; left: 13px; top: 209px; position: absolute" 
                            Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                        <asp:Label ID="DescriptionLabel" runat="server" 
                            style="z-index: 1; left: 13px; top: 253px; position: absolute; height: 129px; width: 221px" 
                            Text='<%# Eval("Description") %>' />
                    <br />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="BrandNameLabel" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 399px; position: absolute; height: 22px; width: 220px" 
                            Text='<%# Eval("BrandName") %>' />
                    <br />
                    <br />
                    <br />
                        &nbsp;<asp:Label ID="TotalQuantityLabel" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 440px; position: absolute" 
                            Text='<%# Eval("TotalQuantity") %>' />
                    <br />
<br />
                    <br />
                        <asp:Button ID="btnSelect" runat="server" Height="26px" 
                          
                            style="z-index: 1; left: 13px; top: 472px; position: absolute" 
                            Text="Select Product" Width="194px" onclick="btnSelect_Click" />
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div style="z-index: 1; left: 369px; top: 7px; position: absolute; height: 614px; width: 249px">
                <asp:DataList ID="DataList2" runat="server" 
                    style="z-index: 1; left: 0px; top: 0px; position: absolute">
                    <ItemTemplate>
                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("PicPath") %>' 
                            style="z-index: 1; left: 6px; top: -2px; position: absolute; height: 151px; width: 154px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="ProductNameLabel0" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 167px; position: absolute; height: 19px; width: 211px" 
                            Text='<%# Eval("ProductName") %>' />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="PriceLabel0" runat="server" Font-Bold="True" ForeColor="#BB0000" 
                            style="z-index: 1; left: 13px; top: 209px; position: absolute" 
                            Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                        <asp:Label ID="DescriptionLabel0" runat="server" 
                            style="z-index: 1; left: 13px; top: 253px; position: absolute; height: 129px; width: 221px" 
                            Text='<%# Eval("Description") %>' />
                    <br />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="BrandNameLabel0" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 399px; position: absolute; height: 22px; width: 220px" 
                            Text='<%# Eval("BrandName") %>' />
                    <br />
                    <br />
                    <br />
                        &nbsp;<asp:Label ID="TotalQuantityLabel0" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 440px; position: absolute" 
                            Text='<%# Eval("TotalQuantity") %>' />
                    <br />
<br />
                    <br />
                        <asp:Button ID="btnSelect0" runat="server" Height="26px" 
                            style="z-index: 1; left: 13px; top: 472px; position: absolute" 
                            Text="Select Product" Width="194px" onclick="btnSelect0_Click" />
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div style="z-index: 1; left: 624px; top: 6px; position: absolute; height: 614px; width: 249px">
                <asp:DataList ID="DataList3" runat="server" 
                    style="z-index: 1; left: 0px; top: 0px; position: absolute">
                    <ItemTemplate>
                        <asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("PicPath") %>' 
                            style="z-index: 1; left: 6px; top: -2px; position: absolute; height: 151px; width: 154px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="ProductNameLabel1" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 167px; position: absolute; height: 19px; width: 211px" 
                            Text='<%# Eval("ProductName") %>' />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="PriceLabel1" runat="server" Font-Bold="True" ForeColor="#BB0000" 
                            style="z-index: 1; left: 13px; top: 209px; position: absolute" 
                            Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                        <asp:Label ID="DescriptionLabel1" runat="server" 
                            style="z-index: 1; left: 13px; top: 253px; position: absolute; height: 129px; width: 221px" 
                            Text='<%# Eval("Description") %>' />
                    <br />
                    <br />
                    <br />
                    <br />
                        <asp:Label ID="BrandNameLabel1" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 399px; position: absolute; height: 22px; width: 220px" 
                            Text='<%# Eval("BrandName") %>' />
                    <br />
                    <br />
                    <br />
                        &nbsp;<asp:Label ID="TotalQuantityLabel1" runat="server" Font-Bold="True" 
                            style="z-index: 1; left: 13px; top: 440px; position: absolute" 
                            Text='<%# Eval("TotalQuantity") %>' />
                    <br />
<br />
                    <br />
                        <asp:Button ID="btnSelect1" runat="server" Height="26px" 
                            style="z-index: 1; left: 13px; top: 472px; position: absolute" 
                            Text="Select Product" Width="194px" onclick="btnSelect1_Click" />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div style="z-index: 1; left: 53px; top: 55px; position: absolute; height: 617px; width: 104px">
            <asp:Label ID="Label5" runat="server" Font-Size="Large" 
                style="z-index: 1; left: 5px; top: 170px; position: absolute" 
                Text="ProductName"></asp:Label>
        </div>
        <asp:Label ID="Label6" runat="server" Font-Size="Large" 
            style="z-index: 1; left: 58px; top: 264px; position: absolute" Text="Price"></asp:Label>
        <asp:Label ID="Label7" runat="server" Font-Size="Large" 
            style="z-index: 1; left: 58px; top: 308px; position: absolute" 
            Text="Description"></asp:Label>
        <asp:Label ID="Label8" runat="server" Font-Size="Large" 
            style="z-index: 1; left: 58px; top: 495px; position: absolute" Text="Total Qty"></asp:Label>
        <asp:Label ID="Label9" runat="server" Font-Size="Large" 
            style="z-index: 1; left: 58px; top: 454px; position: absolute" Text="BrandName"></asp:Label>
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" Font-Size="Large" 
            onclick="lnkBack_Click" 
            style="z-index: 1; left: 764px; top: 11px; position: absolute" 
            CausesValidation="False">Back</asp:LinkButton>
    </a>
    </div>
</asp:Content>

