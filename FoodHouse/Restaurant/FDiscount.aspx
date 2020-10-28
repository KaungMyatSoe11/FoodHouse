<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="FDiscount.aspx.cs" Inherits="FoodHouse.Restaurant.FDiscount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bg-dark {
        text-align:center;
        font-family:Arial;
        font-size-adjust:inherit;
        font-size:46px;
        padding-top:6%;
        padding-bottom:5%;
        }
        #Label1 {
            text-align:center;
            font-size:20px;
        }
        .btn-outline-danger {
            text-align:center;
            padding-bottom:20px;
            padding-top:30px;
        
        }

        #startDate {
        text-align:center;
        }
        #btnDis {
        
           
            padding-left:20%;
        }
        .flex-shrink-1 {
     padding-left:30%;
        padding-bottom:10px;
        padding-top:20px;
        background-color:aliceblue;
        background:fixed;
        font-family:Arial;
        font-size-adjust:inherit;
        background-image:url("~/Image/panda.jpg");
       

        }
        .bg {
            
            padding-left:30%;
        padding-bottom:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="bg-dark">
      
   
      <asp:Label ID="Label4" runat="server" ForeColor="FloralWhite" CssClass="align-self-sm-auto" Text="You Can Pay Discount For Your Items"></asp:Label>
      </div>
    <div class="flex-shrink-1">
        <center>
        <asp:Label Text="FoodName" CssClass="text-dark font-weight-bolder" ID="lblFoodName" runat="server" />
            </center>
        <br />
            <asp:Label ID="Label1" runat="server" ForeColor="red" Width="200px" Height="30px" Text="Discount(%)***"></asp:Label>
        <asp:DropDownList ID="ddlDIscount" Width="249px" Height="30px" CssClass="dropdown-menu-sm-right" AutoPostBack="false" DataValueField="DiscountID" DataTextField="DiscountPercentage" runat="server"></asp:DropDownList>


    </div>
      
    <div class="bg">
        <asp:Label ID="Label2" ForeColor="Red" CssClass="bs-popover-top" Width="200px" Height="30px"  runat="server" Text="StartDate***"></asp:Label>

   <asp:TextBox ID="txtStartDate"  TextMode="Date" Width="249px" Height="30px" runat="server"></asp:TextBox>

        </div>
        
           
          
       
            <div class="bg">
         <asp:Label ID="Label3" ForeColor="red" Width="200px" Height="30px"  runat="server" Text="EndDate***"></asp:Label>
<asp:TextBox ID="txtEndDate" TextMode="Date" Width="249px" Height="30px" runat="server"></asp:TextBox>

    </div>
    <div class="btn-outline-danger">
            <asp:Button ID="btnDis" runat="server" BackColor="Black" ForeColor="red" Text="ToPayDiscount" OnClick="btnDis_Click" />
       
        </div>
        
</asp:Content>
