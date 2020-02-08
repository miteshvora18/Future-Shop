<%@ Page Title="" Language="C#" MasterPageFile="~/Categories.master" AutoEventWireup="true" CodeFile="Proceed.aspx.cs" Inherits="Proceed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 802px; background-color: #FFFFFF;">
          <div style="z-index: 1; left: 95px; top: 111px; position: absolute; height: 479px; width: 585px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="height: 752px">
                    <div  runat="server" id="divconfirm" style="border: 1px solid #0033CC; z-index: 1; left: 0px; top: 0px; height: 255px; width: 583px">
                        <div style="border-bottom: 1px solid #0033CC; z-index: 1; left: 5px; top: 4px; position: absolute; width: 574px; height: 31px; background-color: #C0C0C0; font-size: x-large; font-weight: bold; color: #0000FF; ">
                        <asp:Image ID="Image2" runat="server" 
                            ImageUrl="~/Images/free_website_builders_are_bad_for_seo.png" 
                            style="z-index: 1; left: 124px; top: 2px; position: absolute; height: 26px; width: 34px; right: 428px" />
                           
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Review And Confirm
                         </div> 
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" 
                        style="z-index: 1; left: 42px; top: 54px; position: absolute; width: 102px" 
                        Text="Products"></asp:Label>
                        <asp:ListBox ID="lstProduct" runat="server" 
                            style="z-index: 1; left: 136px; top: 57px; position: absolute; width: 369px; height: 90px">
                            </asp:ListBox>
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" 
                            style="z-index: 1; left: 42px; top: 167px; position: absolute" 
                            Text="Total Amount Payable"></asp:Label>
                        <asp:Label ID="lblTotAmount" runat="server" Font-Bold="True" Font-Size="Large" 
                            ForeColor="#0033CC" 
                            style="z-index: 1; left: 244px; top: 167px; position: absolute"></asp:Label>
                        <asp:Button ID="btnBack" runat="server" 
                            style="z-index: 1; left: 216px; top: 203px; position: absolute; width: 74px" 
                            Text="Back" onclick="btnBack_Click" CausesValidation="False" />
                        <asp:Button ID="btnProceed" runat="server" 
                            style="z-index: 1; left: 312px; top: 203px; position: absolute; width: 248px" 
                            Text="Confirm &amp; Proceed with Payment" onclick="btnProceed_Click" 
                            CausesValidation="False" />
                                                 
                    </div>
                     <div runat="server" ID="divAddress" 
                        
                        style="border: 1px solid #0033CC; z-index: 1; left: 0px;  height: 427px; width: 583px">
                           <div style="border-bottom: 1px solid #0033CC; z-index: 1; left: 3px; top: 4px;  width: 575px;position:absolute; height: 31px; background-color: #C0C0C0; font-size: x-large; font-weight: bold; color: #0000FF;">
                            <asp:Image ID="Image3" runat="server" 
                                ImageUrl="~/Images/Home.png"                           
                                style="z-index: 1; left: 127px; top: 2px; position: absolute; height: 29px; width: 34px; right: 420px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shipping 
                            Address</div>                    
                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 142px; top: 56px; position: absolute" Text="Full Name"></asp:Label>
                            <asp:TextBox ID="txtFullName" runat="server"       
            
                                    style="z-index: 1; left: 142px; top: 87px; position: absolute; " 
                                    Font-Size="Medium" BorderColor="#0033CC" BorderStyle="Solid" BorderWidth="2px" 
                                                    Width="300px"></asp:TextBox>
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" 
                                style="z-index: 1; left: 142px; top: 125px; position: absolute" 
                                Text="Address Line1"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                                style="z-index: 1; left: 142px; top: 198px; position: absolute" 
                                Text="Address Line2"></asp:Label>
                            <asp:TextBox ID="txtAdress1" runat="server" 
                                style="z-index: 1; left: 142px; top: 156px; position: absolute; " 
                                 Font-Size="Medium" BorderColor="#0033CC" BorderStyle="Solid" BorderWidth="2px" 
                                                    Width="300px"></asp:TextBox>
                            <asp:TextBox ID="txtAdress2" runat="server" 
                                style="z-index: 1; left: 142px; top: 229px; position: absolute; " Font-Size="Medium" BorderColor="#0033CC" BorderStyle="Solid" BorderWidth="2px" 
                                Width="300px" ></asp:TextBox>
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                style="z-index: 1; left: 140px; top: 274px; position: absolute" Text="Region"></asp:Label>
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" 
            
                                style="z-index: 1; left: 341px; top: 274px; position: absolute; height: 19px;" 
                                Text="District"></asp:Label>
                            <asp:Button ID="btnSubmit" runat="server" BackColor="Black" 
                                BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                                style="z-index: 1; left: 144px; top: 363px; position: absolute; width: 90px" 
                                Text="SUBMIT" onclick="btnSubmit_Click" />
     
                             <asp:DropDownList ID="drpRegion" runat="server" 
                                 onselectedindexchanged="drpRegion_SelectedIndexChanged" 
                 
                                 style="z-index: 1; left: 143px; top: 300px; position: absolute; height: 22px; width: 159px" 
                                 AutoPostBack="True">
                             </asp:DropDownList>
                             <asp:DropDownList ID="drpDistrict" runat="server" 
                                 style="z-index: 1; left: 341px; top: 300px; position: absolute" width="159px">
                             </asp:DropDownList>
                         <asp:Button ID="btnBackAddrss" runat="server" Text="Back" BackColor="Black" 
                               BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                               onclick="btnBackAddrss_Click" 
                               style="z-index: 1; left: 313px; top: 363px; position: absolute; height: 29px" 
                               width="90px" CausesValidation="False" />
     
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                               ControlToValidate="txtFullName" ErrorMessage="*" ForeColor="Red" 
                               style="z-index: 1; left: 453px; top: 88px; position: absolute; width: 29px;"></asp:RequiredFieldValidator>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                               ControlToValidate="txtAdress1" ErrorMessage="*" ForeColor="Red" 
                               style="z-index: 1; left: 453px; top: 158px; position: absolute; width: 26px;"></asp:RequiredFieldValidator>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                               ControlToValidate="txtAdress2" ErrorMessage="*" ForeColor="Red" 
                               style="z-index: 1; left: 453px; top: 230px; position: absolute; width: 30px"></asp:RequiredFieldValidator>
     
                        </div>
                         <div runat="server" id="divsure" 
                        style="z-index: 1; left: 1px; top: 678px;  height: 254px; width: 583px; border: 3px solid #0033CC;background-color: #FFFFFF; text-align: center; font-size: x-large;">
                             <asp:Button ID="btnBackSure" runat="server" BackColor="Black" 
                                 BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                                 onclick="btnBackSure_Click" 
                                 style="z-index: 1; left: 361px; top: 209px; position: absolute; width: 96px" 
                                 Text="Back" CausesValidation="False" />
                             <br />
                             <asp:Button ID="btnContinue" runat="server" BackColor="Black" BorderStyle="Outset" 
                                 Font-Bold="True" Font-Size="Medium" ForeColor="White"  
                                 style="z-index: 1; left: 98px; top: 208px; position: absolute; width: 220px;" 
                                 Text="Want to Continue ?" onclick="btnContinue_Click" 
                                 CausesValidation="False" />
                             
                             <asp:Label ID="lblDisp" runat="server" ForeColor="#990033"></asp:Label>
                             <br />
                             Your total amount is
                             <asp:Label ID="lblTotal" runat="server" ForeColor="#993333"></asp:Label>
                             &nbsp;+<br /> Shipping Charges i.e
                             <asp:Label ID="lblShip" runat="server" ForeColor="#990033"></asp:Label>
                             <br />
                             Your GrandTotal is
                             <asp:Label ID="lblGTot" runat="server" ForeColor="#990033"></asp:Label>
                        </div>
                        <div runat="server" id="divsuremem" 
                        style="z-index: 1; left: 1px; top: 678px;  height: 254px; width: 583px; border: 3px solid #0033CC;background-color: #FFFFFF; text-align: center; font-size: x-large;">
                             <br />
&nbsp;<table style="width: 100%">
                                 <tr>
                                     <td style="width: 262px">
                                         Total Amount</td>
                                     <td>
                                         <asp:Label ID="lblTotalMem" runat="server" ForeColor="#993333"></asp:Label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="width: 262px">
                                         Shipping Charges</td>
                                     <td>
                                         <asp:Label ID="lblShipMem" runat="server" ForeColor="#990033"></asp:Label>
                                     </td>
                                 </tr>
                                
                                 <tr>
                                     <td style="width: 262px">
                                         Additional Discount</td>
                                     <td style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #990033">
                                         <asp:Label ID="lblOff" runat="server" ForeColor="#990033"></asp:Label>
                                         &nbsp;%</td>
                                 </tr>
                                 <tr>
                                     <td style="width: 262px">
                                         Grand Total</td>
                                     <td>
                                         <asp:Label ID="lblGtotal" runat="server" ForeColor="#990033"></asp:Label>
                                     </td>
                                 </tr>
                             </table>
                             &nbsp;
                              <asp:Button ID="Button1" runat="server" BackColor="Black" 
                                 BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                                 onclick="btnBackSure_Click" 
                                 style="z-index: 1; left: 361px; top: 209px; position: absolute; width: 96px" 
                                 Text="Back" CausesValidation="False" />
                             <br />
                             <asp:Button ID="Button2" runat="server" BackColor="Black" BorderStyle="Outset" 
                                 Font-Bold="True" Font-Size="Medium" ForeColor="White"  
                                 style="z-index: 1; left: 98px; top: 208px; position: absolute; width: 220px;" 
                                 Text="Want to Continue ?" onclick="btnContinue_Click" 
                                 CausesValidation="False" />
                                 </div>
                </div>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="drpDistrict" 
                        EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
    </div>
 </div>
</asp:Content>

