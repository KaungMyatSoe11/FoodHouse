<%@ Page Title="" Language="C#"  MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="ROrderList.aspx.cs" Inherits="FoodHouse.Restaurant.ROrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:Label Text="" ID="lbldate" Visible="false" runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <div class="container-fluid d-flex">
        <div class="col-6">
        <asp:Button Text="Order Pending" CssClass="btn btn-warning m-1  " runat="server" />
        <asp:Button Text="Order Preparing" CssClass="btn m-1 btn-secondary" runat="server" ID="btnOrderPreparing" OnClick="btnOrderPreparing_Click" />
        <asp:Button Text="Deliveried" CssClass="btn m-1 btn-success" runat="server" />
        <asp:Button Text="Order Not available" CssClass="btn m-1 btn-danger" runat="server" />

        </div>

        <div class="col-6 ">
            <asp:TextBox runat="server" CssClass="float-right m-1 form-control " Width="30%" TextMode="Date" ID="dtpDate"  />

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
            
            <asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound"  runat="server" >
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
            </asp:ListView>
        </table>
            </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [vi_Order] WHERE ([ODate] = @ODate)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dtpDate" DefaultValue="" Name="ODate" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
           
        <%--<asp:ListView  ID="ListView1" ItemPlaceholderID="itemPlaceholder"   runat="server" DataKeyNames="OID" >
            <%--<AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="OIDLabel" runat="server" Text='<%# Eval("OID") %>' />
                    </td>
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
                </tr>
            </AlternatingItemTemplate>--%>
            
            <%--<EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No Order</td>
                    </tr>
                </table>
            </EmptyDataTemplate>--%>
            
            <%--<ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="OIDLabel" runat="server" Text='<%# Eval("OID") %>' />
                    </td>
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
                </tr>
            </ItemTemplate>--%>
           <%-- <LayoutTemplate>
                <table runat="server" >
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table table-hover bg-light" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">OID</th>
                                    <th runat="server">ONumber</th>
                                    <th runat="server">CustomerID</th>
                                    <th runat="server">CustomerName</th>
                                    <th runat="server">ODate</th>
                                    <th runat="server">DeliveryManID</th>
                                    <th runat="server">Status</th>
                                    <th runat="server">GrandTotal</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                   <tr>
                       <td>
                           
                       </td>
                   </tr>
                </table>
            </LayoutTemplate>--%>
            <%--<SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="OIDLabel" runat="server" Text='<%# Eval("OID") %>' />
                    </td>
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
                </tr>
            </SelectedItemTemplate>
           
        </asp:ListView>--%>
   
   
            
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [vi_Order] WHERE ([ODate] = @ODate) ORDER BY [OID]">
            <SelectParameters>
                <asp:ControlParameter ControlID="dtpDate" Name="ODate" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        --%>

</asp:Content>
