<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 84%;
            z-index: 1;
            left: 92px;
            top: 269px;
            position: absolute;
            height: 420px;
        }
        .style2
        {
            width: 228px;
        }
        .style3
        {
            width: 228px;
            height: 38px;
        }
        .style4
        {
            height: 38px;
        }
        .style5
        {
            width: 228px;
            height: 130px;
        }
        .style6
        {
            height: 130px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 771px">
        <div style="z-index: 1; left: 59px; top: 74px; position: absolute; height: 404px; width: 855px">
            <div style="z-index: 1; left: 205px; top: 24px; position: absolute; height: 40px; width: 455px; font-size: x-large; font-weight: bold; font-family: 'Comic Sans MS'; text-align: center;">
                Have Questions ?</div>
            <div style="font-size: large; font-weight: bold; z-index: 1; left: 607px; top: 121px; position: absolute; height: 20px; width: 218px;">
                Reach us by phone.</div>
            <div style="font-size: medium; font-weight: normal; z-index: 1; left: 107px; top: 148px; position: absolute; height: 50px; width: 218px;">
                We will do our best to respond within 1 business day.</div>
            <div style="font-size: x-large; font-weight: normal; z-index: 1; left: 607px; top: 212px; position: absolute; height: 30px; width: 218px; color: #A60000; background-color: #BFBFFF; text-align: center;">
                +91-9800000000</div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/phone.jpeg" 
                style="z-index: 1; left: 500px; top: 121px; position: absolute; height: 72px; width: 80px" />
            <div style="z-index: 1; left: 107px; top: 121px; position: absolute; height: 19px; width: 218px; font-size: large; font-weight: bold;">
                Reach Us by Email.</div>
            <div style="font-size: medium; font-weight: normal; z-index: 1; left: 607px; top: 148px; position: absolute; height: 50px; width: 218px;">
                Give us a call, 7 days a week. from<br />
                8:00 am - Midnight IST</div>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/email.jpeg" 
                
                style="z-index: 1; left: 13px; top: 122px; position: absolute; height: 72px; width: 80px" />
        </div>
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
            Font-Size="Large" onclick="lnkBack_Click" 
            style="z-index: 1; left: 728px; top: 47px; position: absolute; height: 20px">Back</asp:LinkButton>
    </a>
    </div>
</asp:Content>

