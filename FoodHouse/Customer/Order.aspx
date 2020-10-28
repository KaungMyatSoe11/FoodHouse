<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FoodHouse.Customer.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .d{
            text-decoration-line:line-through;
        }
    </style>
   
    <div class="mr-auto ml-auto  p-2 shadow d-flex flex-row" style=" margin-top:35px;  width:80%;">
        <div class="">
            <asp:Image Width="300" ID="FImage" Height="300" ImageUrl="~/Image/administrator.png"  runat="server" />
        </div>
        <div class="w-100 " >
            <div class="m-2 pl-3">
            <asp:Label CssClass="font-weight-bold" Font-Size="Large" Text="Titel" ID="lblFoodName" runat="server" />
            <asp:Label Text="RName" ID="lblRName" CssClass="d-block text-muted" runat="server" />
                 <div class="mt-lg-5">
                <asp:Label Text="Price :" CssClass="mt-lg-5" runat="server" />
            <asp:Label Text="" ID="lblPrice" CssClass="text-muted "  runat="server" />
                <br />
                <asp:Label Text="Discount Price :" runat="server" />
            <asp:Label Text="" Visible="true"  ID="lblDiscount" Font-Size="Larger" runat="server" /> <span>Ks</span>
                    </div>
                <hr />
                </div>
            
            <div class="m-2 pl-3">
            <asp:Label Text="Special instructions" Font-Bold="true" CssClass="form-text" Font-Size="Large" runat="server" />
            <span class="text-muted">Any specific preferences? Let the restaurant know.</span>
            <asp:TextBox runat="server" ID="txtDescription" Height="100" CssClass="form-control w-50" TextMode="MultiLine" />
            <asp:Label Text="Qty" CssClass="form-text font-weight-bold m-1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class=" btn-group">
                            <asp:Button Text="-" OnClick="btnsubqty_Click" ID="btnsubqty" Width="40" CssClass="btn text-center btn-light font-weight-bold " runat="server" />
                            <asp:TextBox Text="1" Width="50" ID="txtQty" CssClass="text-center input-group-text d-inline ml-1 btn  " runat="server" />
                            <asp:Button Text="+" ID="btnaddqty" OnClick="btnaddqty_Click" CssClass="btn btn-light text-center ml-1 font-weight-bold  " Width="40" runat="server" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            <asp:Button Text="Add To Cart " OnClick="btnCart_Click" ID="btnCart" CssClass="btn btn-primary d-block mt-2" runat="server" />
                </div>
        </div>
    </div>

</asp:Content>
