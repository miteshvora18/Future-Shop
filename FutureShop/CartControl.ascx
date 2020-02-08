<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartControl.ascx.cs" Inherits="CartControl" %>
<style type="text/css">
    .style1
    {
        font-family: "Comic Sans MS";
        font-size: x-large;
    }
    .style2
    {
        font-size: x-large;
    }
        .button
        {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;             
        }
        </style>
<asp:GridView ID="grdCart" runat="server"  AutoGenerateColumns="False" 
              DataKeyNames="ProductID" 
              OnRowCancelingEdit="grdCart_RowCancelingEdit" 
              OnRowDeleting="grdCart_RowDeleting" 
              OnRowEditing="grdCart_RowEditing" 
              OnRowUpdating="grdCart_RowUpdating" CellPadding="4" 
    ForeColor="#333333" GridLines="None" Height="259px" Width="527px" 
    BorderStyle="None" onselectedindexchanged="grdCart_SelectedIndexChanged" >
              <AlternatingRowStyle BackColor="White" />
              <Columns>
<asp:TemplateField>
    <ItemTemplate>
    <asp:Image ID="Image1" runat="server" height="70px" Width="60px"
    ImageUrl='<%# Eval("ImageUrl") %>'/>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="ProductName" 
                HeaderText="Product" ReadOnly="True"/>
<asp:BoundField DataField="Quantity" HeaderText="Quantity"/>
<asp:BoundField DataField="Price"  
                HeaderText="Price" ReadOnly="True" DataFormatString="Rs {0}"   />
<asp:BoundField DataField="SubTotal" 
                HeaderText="Total" ReadOnly="True" DataFormatString="Rs {0}"/>
<asp:CommandField ShowDeleteButton="True" 
                  ShowEditButton="True"/>
</Columns>
<EmptyDataTemplate>
    <%  Application["cartcount"] = null; %> 
    <span class="style1"><strong>Your Shopping Cart is empty, add items</strong></span>
    <br />
<%if (Session["username"] == "Guest") %>
<%{ %>
<a href="Home.aspx"><span class="style2">Add Products</span></a>
<%} %>
<%else %>
<%{ %>
<a href="User.aspx"><span class="style2">Add Products</span></a>
    <span class="style2"><%} %></span>
</EmptyDataTemplate>
              <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
              <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
              <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
              <SortedAscendingCellStyle BackColor="#FDF5AC" />
              <SortedAscendingHeaderStyle BackColor="#4D0000" />
              <SortedDescendingCellStyle BackColor="#FCF6C0" />
              <SortedDescendingHeaderStyle BackColor="#820000" />
              
</asp:GridView>

<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
    Text="Total : "></asp:Label>
<asp:Label ID="TotalLabel" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" 
    Font-Size="Large" Text="Rs" Visible="False"></asp:Label>
                        <asp:Button ID="btnProceed" runat="server" BackColor="#993333" 
                            CssClass="button" Font-Bold="True" 
    Font-Size="Large" ForeColor="White" 
                            onclick="btnProceed_Click" 
                            style="z-index: 1;  float:none; width: 139px;  " 
                            Text="Proceed" />
                        
                        
