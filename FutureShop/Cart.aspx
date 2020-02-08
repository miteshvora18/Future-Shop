<%@ Page Title="" Language="C#" MasterPageFile="~/Categories.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<%@ Register src="CartControl.ascx" tagname="CartControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 665px; background-color: #FFFFFF;">
   <div style="height: 107px">
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
           Font-Size="Large" onclick="lnkBack_Click" 
           style="z-index: 1; left: 597px; top: 14px; position: absolute">Back</asp:LinkButton>
    </a>
   </div>
        <div style="z-index: 1; float:right;  height: 415px; width: 681px">
        
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div style="height: 419px">
                        <uc1:CartControl ID="GrdCartCntrl" runat="server" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
                        
    </div>
</asp:Content>

