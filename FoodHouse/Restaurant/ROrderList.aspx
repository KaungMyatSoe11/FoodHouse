<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="ROrderList.aspx.cs" Inherits="FoodHouse.Restaurant.ROrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid d-flex">
        <div class="col-6">
        <asp:Button Text="Order Pending" CssClass="btn btn-warning m-1" runat="server" />
        <asp:Button Text="Order preparing" CssClass="btn m-1 btn-secondary" runat="server" />
        <asp:Button Text="Deliveried" CssClass="btn m-1 btn-success" runat="server" />
        <asp:Button Text="Order Not available" CssClass="btn m-1 btn-danger" runat="server" />

        </div>

        <div class="col-6 ">
            <asp:TextBox runat="server" CssClass="float-right m-1 form-control " Width="30%" TextMode="Date" />
        </div>

        
    </div>
</asp:Content>
