<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderDetailList.aspx.cs" Inherits="FoodHouse.Restaurant.OrderDetailList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1">
        <Columns>
            <asp:BoundField DataField="OID" HeaderText="OID" SortExpression="OID" />
            <asp:BoundField DataField="ONumber" HeaderText="ONumber" SortExpression="ONumber" />
            <asp:BoundField DataField="ODate" HeaderText="ODate" SortExpression="ODate" />
            <asp:BoundField DataField="FID" HeaderText="FID" SortExpression="FID" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="RID" HeaderText="RID" SortExpression="RID" />
            <asp:BoundField DataField="RName" HeaderText="RName" SortExpression="RName" />
            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
            <asp:BoundField DataField="DiscountID" HeaderText="DiscountID" SortExpression="DiscountID" />
            <asp:BoundField DataField="DiscountPercentage" HeaderText="DiscountPercentage" SortExpression="DiscountPercentage" />
            <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" SortExpression="ShippingAddress" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="GrandTotal" HeaderText="GrandTotal" SortExpression="GrandTotal" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="FoodHouse.DbContextDataContext" EntityTypeName="" OrderBy="FoodName" TableName="vi_FoodOrderLists" Where="OID == @OID">
        <WhereParameters>
            <asp:SessionParameter Name="OID" SessionField="OID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
