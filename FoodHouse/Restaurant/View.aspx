<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="FoodHouse.Restaurant.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:GridView ID="GridView1" CssClass="mt-lg-5" runat="server" AutoGenerateColumns="False" DataKeyNames="FID" DataSourceID="SqlDataSource1" Width="1124px">
        <Columns>
            
            <asp:BoundField DataField="FID" HeaderText="FID" InsertVisible="False" ReadOnly="True" SortExpression="FID" Visible="False" />
            <asp:BoundField DataField="RID" HeaderText="RID" SortExpression="RID" Visible="False" />
            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="DiscountID" HeaderText="DiscountID" SortExpression="DiscountID" Visible="False" />
            <%--<asp:BoundField DataField="DiscountPercentage" HeaderText="Percentage"  Visible="True" />--%>
            <asp:BoundField DataField="DisStartDate" HeaderText="DisStartDate" SortExpression="DisStartDate" />
            <asp:BoundField DataField="DisEndDate" HeaderText="DisEndDate" SortExpression="DisEndDate" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
             <asp:TemplateField>
            <ItemTemplate>
                <asp:Image ID="Image2" Width="100" Height="100" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("Image")).ToArray()) %>' runat="server" />
                </ItemTemplate>
                 </asp:TemplateField>

            <asp:TemplateField HeaderText="" >
                                        <ItemTemplate>
                                          
                                            <asp:LinkButton ID="btnDiscount" runat="server" CommandArgument='<%#Eval("FID") %>' OnCommand="btnDiscount_Command" Text="Discount" >
                                            </asp:LinkButton>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit"  OnCommand="btnEdit_Command"  CommandArgument='<%#Eval("FID")%>'>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnCommand="btnDelete_Command" CommandArgument='<%#Eval("FID")%>' >
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
        </Columns>

    </asp:GridView>
        </center>
    <asp:LinkButton Text="Back" ID="btnBack" CssClass="btn-secondary" PostBackUrl="~/Restaurant/FoodItemList.aspx" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [vi_RFood] WHERE ([FID] = @FID)">
        <SelectParameters>
            <asp:SessionParameter Name="FID" SessionField="FID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

