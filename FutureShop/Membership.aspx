<%@ Page Title="" Language="C#" MasterPageFile="~/Dependent.master" AutoEventWireup="true" CodeFile="Membership.aspx.cs" Inherits="Membership" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 793px">
        <div style="z-index: 1; left: 3px; top: 230px; position: absolute; height: 566px; width: 709px; background-color: #FFFFFF;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString10 %>" 
                
                SelectCommand="SELECT [PlanName], [Price], [DiscountInPercentage], [PlanDuration] FROM [Schemes]">
            </asp:SqlDataSource>
            <div style="z-index: 1; left: 61px; top: 65px; position: absolute; height: 712px; width: 589px">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div style="height: 492px">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                                GridLines="None" 
                                style="z-index: 1; left: 45px; top: 47px; position: absolute; height: 203px; width: 506px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="PlanName" HeaderText="Plan Name" 
                                        SortExpression="PlanName" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" 
                                        SortExpression="Price" />
                                    <asp:BoundField DataField="DiscountInPercentage" 
                                        HeaderText="Discount(In %)" SortExpression="DiscountInPercentage" />
                                         <asp:BoundField DataField="PlanDuration" HeaderText="Duration(In Months)" 
                                        SortExpression="PlanDuration" />
                                         <asp:templatefield headertext="">
                                        <itemtemplate>
                                            <%--<asp:LinkButton id="btnRedirect" Text= "Select"
                                            CommandArgument='<%#Eval("SchemeName")%>'
                                            OnClick="DoRedirect" runat="server"/>--%>
                                          <asp:Button id="btnRedirect"
                                            Text= "Select" 
                                            CommandArgument='<%#Eval("PlanName")%>'
                                            OnClick="DoRedirect"
                                            runat="server"/> 
                                        </itemtemplate>
                                    </asp:templatefield>      
                                </Columns>
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
                            <asp:Label ID="Label13" runat="server" Font-Bold="False" Font-Size="X-Large" 
                                ForeColor="#BB0000" 
                                style="z-index: 1; left: 170px; top: 9px; position: absolute" 
                                Text="MEMBERSHIP DETAILS"></asp:Label>
                                
                            <div style="z-index: 1; left: 3px; top: 276px; position: absolute; height: 464px; width: 583px">
                                <div ID="divSubscribe" runat="server" 
                                    style="border: medium solid #BB0000; z-index: 1; left: 4px;  height: 199px; width: 572px">
                                    <asp:Label ID="Label14" runat="server" Font-Size="Large" 
                                        style="z-index: 1; left: 87px; top: 25px; position: absolute" Text="Plan Name"></asp:Label>
                                    <asp:Label ID="lblPlan" runat="server" Font-Size="Large" ForeColor="#BB0000" 
                                        style="z-index: 1; left: 217px; top: 25px; position: absolute; width: 256px;"></asp:Label>
                                    <asp:Label ID="Label15" runat="server" Font-Size="Large" 
                                        style="z-index: 1; left: 87px; top: 67px; position: absolute" Text="Plan Price"></asp:Label>
                                    <asp:Label ID="lblPrice" runat="server" Font-Size="Large" ForeColor="#BB0000" 
                                        style="z-index: 1; left: 217px; top: 67px; position: absolute"></asp:Label>
                                    <asp:Label ID="Label16" runat="server" Font-Size="Large" 
                                        style="z-index: 1; left: 87px; top: 112px; position: absolute" 
                                        Text="Plan Duration"></asp:Label>
                                    
                                    <asp:Label ID="Label17" runat="server" ForeColor="#BB0000" 
                                        style="z-index: 1; left: 217px; top: 110px; position: absolute" 
                                        Text="6 Months" Font-Size="Large"></asp:Label>
                                    <asp:Button ID="btnSubscribe" runat="server" BackColor="Black" 
                                        BorderStyle="Outset" Font-Size="Medium" ForeColor="White" 
                                        onclick="btnSubscribe_Click" 
                                        style="z-index: 1; left: 192px; top: 160px; position: absolute; width: 134px;" 
                                        Text="Subscribe Me" />
                                    <asp:Image ID="imgDisplay" runat="server" 
                                        style="z-index: 1; left: 414px; top: 15px; position: absolute; height: 142px; width: 140px;" />
                                    </div>
                                    <div runat="server" id="divChosen" 
                                    style="border: medium solid #BB0000; z-index: 1; left: 4px;   height: 199px; width: 572px; background-color: #FFFFFF; font-size: large; font-family: 'Comic Sans MS'; text-align: center;">
                                        <asp:Button ID="btnContinue" runat="server" BackColor="Black" 
                                            BorderStyle="Outset" Font-Size="Medium" ForeColor="White" 
                                            style="z-index: 1; left: 142px; top: 138px; position: absolute; width: 148px" 
                                            Text="Wish To Continue ?" onclick="btnContinue_Click" />
                                        <asp:Button ID="btnCancel" runat="server" BackColor="Black" 
                                            BorderStyle="Outset" Font-Size="Medium" ForeColor="White" 
                                            style="z-index: 1; left: 328px; top: 137px; position: absolute; width: 92px;" 
                                            Text="Cancel" onclick="btnCancel_Click" />
                                        <br />
                                        <br />
                                        You have chosen&nbsp;
                                        <asp:Label ID="lblChosenPlan" runat="server" Font-Bold="False" 
                                            Font-Size="Large" ForeColor="#BB0000"></asp:Label>
                                        &nbsp;plan&nbsp;
                                        <br />
                                        For a period of&nbsp;
                                        <asp:Label ID="lblChosenTime" runat="server" Font-Size="Large" 
                                            ForeColor="#BB0000"></asp:Label>
                                        &nbsp;months.&nbsp;
                                        <br />
                                        You are supposed to pay a sum of&nbsp;
                                        <asp:Label ID="lblSumPrice" runat="server" Font-Size="Large" 
                                            ForeColor="#BB0000"></asp:Label>
                                        &nbsp;Rs.</div>
                                
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
                <a href="http://www.futureshop.ca/en-CA/e-recycling.aspx">
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
                Font-Size="Large" onclick="lnkBack_Click" 
                style="z-index: 1; left: 597px; top: 14px; position: absolute">Back</asp:LinkButton>
    </a>
        </div>
    </div>
</asp:Content>


