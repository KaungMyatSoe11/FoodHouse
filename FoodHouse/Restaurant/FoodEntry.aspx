<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="FoodEntry.aspx.cs" Inherits="FoodHouse.Restaurant.FoodEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <style>
        .a {
            padding-left:20px;
            padding-top:20px;
        }
        
        .entry {
          
    margin: 15px;
    flex-direction: column;
        }
    </style>
    
    <div class="container-fluid">
     <div   class="mr-auto ml-auto w-25 bg-light p-2 rounded shadow" style="margin-top:200px;">
          
    <div class="entry">
        <asp:Label ID="Label1" runat="server" Text="FoodName "></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!!" ControlToValidate="txtfoodname" ForeColor="Red"  SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtfoodname" runat="server" Width="100%" Height="30"></asp:TextBox>
    </div>

 

     <div class="entry">
                <asp:Label ID="Label2" Text="Price " runat="server" />
             <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice" MaximumValue="50000" MinimumValue="1000" ErrorMessage="RangeErrorMessage" Display="Dynamic"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required*"  SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtPrice" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtPrice" Width="100%"  Height="30" />
            </div>
        <div class="entry">
                 <asp:Label ID="Label7" Text="Image" runat="server" />
                 <asp:FileUpload ID="FileUploadImage" runat="server"  />
          </div>
         <div class="entry">
                <asp:CheckBox Text="Available" runat="server" ID="chkStuatus" />
            </div>
         <%--<div class="entry">
                <asp:Label ID="Label10" Text="DiscountID " runat="server" />
                <asp:RequiredFieldValidator CssClass="val" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required*"  SetFocusOnError="true" ForeColor="Red" ControlToValidate="ddlDiscount" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:DropDownList DataTextField="DiscountPercentage" DataValueField="DiscountID" ID="ddlDiscount" runat="server"></asp:DropDownList>
            </div>--%>

 

        <div class="entry">
                <asp:Button CssClass="btn btn-success" Text="Save" ID="btnSave" runat="server" OnClick="btnSave_Click" /> 
                <%--<asp:Button CssClass="btn btn-danger" Text="Cancel"  ID="btnCancel" runat="server"   /> --%>
                <asp:LinkButton Text="Cancel" ID="LbtCancel" CssClass="btn btn-danger" PostBackUrl="~/Restaurant/FoodItemList.aspx" runat="server" />
        </div>

        <%--<div class="entry">
                <asp:Label ID="Label5" Text="DisEndDate :" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required*"  SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtEnd" Display="Dynamic" Minnimun="1000" Maximum="10000"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtEnd" Width="100%"  Height="30" />
            </div>--%>
               
            </div>
        </div>
</asp:Content>
