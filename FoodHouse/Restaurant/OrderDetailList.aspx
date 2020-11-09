<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderDetailList.aspx.cs" Inherits="FoodHouse.Restaurant.OrderDetailList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" CssClass="table col-8 m-3" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1">
        <Columns>
            <%--<asp:BoundField DataField="OID" HeaderText="OID" SortExpression="OID" />--%>
            <asp:BoundField DataField="ONumber" HeaderText="ONumber" SortExpression="ONumber" />
            <asp:BoundField DataField="ODate" HeaderText="ODate" SortExpression="ODate" />
            <%--<asp:BoundField DataField="FID" HeaderText="FID" SortExpression="FID" />--%>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <%--<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />--%>
            <%--<asp:BoundField DataField="RID" HeaderText="RID" SortExpression="RID" />--%>
            <asp:BoundField DataField="RName" HeaderText="RName" SortExpression="RName" />
            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
            <%--<asp:BoundField DataField="DiscountID" HeaderText="DiscountID" SortExpression="DiscountID" />--%>
            <asp:BoundField DataField="DiscountPercentage" HeaderText="DiscountPercentage" SortExpression="DiscountPercentage" />
            <%--<asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" SortExpression="ShippingAddress" />--%>
            <%--<asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />--%>
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="GrandTotal" HeaderText="GrandTotal" SortExpression="GrandTotal" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="FoodHouse.DbContextDataContext" EntityTypeName="" OrderBy="FoodName" TableName="vi_FoodOrderLists" >
        
    </asp:LinqDataSource>
    <div class="col-3 w-100 bg-info d-flex flex-column  position-fixed m-1 p-2 rounded" style="height: 83vh; right: 1px; top: 95px;">
        <div class="w-100  mt-5  bg-light">
            <asp:Label Text="Total :" CssClass="col-6 text-right  float-lg-left" runat="server" />
            <asp:Label Text="3940" ID="lblGrandtotal" runat="server" CssClass="col-6 text-right  float-lg-right pr-5" />
        </div>

        <div class="w-100  mt-5   bg-light">
            <asp:Label Text="Status :" CssClass="col-6 text-right  float-lg-left" runat="server" />
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Order Pending</asp:ListItem>
                <asp:ListItem>Order Preparing</asp:ListItem>
                <asp:ListItem>Deliveried</asp:ListItem>
                <asp:ListItem>Order Not available</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="bg-light w-auto mt-1" style="height: 0.1vh;">
        </div>
        <div class="w-100  mt-5  ">

            <asp:TextBox runat="server" placeholder="Shipping Address" ID="txtShippingAddress" TextMode="MultiLine" Height="100" CssClass="w-100 form-control rounded" />
            <%--                <asp:CheckBox Text="Your Address"  runat="server" />--%>
        </div>

        <asp:Button Text="Check Out" CssClass="btn btn-success mt-5" runat="server" ID="btnCheckOut" />
    </div>
            
</asp:Content>
