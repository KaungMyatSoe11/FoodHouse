<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminsMasterPage.Master" AutoEventWireup="true" CodeBehind="DeliverMan.aspx.cs" Inherits="FoodHouse.Admin.DeliverMan" %>
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
    <div class="mr-auto ml-auto w-25 bg-light p-2 rounded shadow" style="margin-top: 180px;">

        <div class="entry">
            <asp:Label ID="Label1" runat="server" Text="DeliveryName "></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!!" ControlToValidate="txtDeliveryName" ForeColor="Red" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtDeliveryName"  runat="server" Width="100%" Height="30"></asp:TextBox>
        </div>
        
        <div class="entry">
            
            <asp:Label ID="Label2" runat="server" Text="Phone Number "></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!!" ControlToValidate="txtPhoneNumber" ForeColor="Red" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtPhoneNumber" runat="server" Width="100%" Height="30"></asp:TextBox>
        </div>
        <div class="entry">
            <asp:Label ID="Label3" Text="City" runat="server" />
            <asp:DropDownList DataTextField="CityName" DataValueField="CityID" ID="ddlCity" runat="server"></asp:DropDownList>
        </div>

        <div class="entry">
            <asp:Button CssClass="btn btn-success" Text="Save" ID="btnSave" runat="server" OnClick="btnSave_Click" />
            &nbsp &nbsp &nbsp
            <asp:LinkButton Text="Cancel" ID="LbtCancel" CssClass="btn btn-danger" PostBackUrl="~/Admin/DeliveryManList.aspx" runat="server" />
        </div>

    </div>
</div>
</asp:Content>
