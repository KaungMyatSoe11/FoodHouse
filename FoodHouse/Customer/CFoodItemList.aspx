<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="CFoodItemList.aspx.cs" Inherits="FoodHouse.Customer.CFoodItemList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="padding:5% ;">

        <div class="row">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                     <div class="mt-2 mb-2 bg-light" style="width:180px; margin-right:17px;">
                        <asp:ImageButton ID="btnFoodItem" runat="server" CssClass="card-img-top" width="100%" Height="180px" OnCommand="btnFoodItem_Command"  CommandArgument='<%#Eval("FID") %>' ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("Image")).ToArray()) %>'/>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("FID") %>' OnCommand="btnFoodItem_Command"  >
                            <div class="text-center">
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("FoodName") %>'></asp:Label><br />
                                <asp:Label ID="Label4" CssClass="text-muted" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                            </div>
                        </asp:LinkButton>
                    </div>
                    </ItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [vi_CustomerFood] WHERE ([RID] = @RID)">
                <SelectParameters>
                    <asp:SessionParameter Name="RID" SessionField="RID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
