<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">       

    var mygallery = new simpleGallery({
        wrapperid: "simplegallery1", //ID of main gallery container,
        dimensions: [494, 209], //width/height of gallery in pixels. Should reflect dimensions of the images exactly
        imagearray: [
            ["Images/Image/diwali.JPG", "", "_new", ""],
            ["Images/Image/Nokia.JPG", "", "", ""],
            ["Images/Image/Offer.JPG", "", "", ""],
            ["Images/Image/propert.JPG", "", "", ""]            
        ],
        autoplay: [true, 2000, 8], //[auto_play_boolean, delay_btw_slide_millisec, cycles_before_stopping_int]
        persist: false, //remember last viewed slide and recall within same session?
        fadeduration: 1500, //transition duration (milliseconds)
        oninit: function () { //event that fires when gallery has initialized/ ready to run
            //Keyword "this": references current gallery instance (ie: try this.navigate("play/pause"))
        },
        onslide: function (curslide, i) { //event that fires after each slide is shown
            //Keyword "this": references current gallery instance
            //curslide: returns DOM reference to current slide's DIV (ie: try alert(curslide.innerHTML)
            //i: integer reflecting current image within collection being shown (0=1st image, 1=2nd etc)
        }
    })  
       
    </script>

</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 798px; width: 986px">
        <asp:Image ID="imgDeal" runat="server" ImageUrl="~/Images/SAle.jpg" 
            
            
            
            
            style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 275px; width: 343px" />
        <div style="z-index: 1; left: 343px; top: 1px; position: absolute; height: 274px; width: 646px; background-color: #FFFFFF;">
            <asp:Panel ID="pnlDealValid" runat="server"      
                
                
                style="z-index: 1; left: 1px; top: -1px; position: absolute; height: 276px; width: 639px">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                Font-Names="Comic Sans MS" Font-Size="XX-Large" ForeColor="#CC0000" 
                style="z-index: 1; left: 170px; top: 7px; position: absolute; width: 318px; height: 47px" 
                Text="DEAL OF THE DAY"></asp:Label>
                <asp:Image ID="imgDealOfDay" runat="server" 
                
                    style="z-index: 1; left: 23px; top: 57px; position: absolute; height: 176px; width: 161px; right: 455px" 
                    BorderStyle="None" />
                <asp:Label ID="lblProductName" runat="server" Font-Bold="True" 
                Font-Names="Franklin Gothic Medium" Font-Size="22px" ForeColor="#CC0066" 
                
    style="z-index: 1; left: 206px; top: 58px; position: absolute; width: 423px"></asp:Label>
                <asp:Label ID="lblDescription" runat="server" 
                
                style="z-index: 1; left: 210px; top: 101px; position: absolute; width: 397px; height: 72px;" 
                BorderStyle="None" Font-Size="Medium" ForeColor="#993333"></asp:Label>
                <div style="border-bottom: thin groove #000000; z-index: 1; left: 210px; top: 182px; position: absolute; height: 57px; width: 286px;">
                </div>
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" 
                ForeColor="#CC0000" 
                style="z-index: 1; left: 210px; top: 186px; position: absolute; width: 120px" 
                Text="ListPrice"></asp:Label>
                <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="#CC0000" 
                style="z-index: 1; left: 210px; top: 215px; position: absolute; width: 120px" 
                Text="Todays Discount"></asp:Label>
                <asp:Label ID="lblListPrice" runat="server" Font-Size="Medium" 
                Font-Strikeout="True" 
                
                
    style="z-index: 1; left: 331px; top: 186px; position: absolute; width: 126px"></asp:Label>
                <asp:Label ID="lblTodaysDiscount" runat="server" Font-Size="Medium" 
                
                
    style="z-index: 1; left: 331px; top: 215px; position: absolute; width: 126px"></asp:Label>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" 
                ForeColor="#CC0000" 
                style="z-index: 1; left: 210px; top: 245px; position: absolute; height: 21px; width: 112px" 
                Text="Todays Deal"></asp:Label>
                <asp:Label ID="lblDealPrice" runat="server" Font-Size="Medium" 
                
    style="z-index: 1; left: 334px; top: 247px; position: absolute; width: 88px"></asp:Label>
                <asp:Label ID="lblOffPercent" runat="server" Font-Bold="True" 
                Font-Size="Medium" ForeColor="#CC0066" 
                
    style="z-index: 1; left: 432px; top: 247px; position: absolute; width: 74px"></asp:Label>
                <asp:Button ID="btnAddToCart" runat="server" BackColor="Black" Font-Bold="True" 
            Font-Size="Medium" ForeColor="White" 
            style="z-index: 1; left: 26px; top: 238px; position: absolute; width: 152px" 
            Text="Add To Cart" onclick="btnAddToCart_Click" />
            </asp:Panel>
            
        <asp:Panel ID="pnlInValidDeal" runat="server" 
            
            style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 276px; width: 639px" 
            BackColor="White">
            <asp:Image ID="Image2" runat="server" 
    
                
                style="z-index: 1; left: 165px; top: 64px; position: absolute; width: 459px; height: 59px;" 
                ImageUrl="~/Images/saletitle.bmp" />
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/saletitle2.bmp" 
                style="z-index: 1; left: 92px; top: 111px; position: absolute; width: 536px; height: 60px" />
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Deal.jpeg" 
                style="z-index: 1; left: 16px; top: 70px; position: absolute; height: 159px; width: 139px" />
        </asp:Panel>
       
        </div>
       
        <div style="z-index: 1; left: 5px; top: 307px; position: absolute; height: 151px; width: 986px">
          
                
            <div style="z-index: 1; left: -1px; top: 397px; position: absolute; height: 57px; width: 978px; font-family: 'Comic Sans MS'; color: #800000; font-size: x-large;">
           <marquee behavior="scroll">This Diwali make a new beginning with great offers at Future Shop...Join us and start SHOPPING....               This Diwali make a new beginning with great offers at Future Shop...Join us and start SHOPPING....        This Diwali make a new beginning with great offers at Future Shop...Join us and start SHOPPING....</marquee>
           

            </div>
          
                
            <asp:DataList ID="DataList1" runat="server" 
              DataSourceID="SqlDataSource1" 
              RepeatColumns="9"
              RepeatDirection="Horizontal" Width="243px" BorderColor="Black"  DataKeyField="CID"
                CellSpacing="2" onitemcommand="DataList1_ItemCommand" 
                onselectedindexchanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" Width="100" Height="120"
                        ImageUrl='<%# Eval("PicPath") %>' BorderColor="#CCCCCC" 
                        BorderStyle="Solid" BorderWidth="2px" />              
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" 
                        Text='<%# Eval("CategoryName") %>' style="text-align: center" Width="98px"></asp:Label>
                </ItemTemplate>
                
            </asp:DataList>
       
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FutureShopConnectionString5 %>" 
                SelectCommand="SELECT Top 9 [PicPath], [CategoryName],[CID] FROM [Category]"></asp:SqlDataSource>
           
        </div>
       
        <div style="z-index: 1; left: 3px; top: 280px; position: absolute; height: 22px; width: 986px; ">
            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="X-Large" 
                ForeColor="Black" Text="CATEGORIES"></asp:Label>
            
        </div>
       <div id="simplegallery1" 
            style="z-index: 1; width: 539px; margin-left: 0px; height: 209px; left: 5px; top: 475px; position: absolute;" 
           >
 
           
        </div>  
        <div style="border: medium solid #C0C0C0; z-index: 1; left: 573px; top: 475px; position: absolute; height: 209px; width: 391px; background-color: #FFFFFF; font-family: 'Comic Sans MS'; font-size: large; font-weight: bold; color: #800000; text-align: center;">
            <br />
            Be a MEMBER and enjoy special discount.......Hurry!
            <asp:Image ID="Image5" 
                runat="server" 
                style="z-index: 1; left: 28px; top: 87px; position: absolute; width: 96px; height: 78px" 
                ImageUrl="~/Images/SilverCat.JPG" />
            <asp:Image ID="Image6" runat="server" 
                
                style="z-index: 1; left: 151px; top: 87px; position: absolute; width: 96px; height: 78px" 
                ImageUrl="~/Images/GoldCat.JPG" />
            <asp:Image ID="Image7" runat="server" 
                
                style="z-index: 1; left: 273px; top: 87px; position: absolute; width: 96px; height: 78px" 
                ImageUrl="~/Images/PlatinumCat.JPG" />
        </div>
    </div>
    
</asp:Content>






