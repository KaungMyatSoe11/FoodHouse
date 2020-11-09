<%@ Page Title="" Language="C#"  MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="ROrderList.aspx.cs" Inherits="FoodHouse.Restaurant.ROrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:Label Text="" ID="lbldate" Visible="false" runat="server" />

                    <div class="container-fluid d-flex">
                        <div class="col-6">
                            <asp:Button Text="Order Pending" ID="btnOrderPending" OnClick="btnOrderPending_Click" CssClass="btn btn-warning m-1  " runat="server" />
                            <asp:Button Text="Order Preparing" CssClass="btn m-1 btn-secondary" runat="server" ID="btnOrderPreparing" OnClick="btnOrderPreparing_Click" />
                            <asp:Button Text="Deliveried" ID="btnDeliveried" OnClick="btnDeliveried_Click" CssClass="btn m-1 btn-success" runat="server" />
                            <asp:Button Text="Order Not available" ID="btnOrderNotAvailable" OnClick="btnOrderNotAvailable_Click" CssClass="btn m-1 btn-danger" runat="server" />

                        </div>

                        <div class="col-6 ">
                            <asp:TextBox runat="server" CssClass="float-right m-1 form-control " Width="30%" TextMode="Date" ID="dtpDate" />

                        </div>
                    </div>

                    <table class="table  bg-light">
                        <tr>

                            <th runat="server">ONumber</th>
                            <th runat="server">CustomerID</th>
                            <th runat="server">CustomerName</th>
                            <th runat="server">ODate</th>
                            <th runat="server">DeliveryManID</th>
                            <th runat="server">Status</th>
                            <th runat="server">GrandTotal</th>
                        </tr>

                        <asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" runat="server">

                            <ItemTemplate>
                                <tr style="">

                                    <td>
                                        <asp:Label ID="ONumberLabel" runat="server" Text='<%# Eval("ONumber") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ODateLabel" runat="server" Text='<%# Eval("ODate") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="DeliveryManIDLabel" runat="server" Text='<%# Eval("DeliveryManID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="GrandTotalLabel" runat="server" Text='<%# Eval("GrandTotal") %>' />
                                    </td>
                                    <td>
                                        <asp:Button Text="View" CssClass="btn btn-success rounded-pill" ID="btnView" OnCommand="btnView_Command" CommandArgument='<%# Eval("OID") %>' runat="server" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No Order</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </table>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [vi_Order] WHERE ([ODate] = @ODate)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="dtpDate" DefaultValue="" Name="ODate" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>

                <asp:View ID="View2"  runat="server">
                    <asp:GridView ID="GridView1" CssClass="table bg-light col-8" runat="server" AutoGenerateColumns="False">
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
                            <%--<asp:BoundField DataField="GrandTotal" HeaderText="GrandTotal" SortExpression="GrandTotal" />--%>
                        </Columns>
                    </asp:GridView>
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

            <asp:TextBox Enabled="false" runat="server" placeholder="Shipping Address" ID="txtShippingAddress" TextMode="MultiLine" Height="100" CssClass="w-100 form-control rounded" />
            <%--                <asp:CheckBox Text="Your Address"  runat="server" />--%>
        </div>

        <asp:Button Text="Check Out" OnClick="btnCheckOut_Click" CssClass="btn btn-success mt-5" runat="server" ID="btnCheckOut" />
    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
           


</asp:Content>
