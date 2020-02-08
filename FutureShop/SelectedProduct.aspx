
<%@ Page Title="" Language="C#" MasterPageFile="~/Categories.master" AutoEventWireup="true" CodeFile="SelectedProduct.aspx.cs" Inherits="SelectedProduct"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 802px; background-color: #FFFFFF;">
        <div style="height: 38px">
        <div style="z-index: 1; left: 2px; top: 44px; position: absolute; height: 535px; width: 750px">
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           <ContentTemplate>
               <div style="height: 515px">
                   <asp:Image ID="imgProduct" runat="server" 
                       style="z-index: 1; left: 48px; top: 66px; position: absolute; height: 253px; width: 285px" />
                   <asp:Label ID="lblProductName" runat="server" Font-Bold="True" 
                       Font-Size="Large" ForeColor="#990033" 
                       style="z-index: 1; left: 356px; top: 67px; position: absolute; width: 378px"></asp:Label>
                   <asp:Label ID="lblDescription" runat="server" ForeColor="#993333" 
                       style="z-index: 1; left: 356px; top: 110px; position: absolute; width: 354px; height: 68px"></asp:Label>
                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" 
                       style="z-index: 1; left: 356px; top: 201px; position: absolute" Text="Price"></asp:Label>
                   <asp:Label ID="lblPrice" runat="server" Font-Bold="True" Font-Size="Large" 
                       ForeColor="Red" 
                       style="z-index: 1; left: 421px; top: 200px; position: absolute; width: 99px"></asp:Label>
                   <asp:Label ID="lblQty" runat="server" Font-Bold="True" Font-Size="Medium" 
                       ForeColor="#990000" 
                       style="z-index: 1; left: 356px; top: 241px; position: absolute; width: 233px"></asp:Label>
                   <asp:Button ID="btnCart" runat="server" BackColor="#FFCC00" CssClass="button" 
                       Font-Bold="True" Font-Size="Medium" ForeColor="Black" onclick="btnCart_Click" 
                       style="z-index: 1; left: 356px; top: 290px; position: absolute; height: 27px; width: 208px" 
                       Text="Add To Cart" />
                   <asp:Label ID="lblNoMatch" runat="server" Font-Bold="True" Font-Size="20pt" 
                       style="z-index: 1; left: 179px; top: 37px; position: absolute; height: 55px; width: 450px" 
                       Text="Sorry No Match Found !"></asp:Label>
                   
                      
                   
                   <div runat="server" style="border: medium solid #990033; z-index: 1; left: 38px; top: 329px; position: absolute; height: 155px; width: 643px" 
                       ID="divdiscount">
                       <asp:Label ID="lblOffer" runat="server" Font-Size="Large" ForeColor="#990033" 
                           style="z-index: 1; left: 41px; top: 16px; position: absolute"></asp:Label>
                       <asp:Label ID="Label6" runat="server" Font-Bold="True" 
                           style="z-index: 1; left: 100px; top: 50px; position: absolute" 
                           Text="Original Price"></asp:Label>
                       <asp:Label ID="lblListPrice" runat="server" Font-Size="Large" 
                           ForeColor="#CC0000" 
                           style="z-index: 1; left: 238px; top: 51px; position: absolute"></asp:Label>
                       <asp:Label ID="Label7" runat="server" Font-Bold="True" 
                           style="z-index: 1; left: 100px; top: 85px; position: absolute" Text="Discount"></asp:Label>
                       <asp:Label ID="lblDisPrice" runat="server" Font-Size="Large" 
                           ForeColor="#CC0000" 
                           style="z-index: 1; left: 216px; top: 82px; position: absolute"></asp:Label>
                       <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                           style="z-index: 1; left: 100px; top: 122px; position: absolute" 
                           Text="Discounted Price"></asp:Label>
                       <asp:Label ID="lblTotDeal" runat="server" Font-Size="Large" ForeColor="#CC0000" 
                           style="z-index: 1; left: 238px; top: 121px; position: absolute"></asp:Label>             
                      <hr style="z-index: 1; left: 131px; top: 438px; position: absolute; height: -15px; width: 268px; background-color: #FF0000;" />
                   
                       </div>
                   
                   
                   
                      
                   
               </div>
           </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCart" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            
        </div>
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
                Font-Size="Large" onclick="lnkBack_Click" 
                style="z-index: 1; left: 597px; top: 14px; position: absolute">Back</asp:LinkButton>
    </a>
</div>
</div>
</asp:Content>

