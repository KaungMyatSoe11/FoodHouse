<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="COrderList.aspx.cs" Inherits="FoodHouse.Customer.COrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" OnItemDataBound="Repeater1_ItemDataBound" runat="server">
       
        <ItemTemplate>
            <div>
                <asp:Label Text="Order Number : " runat="server" />
                <asp:Label Text='<%#Eval("ONumber") %>' ID="lblONumber" runat="server" />

                <div style="float: right;">
                    <asp:Label Text="Order Date: " runat="server" />
                    <asp:Label ID="lblODate" Text='<%#Eval("ODate") %>' runat="server" />
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
            <%--<asp:Table ID="Table1"    runat="server">
                <asp:TableHeaderRow>
                    
                    <asp:TableHeaderCell>No</asp:TableHeaderCell>
                    <asp:TableHeaderCell>FoodName</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                    <asp:TableHeaderCell>DiscountPercentage</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell><%#Eval("No") %></asp:TableCell>
                    <asp:TableCell><%#Eval("FoodName") %></asp:TableCell>
                    <asp:TableCell><%#Eval("Price") %></asp:TableCell>
                    <asp:TableCell><%#Eval("DiscountPercentage") %></asp:TableCell>
                    <asp:TableCell><%#Eval("Quantity") %></asp:TableCell>
                    <asp:TableCell><%#Eval("Status") %></asp:TableCell>
                </asp:TableRow>
                
            </asp:Table>--%>
        </ItemTemplate>
       
    </asp:Repeater>
    
    <div>
        <asp:Label Text="Order Number : " runat="server" />
        <asp:Label Text="00000001 " runat="server" />

        <div style="float:right;">
            <asp:Label Text="Order Date: " runat="server" />
            <asp:Label Text="11/3/2020" runat="server" />
        </div>

    </div>


    <table class="table-responsive-xl table table-hover ">
       <tr >
           <th >NO</th>
           <th >FoodName</th>
           <th >Qty</th>
           <th >Price</th>
           <th >Discount Price</th>
           <th >GrandTotal</th>
           <th >Status</th>
       </tr>
        <tr>
            <td>1</td>
            <td>Item1</td>
            <td>3</td>
            <td>3000</td>
            <td>1500</td>
            <td>1500</td>
            <td><span style="color:red;">Order Pending</span></td>
        </tr>
    </table>

    

</asp:Content>
