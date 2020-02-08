<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddNewsLetter.aspx.cs" Inherits="AddNewsLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 770px">
        <div style="z-index: 1; left: 40px; top: 72px; position: absolute; height: 650px; width: 630px">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div style="height: 648px; font-size: large;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NEWSLETTER<br />
                        <asp:TextBox ID="txtSubject" runat="server" 
                            style="z-index: 1; left: 155px; top: 88px; position: absolute; height: 22px; width: 424px"></asp:TextBox>
                        <asp:Label ID="Label6" runat="server" 
                            style="z-index: 1; left: 54px; top: 88px; position: absolute" Text="Subject"></asp:Label>
                        <asp:Label ID="Label7" runat="server" 
                            style="z-index: 1; left: 54px; top: 143px; position: absolute" Text="Body"></asp:Label>
                        <asp:TextBox ID="txtBody" runat="server" 
                            style="z-index: 1; left: 155px; top: 143px; position: absolute; height: 282px" 
                            TextMode="MultiLine" width="424px"></asp:TextBox>
                        <asp:Button ID="btnLetter" runat="server" BackColor="Black" 
                            BorderStyle="Outset" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                            onclick="btnLetter_Click" 
                            style="z-index: 1; left: 54px; top: 494px; position: absolute; width: 123px;" 
                            Text="Send Letter" />
                        <asp:Label ID="Label8" runat="server" 
                            style="z-index: 1; left: 54px; top: 445px; position: absolute" 
                            Text="Select Image"></asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" 
                            style="z-index: 1; left: 155px; top: 446px; position: absolute" />
                        <asp:Label ID="lblMsg" runat="server" Font-Size="Large" ForeColor="#333399" 
                            style="z-index: 1; left: 201px; top: 494px; position: absolute"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red" 
                            style="z-index: 1; left: 387px; top: 448px; position: absolute"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtBody" ErrorMessage="*" ForeColor="Red" 
                            style="z-index: 1; left: 585px; top: 146px; position: absolute"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtSubject" ErrorMessage="*" ForeColor="Red" 
                            style="z-index: 1; left: 586px; top: 89px; position: absolute"></asp:RequiredFieldValidator>
                    </div>
                </ContentTemplate>
                <triggers>
                    <asp:PostBackTrigger ControlID="btnLetter" />
                </triggers>
            </asp:UpdatePanel>
        </div>
    
    <asp:Label ID="Label19" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 444px; top: 41px; position: absolute" 
                                Text="(Fields marked with * are mandatory)"></asp:Label>
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
            Font-Size="Large" onclick="lnkBack_Click" 
            style="z-index: 1; left: 599px; top: 9px; position: absolute">Back</asp:LinkButton>
    </a>
        
    </div>
</asp:Content>

