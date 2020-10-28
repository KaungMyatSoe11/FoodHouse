<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="FoodItemList.aspx.cs" Inherits="FoodHouse.Restaurant.FoodItemList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="tbl">
        <tr>
            <td class="tblhead">
                FOOD LIST</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" 
                RepeatDirection="Horizontal" Width="100%" onitemCommand="DataList1_ItemCommand" DataSourceID="SqlDataSource1" >
    <ItemStyle CssClass="igrid" />
    <ItemTemplate>
        <table class="tbl" >
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="Image2" runat="server"  CssClass="img" ImageUrl=<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("Image")).ToArray()) %>  Width="300px" Height="200px"/>
                </td>
            </tr>
            <tr>
                <td>
                                Name :
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("FoodName") %>'></asp:Label>
                </td>
               
            </tr>
            <tr>
                <td>
                                Price :
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LbtView" runat="server" OnCommand="LbtView_Command" CommandArgument='<%#Eval("FID") %>'>View..</asp:LinkButton>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [vi_RFood] WHERE ([RID] = @RID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="RID" SessionField="RID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
  
</asp:Content>
