<%@ Page Title="" Language="C#" MasterPageFile="~/Dependent.master" AutoEventWireup="true" CodeFile="CreditCard.aspx.cs" Inherits="CreditCard" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
    <div style="height: 795px">
        <div style="z-index: 1; left: 42px; top: 255px; position: absolute; height: 541px; width: 650px">
            
                <div style="height: 535px">
                    <div runat="server" id="divCreditCard" 
                        style="border: medium solid #00FF00; z-index: 1; left: 9px; top: 5px; height: 253px; width: 635px; background-color: #FFFFFF;">
                        <asp:Label ID="Label9" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 62px; top: 59px; position: absolute; bottom: 323px" 
                            Text="Credit Card Number"></asp:Label>
                        <asp:Button ID="btnSubmit" runat="server" Font-Size="Medium" 
                            onclick="btnSubmit_Click" 
                            style="z-index: 1; left: 221px; top: 177px; position: absolute; width: 106px" 
                            Text="Submit" BackColor="Black" BorderStyle="Outset" ForeColor="White" />
                        <asp:Label ID="Label10" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 62px; top: 105px; position: absolute" 
                            Text="Expiry Date"></asp:Label>
                            <asp:TextBox ID="txtCreditCard" runat="server" 
                                
                            style="z-index: 1; left: 261px; top: 58px; position: absolute; width: 323px" 
                            BorderColor="#66FF33" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        <asp:TextBox ID="txtExpiryDate" runat="server" 
                            style="z-index: 1; left: 261px; top: 107px; position: absolute" 
                            BorderColor="#66FF33" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        <asp:Label ID="Label14" runat="server" 
                            style="z-index: 1; left: 404px; top: 107px; position: absolute" Text="(MMYY)"></asp:Label>
                     </div>
                     <div runat="server" id="divFailed" 
                        style="border: medium solid #00FF00; z-index: 1; left: 1px; top: 509px; height: 246px; width: 634px; background-color: #FFFFFF; font-size: x-large;" 
                        class="style1">
                        &nbsp;<br />
                        <br />
                        <br />
                        Sorry! your transaction cannot be processed...<br /> 
                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                        <br /> Try Again
                        
                        <asp:Button ID="btnOkFailed" runat="server" BackColor="Black" BorderStyle="Outset" 
                            Font-Size="Medium" ForeColor="White" onclick="btnOkFailed_Click" 
                            style="z-index: 1; left: 255px; top: 447px; position: absolute; height: 25px; width: 137px" 
                            Text="OK" />
                     </div>                   
                </div>          
        </div>
    </div>
</asp:Content>

