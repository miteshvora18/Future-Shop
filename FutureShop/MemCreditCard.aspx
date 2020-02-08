<%@ Page Title="" Language="C#" MasterPageFile="~/Dependent.master" AutoEventWireup="true" CodeFile="MemCreditCard.aspx.cs" Inherits="CreditCard" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
    <div style="height: 795px">
        <div style="z-index: 1; left: 40px; top: 249px; position: absolute; height: 541px; width: 650px">
            
                <div style="height: 535px">
                    <div runat="server" id="divCreditCard" 
                        style="border: medium solid #00FF00; z-index: 1; left: 9px; top: 5px; height: 253px; width: 635px; background-color: #FFFFFF;">
                        <asp:Label ID="Label9" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 62px; top: 59px; position: absolute; bottom: 459px" 
                            Text="Credit Card Number"></asp:Label>
                        <asp:Button ID="btnSubmit" runat="server" Font-Size="Medium" 
                            onclick="btnSubmit_Click" 
                            style="z-index: 1; left: 259px; top: 177px; position: absolute; width: 106px" 
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
                        <div runat="server" id="divSuccess" class="style1" 
                            
                        
                        style="border: medium solid #00FF00; z-index: 1; left: 0px; top: 258px; height: 246px; width: 634px; background-color: #FFFFFF; font-size: large;">
                            
                            <br />
                            <br />
                            Your Transaction is Successfull!<br />
                            <asp:Label ID="Label15" runat="server" 
                                style="z-index: 1; left: 200px; top: 335px " 
                                Text="Transaction ID :"></asp:Label>
                            <asp:Label ID="lblTransaction" runat="server" 
                                style="z-index: 1; left: 328px; top: 335px;"></asp:Label>
                            <br />
                            <asp:Label ID="Label16" runat="server" 
                                style="z-index: 1; left: 301px; top: 345px; " 
                                Text="Total Amount :"></asp:Label>
                            <asp:Label ID="lblTotAmount" runat="server"></asp:Label>
                            <br />
                            <br /> Thank you 
                            for registering with us as a member....<br />
                            A mail has been sent to you with the transaction details....<br />
                            You will be Notified of various offers<br /> 
                            <asp:Button ID="btnOk" runat="server" BackColor="Black" BorderStyle="Outset" 
                                Font-Size="Medium" ForeColor="White" onclick="btnOk_Click" 
                                style="z-index: 1; left: 266px; top: 457px; position: absolute; height: 25px; width: 137px" 
                                Text="OK" />
                        </div>
                        <div runat="server" id="divFailed" 
                            style="border: medium solid #00FF00; z-index: 1; left: 1px; top: 509px; height: 246px; width: 634px; background-color: #FFFFFF; font-size: x-large;" 
                            class="style1">
                            &nbsp;<br />
                            <br />
                            <br />
                            Sorry! your transaction cannot be processed...<br /> 
                            <asp:Label ID="Label11" runat="server"></asp:Label>
                           <br /> Try Again

                           <asp:Button ID="btnOkFailed" runat="server" BackColor="Black" BorderStyle="Outset" 
                                Font-Size="Medium" ForeColor="White" onclick="btnOkFailed_Click" 
                                style="z-index: 1; left: 262px; top: 708px; position: absolute; height: 25px; width: 137px" 
                                Text="OK" />
                        </div>
                   
                </div>
           
        </div>
    </div>
</asp:Content>


