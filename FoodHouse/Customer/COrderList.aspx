<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="COrderList.aspx.cs" Inherits="FoodHouse.Customer.COrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" OnItemDataBound="Repeater1_ItemDataBound" runat="server">
       
        <ItemTemplate>
            <div class="d-flex flex-column w-75 m-2  " >
                <div class="m-1">
                    <asp:Label Text="Order Number : " runat="server" />
                    <asp:Label Text='<%#Eval("ONumber") %>' ID="lblONumber" runat="server" />
                </div>
               

                
                <div class="m-1">
                    <asp:Label Text="Order Date: " runat="server" />
                    <asp:Label ID="lblODate" Text='<%#Eval("ODate") %>' runat="server" />
                </div>
                <div class="m-1"  >
                    <asp:Label Text="Total Price: " runat="server" />
                    <asp:Label ID="lblTotalPrice"  Text='<%#Eval("GrandTotal") %>' runat="server" />
                </div>

            </div>

            <asp:GridView ID="GridView1"  CssClass="table-responsive-lg w-75 mr-auto ml-auto table table-hover" AutoGenerateColumns="false"  runat="server">
               <Columns>
                   <%--<asp:BoundField HeaderText="No" DataField='<%#Eval("No") %>' />--%>
                   <asp:BoundField HeaderText="FoodName" DataField="FoodName" />
                   <asp:BoundField HeaderText="Price" DataField="Price" />
                   <asp:BoundField HeaderText="DiscountPercentage" DataField="DiscountPercentage" />
                   <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                   <asp:BoundField HeaderText="Status" DataField="Status"/>
               </Columns>
            </asp:GridView>
            <hr />
            
        </ItemTemplate>
       
    </asp:Repeater>
    
   

</asp:Content>
