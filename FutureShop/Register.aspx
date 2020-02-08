<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<script runat="server" >  

</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="z-index: 1; left: 53px; top: 2px; position: absolute; height: 695px; width: 581px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <br/>
                <asp:Panel ID="pnlRegister" runat="server" BackColor="White" Height="665px" 
                    Width="604px" CssClass="panel">
                
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" 
                        ForeColor="Red" 
                        style="z-index: 1; left: 222px; top: 44px; position: absolute" 
                        Text="REGISTER"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 66px; top: 97px; position: absolute; width: 97px" 
                        Text="First Name" ForeColor="Red"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 66px; top: 134px; position: absolute; width: 97px" 
                        Text="Last Name" ForeColor="Red"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 66px; top: 177px; position: absolute; width: 97px" 
                        Text="Email Address" ForeColor="Red"></asp:Label>    
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 66px; top: 262px; position: absolute; width: 97px; " 
                        Text="Password" ForeColor="Red" height="23"></asp:Label> 
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 66px; top: 308px; position: absolute; width: 138px; " 
                        Text="Retype Password" ForeColor="Red" height="21"></asp:Label> 
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 66px; top: 348px; position: absolute; width: 142px; " 
                        Text="Security Question" ForeColor="Red" height="19px"></asp:Label> 
                    <asp:TextBox ID="txtFirstName" runat="server" 
                        style="z-index: 1; left: 225px; top: 92px; position: absolute; width: 189px;" 
                        TabIndex="1" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:TextBox ID="txtLastName" runat="server" 
                        style="z-index: 1; left: 225px; top: 134px; position: absolute" TabIndex="2" 
                        width="189px" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" 
                        style="z-index: 1; left: 225px; top: 177px; position: absolute" TabIndex="3" 
                        width="189px" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" 
                        style="z-index: 1; left: 225px; top: 266px; position: absolute" TabIndex="5" 
                        width="189px" TextMode="Password" BorderColor="Red" 
                    BorderStyle="Solid" BorderWidth="1px" ></asp:TextBox>
                    <asp:TextBox ID="txtRetypePassword" runat="server" 
                        style="z-index: 1; left: 225px; top: 309px; position: absolute" TabIndex="6" 
                        width="189px" TextMode="Password" BorderColor="Red" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtFirstName" ErrorMessage="*" ForeColor="Red" 
                        
                        style="z-index: 1; left: 428px; top: 93px; position: absolute; width: 20px;"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtLastName" ErrorMessage="*" ForeColor="Red" 
                        style="z-index: 1; left: 428px; top: 136px; position: absolute; width: 20px;"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red" 
                        style="z-index: 1; left: 428px; top: 177px; position: absolute; width: 20px;"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red" 
                        
                        
                        
                        style="z-index: 1; left: 428px; top: 268px; position: absolute; width: 20px; height: 23px;"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtRetypePassword" ErrorMessage="*" ForeColor="Red" 
                        
                        
                        style="z-index: 1; left: 428px; top: 309px; position: absolute; width: 20px; " 
                        height="20"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtSAnswer" ErrorMessage="*" ForeColor="Red" 
                        
                        
                        
                        
                        style="z-index: 1; left: 428px; top: 386px; position: absolute; width: 20px; height: 16px;"></asp:RequiredFieldValidator>
                    <asp:CheckBox ID="chkNewsLetter" runat="server" Font-Bold="True" 
                        Font-Size="Medium" ForeColor="Red" 
                        style="z-index: 1; left: 66px; top: 425px; position: absolute; width: 196px; " 
                        Text="Future Shop NewsLetter" />
                    <asp:Label ID="lblNewsLetter" runat="server" ForeColor="Red" 
                        style="z-index: 1; top: 459px; position: absolute; width: 424px; height: 92px; left: 66px" 
                        
                    
                        
                        
                        Text="Subscribe me to Future Shop's weekly email newsletter to keep me up-to-date on new product and entertainment releases; learn how to make the most of the latest technology; and inform me of Future Shop's upcoming promotions, exclusive offers, exciting contests, and special events."></asp:Label>
                    <asp:Button ID="btnSignUp" runat="server" BackColor="Black" BorderStyle="Outset" 
                        Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                        style="z-index: 1; left: 66px; top: 569px; position: absolute; width: 111px;" 
                        Text="Sign Up" onclick="btnSignUp_Click" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Invalid Email" Font-Bold="True" 
                        ForeColor="Red" 
                        style="z-index: 1; left: 426px; top: 179px; position: absolute" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToCompare="txtPassword" ControlToValidate="txtRetypePassword" 
                        ErrorMessage="Password Donot Match" Font-Bold="True" ForeColor="Red" 
                        
                        style="z-index: 1; left: 429px; top: 310px; position: absolute; width: 162px;"></asp:CompareValidator>                  
                    <asp:DropDownList ID="drpSQuestion" runat="server" 
                        style="z-index: 1; left: 225px; top: 345px; position: absolute" 
                        width="189px" CssClass="drp" TabIndex="7">
                        <asp:ListItem>---Select---</asp:ListItem>
                        <asp:ListItem>Favourite Food item</asp:ListItem>
                        <asp:ListItem>Favourite Color</asp:ListItem>
                        <asp:ListItem>First School</asp:ListItem>
                        <asp:ListItem>Best Friend</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Medium" 
                        ForeColor="Red" height="19px" 
                        style="z-index: 1; left: 66px; top: 387px; position: absolute; width: 142px; " 
                        Text="Security Answer"></asp:Label>
                    <asp:TextBox ID="txtSAnswer" runat="server" BorderColor="Red" 
                        BorderStyle="Solid" BorderWidth="1px" 
                        style="z-index: 1; left: 225px; top: 386px; position: absolute" 
                        TabIndex="8" width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="drpSQuestion" ErrorMessage="*" ForeColor="Red" 
                        
                        
                        style="z-index: 1; left: 428px; top: 347px; position: absolute; width: 20px; height: 16px;"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Medium" 
                        ForeColor="Red" 
                        style="z-index: 1; left: 66px; top: 220px; position: absolute; width: 97px" 
                        Text="UserName"></asp:Label>
                    <asp:TextBox ID="txtUserName" runat="server" BorderColor="Red" 
                        BorderStyle="Solid" BorderWidth="1px" 
                        style="z-index: 1; left: 225px; top: 220px; position: absolute" TabIndex="3" 
                        width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="txtUserName" ErrorMessage="*" ForeColor="Red" 
                        style="z-index: 1; left: 428px; top: 220px; position: absolute; width: 20px; height: 23px;"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 429px; top: 218px; position: absolute"></asp:Label>
                    <asp:Label ID="lblEMsg" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="z-index: 1; left: 430px; top: 177px; position: absolute"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="drpSQuestion" ErrorMessage="Plese select right option" 
                Font-Bold="True" Font-Size="Large" ForeColor="#FF3300" 
                InitialValue="---Select---" SetFocusOnError="True" 
                
                style="z-index: 1; left: 432px; top: 344px; position: absolute; width: 5px;">*</asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
</asp:Content>

