<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 772px">
    <div style="z-index: 1; left: 199px; top: 41px; position: absolute; height: 38px; width: 604px; font-size: x-large; font-weight: bold; font-family: 'Comic Sans MS'; text-align: center;">
        Frequently Asked Questions...</div>
    <div style="z-index: 1; left: 62px; top: 105px; position: absolute; height: 653px; width: 853px">
        <p>
            <span style="font-size: small;"><strong>Why would I pre-order a product?<br />
            </strong>We offer pre-orders for items that are in high demand before they’re 
            released. Pre-ordering guarantees that you will receive that item on or shortly 
            after the release date. No line-ups, no hassles.</span><br />
            <br />
            <span style="font-size: small;"><strong>When will I receive my item?<br />
            </strong>We do our best to ensure that pre-ordered items are shipped as soon as 
            possible.&nbsp;The release date shown is usually the date we receive the product from 
            our supplier and will begin shipping from our warehouse. You should expect to 
            receive your items on or shortly after the release date, depending on when we 
            receive the product from the supplier.</span><br />
            <span style="font-size: small;">Please note that if the release date is on or 
            close to a holiday, there could be a brief delay in shipping.</span></p>
        <p>
            <span style="font-size: small;"><strong>Can I pre-order in-store?<br />
            </strong>All of the most-anticipated releases can be pre-ordered in-store, with 
            some exceptions. A $10 deposit is required for most in-store pre-orders. If you 
            change your mind before the pre-order launches, this deposit is refundable.</span></p>
        <p>
            <span style="font-size: small;"><strong>Can I pick up pre-ordered items at the 
            store?&nbsp;<br />
            </strong>Unfortunately, we do not offer in-store pickup on pre-orders. All 
            pre-ordered items are shipped directly to the address you provided in your 
            account information.</span></p>
        <p>
            <span style="font-size: small;"><strong>Can I cancel my pre-order? How do I do 
            this?<br />
            </strong>If you haven’t yet received notification that your pre-order has 
            shipped, simply log into your&nbsp;account&nbsp;and 
            click on your order. You can cancel it there.</span></p>
        <p>
            <span style="font-size: small;"><strong>What if it has already been shipped and 
            I’ve been billed?<br />
            </strong>If the item has already been shipped, just wait until it’s delivered, 
            then return it either in-store or through the mail. Refer to our&nbsp;Returns and 
            Exchanges help topic for more information on returns. To find a store near 
            you, please see our&nbsp;Store 
            Locator.</span></p>
        <p>
            <span style="font-size: small;"><strong>What is the Price Beat Promise?&nbsp;<br />
            </strong>The&nbsp;Price Beat Promise&nbsp;ensures that if you find a lower advertised 
            price on the same item, we will beat that price by 10% of the difference. Learn 
            more by referring to our&nbsp;Price 
            Beat Promise help topic.</span></p>
        <p>
            <span style="font-size: small;"><strong>What happens if the price drops during 
            the pre-order date or on release date?<br />
            </strong>In the event that the price of a pre-ordered item drops between the 
            time you place order and the time it ships, you will automatically be charged 
            the lower price.</span></p>
        <p>
            <span style="font-size: small;"><strong>When will I be billed?<br />
            </strong>You will be billed on the day the item ships. To avoid delays, ensure 
            you use a payment method that will still be valid on the release date.</span></p>
        <p>
            <span style="font-size: small;"><strong>I still haven’t received my pre-order. 
            What’s going on?&nbsp;<br />
            </strong>If you haven’t received shipping notification but the release date has 
            passed, please call customer service at1-800-663-2275&nbsp;for an ETA.</span></p>
        <p>
            <span style="font-size: small;">If you have received shipping notification, and 
            more than a few days have passed since release date, please log into your&nbsp;account&nbsp;to 
            check the shipping status – it may be waiting for you at your local post office. 
            If the item is not there, contact our customer service department 
            at&nbsp;1-800-663-2275&nbsp;to make a lost shipment claim. Please note that if the release 
            date of your pre-ordered items falls on or close to a holiday, there could be a 
            brief shipping delay.</span></p>
    </div>
               
                <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="False" 
            Font-Size="Large" onclick="lnkBack_Click" 
            style="z-index: 1; left: 826px; top: 17px; position: absolute">Back</asp:LinkButton>
    
</div>
</asp:Content>

