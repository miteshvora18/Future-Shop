<%@ Page Title="" Language="C#" MasterPageFile="~/Dependent.master" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Transaction" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 768px">
        <div style="z-index: 1; left: 38px; top: 242px; position: absolute; height: 519px; width: 668px">
                        <div runat="server" id="divSuccess" class="style1" 
                            
                        
                        
                style="border: medium solid #00FF00; z-index: 1; left: 0px; top: 258px; height: 246px; width: 634px; background-color: #FFFFFF; font-size: large; text-align: center;">
                            
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
                            <br />
                            
                            A mail has been sent to you regarding the details of this transaction.<br />
                            <br /> Thank you for shopping with us....<br /> 
                            We hope to see you back soon.
                        </div>
        </div>
    </div>
</asp:Content>


