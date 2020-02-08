<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 800px; width: 986px; background-color: #D7D7D7; border-top-style: solid; border-top-width: medium; border-top-color: #000000;">
        <div style="z-index: 1; left: 7px; top: 37px; position: absolute; height: 341px; width: 308px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="height: 446px; background-color: #FFFFFF;">
                <div style="background-color: #FFFFFF;">
                    <div style="background-color: #000000; font-size: x-large; font-weight: bold; color: #FFFFFF; height: 34px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SEARCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/search-50.png" 
                            
                            style="z-index: 1; left: 9px; top: -2px; position: absolute; height: 33px; width: 45px; " />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton 
                            ID="lnkBrandClear" runat="server" Font-Size="Medium" 
                            onclick="lnkBrandClear_Click" 
                            style="z-index: 1; left: 18px; top: 163px; position: absolute">CLEAR</asp:LinkButton>
                        <asp:LinkButton ID="lnkPriceClear" runat="server" Font-Size="Medium" 
                            onclick="lnkPriceClear_Click" 
                            style="z-index: 1; left: 16px; top: 306px; position: absolute">CLEAR</asp:LinkButton>
                    </div>
                        <asp:Label 
                            ID="Label7" runat="server" Font-Bold="False" 
                            Font-Size="Large" ForeColor="Black" 
                            style="z-index: 1; left: 16px; top: 63px; position: absolute" 
                            Text="Category"></asp:Label>
                        <asp:DropDownList ID="drpSCategory" runat="server" 
                            style="z-index: 1; left: 109px; top: 63px; position: absolute" 
                            width="187px" AutoPostBack="True"  
                           >                           
                        </asp:DropDownList>
                        <asp:Label ID="Label8" runat="server" Font-Bold="False" Font-Size="Large" 
                            ForeColor="Black" 
                            
                            style="z-index: 1; left: 16px; top: 118px; position: absolute; right: 589px;" 
                            Text="Brand"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Size="Large" 
                            ForeColor="Black" 
                            style="z-index: 1; left: 16px; top: 263px; position: absolute; " 
                            Text="Price" width="48"></asp:Label>
                        <div style="z-index: 1; left: 109px; top: 118px; position: absolute; height: 118px; width: 188px; overflow:auto">
                            <asp:RadioButtonList ID="rdBrandName" runat="server" Font-Size="Medium">
                            </asp:RadioButtonList>
                        </div>
                        <asp:Button ID="btnSearch" runat="server" BackColor="Black" 
                            BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                            style="z-index: 1; left: 34px; top: 397px; position: absolute; width: 120px;" 
                            Text="Search" onclick="btnSearch_Click"  />

                            <div style="z-index: 1; left: 109px; top: 263px; position: absolute; height: 109px; width: 189px">
                            <asp:RadioButtonList ID="rdPriceWish" runat="server" Font-Size="Medium" 
                                ForeColor="Black" onselectedindexchanged="rdPriceWish_SelectedIndexChanged">
                                <asp:ListItem>500-700</asp:ListItem>
                                <asp:ListItem>701-900</asp:ListItem>
                                <asp:ListItem>901-1000</asp:ListItem>
                                <asp:ListItem>1001 and UP</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        </div>
                        <div runat="server" id="divresult" 
                        style="z-index: 1; left: 314px; top: -3px; position: absolute; height: 441px; width: 643px">
                            <div style="background-color: #000000; font-size: x-large; color: #FFFFFF; font-weight: bold; height: 32px; z-index: 1; left: 3px; top: 5px; position: absolute; width: 637px; margin-left: 0px;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Search Result
                            </div> 
                            <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" 
                                CellPadding="4" ForeColor="Black" BorderStyle="None" AllowPaging="True" 
                                    BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" 
                                    Font-Size="Medium" GridLines="Horizontal" PageSize="2" 
                                     DataKeyNames="PID"
                                    
                                style="z-index: 1; left: 55px; top: 56px; position: absolute; height: 229px; width: 398px" 
                                onpageindexchanging="GridView1_PageIndexChanging"
                                    >
                                <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" height="70px" Width="60px"
                                                ImageUrl='<%# Eval("PicPath") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True"/>
                                <asp:BoundField DataField="TotalQuantity" HeaderText="Quantity"/>
                                <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" />
                                <asp:BoundField DataField="BrandName" HeaderText="Brand" ReadOnly="True" />
                                  
                                    
                                  
                                    <asp:templatefield headertext="Button">
                                        <itemtemplate>
                                          <asp:Button id="btnRedirect"
                                            Text= "Click me"
                                            CommandArgument='<%#Eval("PID")%>'
                                            OnClick="DoRedirect"
                                            runat="server"/> 
                                        </itemtemplate>
                                    </asp:templatefield>
                                  
                                    
                                  
                                </Columns>
                                <EmptyDataTemplate>   
                                 <span class="style1"><strong>No Match Found</strong></span>
                                    <br />
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            
                        </div>
                        
                        
                    
                
              </div>
            </ContentTemplate>
               
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
                   
                </Triggers>
               
            </asp:UpdatePanel>
        </div>
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
            Font-Size="Large" onclick="lnkBack_Click" 
            style="z-index: 1; left: 771px; top: 6px; position: absolute">Back</asp:LinkButton>
    </a>
    </div>
</asp:Content>

