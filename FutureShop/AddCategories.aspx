<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddCategories.aspx.cs" Inherits="AddCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style type="text/css">
        .error {
         BORDER-RIGHT: red 2px solid;
        BORDER-TOP: red 2px solid;
        BORDER-LEFT: red 2px solid;
        BORDER-BOTTOM: red 2px solid 
        }
        .errorgone
        {
            BORDER-RIGHT: NotSet;
            BORDER-TOP: NotSet;
            BORDER-LEFT: NotSet;
            BORDER-BOTTOM: NotSet
        }
        .errorfp
        {
            color:Red  
        }
        .errorgonefp
        {
            color:Black  
        }
        
   </style>
          <script type="text/javascript">

              function validate() {
                  var CatName = document.getElementById('<%=txtCategory.ClientID %>').value;
                  var Fupload1 = document.getElementById('<%=FileUpload1.ClientID %>').value;
                  if (CatName == "") {
                      document.getElementById("<%=txtCategory.ClientID%>").className = "error";
                      return false;
                  }
                  if (Fupload1 == "") {
                      document.getElementById("<%=FileUpload1.ClientID%>").className = "errorfp";
                      return false;
                  }

              }
              function txtCat() {

                  document.getElementById("<%=txtCategory.ClientID%>").className = "errorgone";
                  return false;
              }
              function funup() {
                  document.getElementById("<%=FileUpload1.ClientID%>").className = "errorgonefp";
                  return false;

              }
              function subcatvalidate() {
                  var drpCat = document.getElementById('<%=drpCategory.ClientID %>');
                  var SCatName = document.getElementById('<%=txtCat1.ClientID %>').value;
                  var Fupload2 = document.getElementById('<%=FileUpload2.ClientID %>').value;
                  if (drpCat.selectedIndex == 0) {
                      document.getElementById("<%=drpCategory.ClientID%>").className = "error";
                      return false;
                  }

                  if (SCatName == "") {
                      document.getElementById("<%=txtCat1.ClientID%>").className = "error";
                      return false;
                  }
                  if (Fupload2 == "") {
                      document.getElementById("<%=FileUpload2.ClientID%>").className = "errorfp";
                      return false;
                  }
              }
              function funup2() {
                  document.getElementById("<%=FileUpload2.ClientID%>").className = "errorgonefp";
                  return false;

              }
              function Cat1() {
                  document.getElementById("<%=txtCat1.ClientID%>").className = "errorgone";
                  return false;
              }
             
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 768px">
    <div style="z-index: 1; left: 5px; top: 53px; position: absolute; width: 687px; height: 712px; margin-right: 0px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div style="height: 737px">
                        <div ID="divCategory" runat="server" 
                            
                            
                            style="border: thin inset #000000; z-index: 1; left: 18px; top: 32px; position: relative; height: 317px; width: 647px">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 27px; top: 33px; position: absolute; width: 130px" 
                                Text="Category Name"></asp:Label>
                            <asp:TextBox ID="txtCategory" runat="server" OnFocus="txtCat();"
                                style="z-index: 1; left: 172px; top: 31px; position: absolute; width: 148px" 
                                TabIndex="1"></asp:TextBox>
                            <asp:CheckBox ID="chkCategory" runat="server" AutoPostBack="True" 
                                Font-Bold="True" Font-Size="Medium" 
                                oncheckedchanged="chkCategory_CheckedChanged" 
                                style="z-index: 1; left: 26px; top: 105px; position: absolute" 
                                Text="Select From List Of Category" />
                            <asp:Label ID="lblCatName" runat="server" 
                                style="z-index: 1; left: 12px; top: 32px; position: absolute; width: 12px; height: 15px;" 
                                Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="lblCatPic" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 11px; top: 67px; position: absolute; width: 10px; height: 16px;" 
                                Text="*"></asp:Label>
                            
                            <asp:Label ID="lblCatDisplay" runat="server" Font-Size="Large" ForeColor="Blue" 
                                style="z-index: 1; left: 359px; top: 97px; position: absolute"></asp:Label>
                            
                            <div ID="divSubcategory" runat="server" 
                                style="border: thin inset #000000; z-index: 1; left: 7px; top: 134px; position: relative; height: 169px; width: 620px">
                                <asp:TextBox ID="txtCat1" runat="server"  OnFocus="return Cat1();"
                                    style="z-index: 1; left: 171px; top: 73px; position: absolute; height: 18px; width: 148px"></asp:TextBox>
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    style="z-index: 1; left: 25px; top: 28px; position: absolute" 
                                    Text="Category Name"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" 
                                    ForeColor="Black" 
                                    style="z-index: 1; left: 27px; top: 75px; position: absolute; width: 101px" 
                                    Text="Sub-Category"></asp:Label>
                                <asp:DropDownList ID="drpCategory" runat="server" 
                                    onselectedindexchanged="drpCategory_SelectedIndexChanged" 
                                    
                                    style="z-index: 1; left: 172px; top: 27px; position: absolute; height: 22px; width: 149px" 
                                    AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:Button ID="btnSubmit" runat="server" BackColor="Black" Font-Bold="True"  
                                    ForeColor="White" onclick="btnSubmit_Click" OnClientClick="return subcatvalidate();"
                                    style="z-index: 1; left: 173px; top: 124px; position: absolute; width: 102px; height: 28px" 
                                    Text="Submit" />
                                <asp:FileUpload ID="FileUpload2" runat="server" OnFocus="funup2();"
                                    
                                    style="z-index: 1; left: 338px; top: 71px; position: absolute; width: 217px;" />
                                <asp:Label ID="drpCatName" runat="server" ForeColor="Red" 
                                    style="z-index: 1; left: 9px; top: 27px; position: absolute; " 
                                    Text="*" width="15"></asp:Label>
                                <asp:Label ID="lblSCat" runat="server" 
                                    style="z-index: 1; left: 7px; top: 72px; position: absolute; width: 5px;" 
                                    Text="*" ForeColor="Red" Width="30px"></asp:Label>
                                    <asp:Label ID="lblSCatPic" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 325px; top: 69px; position: absolute; width: 5px;" 
                                Text="*" Width="30px"></asp:Label>
                                <asp:Label ID="lblSCatDisplay" runat="server" Font-Size="Large" 
                                    ForeColor="Blue" 
                                    style="z-index: 1; left: 308px; top: 124px; position: absolute"></asp:Label>
                            </div>
                            <asp:Button ID="btnAdd" runat="server" BackColor="Black" BorderStyle="Double" OnClientClick="return validate();"
                                Font-Bold="True" Font-Size="Small" ForeColor="White" onclick="btnAdd_Click" 
                                style="z-index: 1; left: 279px; top: 97px; position: absolute" Text="ADD" 
                                ValidationGroup="Cat" />
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Medium" 
                                style="z-index: 1; left: 26px; top: 66px; position: absolute" 
                                Text="Category Picture"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" runat="server"  OnFocus="funup();"
                                style="z-index: 1; left: 172px; top: 66px; position: absolute" />
                            
                        </div>
                        
                        
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAdd" />
                    <asp:PostBackTrigger ControlID="btnSubmit"/>                    
                    
                    <asp:AsyncPostBackTrigger ControlID="chkCategory" EventName="CheckedChanged" />                    
                    <asp:AsyncPostBackTrigger ControlID="drpCategory" 
                        EventName="SelectedIndexChanged" />                   
                </Triggers>
            </asp:UpdatePanel>
        </div>
    
    <asp:Label ID="Label19" runat="server" ForeColor="Red" 
                                style="z-index: 1; left: 435px; top: 57px; position: absolute" 
                                Text="(Fields marked with * are mandatory)"></asp:Label>
        
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" Font-Size="Large" 
            onclick="lnkBack_Click" 
            style="z-index: 1; left: 587px; top: 16px; position: absolute" 
            CausesValidation="False">Back</asp:LinkButton>
    </a>
        
    </div>
</asp:Content>

