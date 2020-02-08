<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminContactUs.aspx.cs" Inherits="ContactUs" %>

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
        <div style="z-index: 1; left: 59px; top: 24px; position: absolute; height: 723px; width: 855px">
            <div style="z-index: 1; left: 205px; top: 46px; position: absolute; height: 40px; width: 455px; font-size: x-large; font-weight: bold; font-family: 'Comic Sans MS'; text-align: center;">
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
                style="z-index: 1; left: 13px; top: 121px; position: absolute; height: 72px; width: 80px" />
            <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label6" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 23px; top: 10px; position: absolute" 
                            Text="My Enquiry is related to"></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="299px">
                            <asp:ListItem>Select a Topic</asp:ListItem>
                            <asp:ListItem>Account and Password Assistance</asp:ListItem>
                            <asp:ListItem>Delivery</asp:ListItem>
                            <asp:ListItem>Orders</asp:ListItem>
                            <asp:ListItem>Returnand Exchange</asp:ListItem>
                            <asp:ListItem>General Questions</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label7" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 23px; top: 51px; position: absolute" Text="First Name"></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="TextBox1" runat="server" width="299px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label8" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 23px; top: 91px; position: absolute" Text="Last Name"></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="TextBox2" runat="server" width="299px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label9" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 23px; top: 131px; position: absolute" 
                            Text="Email Address"></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="TextBox3" runat="server" width="299px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label10" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 23px; top: 171px; position: absolute" Text="Order No"></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="TextBox4" runat="server" width="299px"></asp:TextBox>
                    </td>
                </tr>                
                <tr>
                    <td class="style5">
                        <asp:Label ID="Label12" runat="server" Font-Size="Large" 
                            style="z-index: 1; left: 23px; top: 212px; position: absolute" 
                            Text="Qusetions or Comments"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="TextBox5" runat="server" 
                            style="z-index: 1; left: 235px; top: 210px; position: absolute; height: 113px; width: 463px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" BackColor="Black" BorderStyle="Outset" 
                            Font-Size="Large" ForeColor="White" 
                            style="z-index: 1; left: 194px; top: 361px; position: absolute; height: 33px; width: 201px" 
                            Text="Submit" />
                    </td>
                </tr>
            </table>
        </div>
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
            Font-Size="Large" onclick="lnkBack_Click" 
            style="z-index: 1; left: 597px; top: 29px; position: absolute">Back</asp:LinkButton>
    </a>
    </div>
</asp:Content>

