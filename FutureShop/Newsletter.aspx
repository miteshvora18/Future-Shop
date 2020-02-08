<%@ Page Title="" Language="C#" MasterPageFile="~/Dependent.master" AutoEventWireup="true" CodeFile="Newsletter.aspx.cs" Inherits="Newsletter" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 768px">
        <div style="z-index: 1; left: 2px; top: 229px; position: absolute; height: 539px; width: 711px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="height: 480px">
                    <div style="height: 536px; background-color: #FFFFFF;">
                        <div style="border-style: solid; border-color: #000000; z-index: 1; left: 98px; top: 17px; position: absolute; height: 267px; width: 492px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Invalid Email ID" Font-Size="Large" 
                                ForeColor="Red" 
                                style="z-index: 1; left: 16px; top: 343px; position: absolute; width: 273px" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <asp:Label ID="Label9" runat="server" BackColor="#A60000" Font-Bold="True" 
                                Font-Size="XX-Large" ForeColor="White" 
                                style="z-index: 1; left: 5px; top: 3px; position: absolute; width: 484px; height: 51px; text-align:center; " 
                                Text="  Ding! You've got deals!"></asp:Label>
                            <div style="z-index: 1; left: 6px; top: 60px; position: absolute; height: 199px; width: 480px; font-size: large;">
                                <br />
                                <br />
                                &nbsp;&nbsp;&nbsp; We can hardly contain all the excitement in<br /> &nbsp;&nbsp;&nbsp; our n<asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" 
                                    ErrorMessage="*" ForeColor="Red" 
                                    style="z-index: 1; left: -15px; top: 247px; position: absolute; width: 15px"></asp:RequiredFieldValidator>
                                ewsletter.Amazing deals,articles and blogs<br /> &nbsp;&nbsp;&nbsp; on the latest tech plus all 
                                the latest stuff that<br /> &nbsp;&nbsp;&nbsp; you can&#39;t wait to get your hand&#39;s on.<br />
                                <br />
                                &nbsp;&nbsp;&nbsp; Are you missing out? Sign up today!</div>
                        </div>
                        <asp:LinkButton ID="lnkUnSubscribe" runat="server" CausesValidation="False" 
                            Font-Size="Large" onclick="lnkUnSubscribe_Click" 
                            style="z-index: 1; left: 398px; top: 376px; position: absolute; width: 119px">Unsubscribe Me</asp:LinkButton>
                        <asp:TextBox ID="txtEmail" runat="server" BorderColor="#A60000" 
                            BorderStyle="Solid" BorderWidth="2px"  
                            style="z-index: 1; left: 110px; top: 325px; position: absolute; height: 32px; width: 283px"></asp:TextBox>
                        <asp:Button ID="btnSubscribe" runat="server" BackColor="#A60000" 
                            Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                            onclick="btnSubscribe_Click" 
                            style="z-index: 1; left: 398px; top: 324px; position: absolute; width: 127px; height: 39px" 
                            Text="Subscribe" />
                    </div>
                </div>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSubscribe" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
</div>
</asp:Content>


