<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FoodHouse.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p-5">
        
        
<div class="row card-deck  pl-2 pr-2  mt-4  rounded " style="background-color:gainsboro;" >
  
<asp:ListView ID="ListView1" runat="server" DataKeyNames="RID"  DataSourceID="SqlDataSource1">
<ItemTemplate>
<div class="mt-2 mb-2 mr-auto ml-auto  bg-light" style="width:180px;">
<%--<asp:Image ID="Image1" CssClass="mt-2" width="100%" Height="200px" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("RLogo")).ToArray()) %>' runat="server" />--%>
<asp:ImageButton  CssClass="card-img-top  " width="100%" Height="180px" ID="btnRestaurant" CommandArgument='<%#Eval("RID") %>' OnCommand="btnRestaurant_Command" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("RLogo")).ToArray()) %>' runat="server" />
<asp:LinkButton ID="LinkButton1"  CommandArgument='<%#Eval("RID") %>'  runat="server" OnCommand="btnRestaurant_Command">
<div class=" text-center ">
<asp:Label ID="Label1" runat="server" Text='<%#Eval("RName") %>'></asp:Label><br />
<asp:Label ID="Label2" CssClass="text-muted" runat="server" Text='<%#Eval("CategoryName") %>'></asp:Label>
</div>

</asp:LinkButton>

</div>
</ItemTemplate>
</asp:ListView>
       
  
   
</div>
        <%-- <asp:TextBox runat="server" TextMode="Date" />   --%>
         <asp:LinkButton   Text="See More>>> " CssClass="btn-link" runat="server" />
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT TOP (6) RID, RName, PhoneNumber, Address, CityID, CityName, R_Email, R_Password, UpdateDate, RLogo, Website, CategoryID, CategoryName, Status FROM vi_Restaurant"></asp:SqlDataSource>
</asp:Content>
