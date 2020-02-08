<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div style="height: 797px">
        <div style="z-index: 1; left: 23px; top: 83px; position: absolute; height: 339px; width: 402px; margin-top: 0px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div ID="divLogin" runat="server" class="panel" 
                    style="height: 210px; background-color: #FFFFFF;">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red" 
                        style="z-index: 1; left: 34px; position: absolute; width: 83px; height: 22px; bottom: 232px;" 
                        Text="Password"></asp:Label>
                    <asp:TextBox ID="txtUserName" runat="server" TabIndex="1"                   
                        style="z-index: 1; left: 136px; top: 43px; position: absolute; width: 166px; right: 100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"  ValidationGroup="Login"
                        
                        style="z-index: 1; left: 313px; top: 81px; position: absolute; width: 28px; height: 18px"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" 
                        style="z-index: 1; left: 34px; top: 43px; position: absolute; width: 83px" 
                        Text="UserName"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" TabIndex="2"   
                        
                        style="z-index: 1; left: 136px; top: 84px; position: absolute; width: 166px; right: 100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtUserName" ErrorMessage="*" ForeColor="Red" ValidationGroup="Login"
                        
                        style="z-index: 1; left: 313px; top: 43px; position: absolute; width: 28px"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnCancel" runat="server" TabIndex="4"   
                        style="z-index: 1; left: 188px; top: 136px; position: absolute" Text="Cancel" 
                        Width="90px" CausesValidation="False" onclick="btnCancel_Click"  />
                    <asp:Button ID="btnSubmit" runat="server" TabIndex="3"   
                        style="z-index: 1; left: 63px; top: 136px; position: absolute" Text="Submit" 
                        Width="90px" onclick="btnSubmit_Click" />
                    <asp:LinkButton ID="lnkFPassword" runat="server" TabIndex="5"   
                        style="z-index: 1; left: 68px; top: 178px; position: absolute" 
                        CausesValidation="False" onclick="lnkFPassword_Click">Forgot Password ?</asp:LinkButton>
                </div>
                <div ID="divFPassword" runat="server" class="panel" 
                    style="height: 210px; background-color: #FFFFFF;">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Red" 
                        style="z-index: 1; left: 24px; top: 43px; position: absolute; width: 72px;" 
                        Text="Question"></asp:Label>
                    <asp:Label ID="lblQuestion" runat="server" Font-Bold="True" 
                        style="z-index: 1; left: 130px; top: 43px; position: absolute"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" 
                        style="z-index: 1; left: 24px; position: absolute; width: 72px; bottom: 235px;" 
                        Text="Answer" height="19"></asp:Label>
                    <asp:TextBox ID="txtSAnswer" runat="server" TabIndex="6"   
                        
                        
                        style="z-index: 1; left: 130px; top: 82px; position: absolute; width: 212px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtSAnswer" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="FPassword"
                        
                        style="z-index: 1; left: 357px; top: 81px; position: absolute; width: 25px"></asp:RegularExpressionValidator>
                    <asp:Button ID="btnSubFPassword" runat="server" TabIndex="7"   
                        style="z-index: 1; left: 63px; top: 136px; position: absolute" Text="Submit" 
                        width="90px" onclick="btnSubFPassword_Click" />
                    <asp:Button ID="btnCanPass" runat="server" TabIndex="8"   
                        style="z-index: 1; left: 188px; top: 136px; position: absolute" Text="Cancel" 
                        width="90px" onclick="btnCanPass_Click" CausesValidation="False" />
                </div>
                 <div ID="divResetPassword" runat="server" class="panel" 
                    style="height: 210px; background-color: #FFFFFF;">

                     <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" 
                         style="z-index: 1; left: 25px; top: 43px; position: absolute; width: 142px;" 
                         Text="Enter New Password"></asp:Label>
                     <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" TabIndex="9"   
                         
                         style="z-index: 1; left: 174px; top: 43px; position: absolute; width: 173px"></asp:TextBox>
                     <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" 
                         style="z-index: 1; left: 25px; position: absolute; bottom: 235px;" 
                         Text="Confirm Password" height="19"></asp:Label>
                     <asp:TextBox ID="txtNewCnfrmPassword" runat="server" TextMode="Password" TabIndex="10"   
                         style="z-index: 1; left: 174px; position: absolute; bottom: 232px;" 
                         width="173px" height="22"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ValidationGroup="Reset"
                         ControlToValidate="txtNewCnfrmPassword" ErrorMessage="*" ForeColor="Red" 
                         
                         style="z-index: 1; left: 360px; position: absolute; width: 22px; bottom: 235px;" 
                         height="19"></asp:RequiredFieldValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Reset"
                         ControlToValidate="txtNewPassword" ErrorMessage="*" ForeColor="Red" 
                         
                         style="z-index: 1; left: 360px; top: 43px; position: absolute; width: 22px;"></asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="Reset"
                         ControlToCompare="txtNewPassword" ControlToValidate="txtNewCnfrmPassword" 
                         ErrorMessage="Password Donot Match" ForeColor="Red" 
                         
                         
                         style="z-index: 1; left: 195px; top: 110px; position: absolute; right: 62px;"></asp:CompareValidator>
                     <asp:Button ID="btnSubReset" runat="server" TabIndex="11"   
                         style="z-index: 1; left: 67px; top: 136px; position: absolute" Text="Submit" 
                         Width="90px" onclick="btnSubReset_Click" />
                     <asp:Button ID="btnCanReset" runat="server" CausesValidation="False" TabIndex="12"   
                         style="z-index: 1; left: 208px; top: 136px; position: absolute" Text="Cancel" 
                         Width="90px" onclick="btnCanReset_Click" />

                 </div>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lnkFPassword" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnCanPass" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSubFPassword" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
   </asp:Content>


