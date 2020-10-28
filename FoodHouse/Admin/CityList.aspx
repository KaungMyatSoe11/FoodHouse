<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminsMasterPage.Master" AutoEventWireup="true" CodeBehind="CityList.aspx.cs" Inherits="FoodHouse.Admin.CityList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LinkButton Text="Add City" PostBackUrl="~/Admin/City.aspx" runat="server" />
    <hr />
    <center>
        <asp:GridView ID="GridView1" EnableedPaging="True"  runat="server" AutoGenerateColumns="False" DataKeyNames="CityID" DataSourceID="SqlDataSource1" PageSize="5" AllowPaging="True">
            <Columns>
                <asp:BoundField  DataField="No" HeaderText="No" ReadOnly="True" SortExpression="No" />
                <asp:BoundField DataField="CityID" HeaderText="CityID" ReadOnly="True" SortExpression="CityID" Visible="False" />
                <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:button text="Edit" runat="server" />
                        <asp:button text="Delete" runat="server" />
                    </ItemTemplate>
                    
                </asp:TemplateField>
                
            </Columns>
            <PagerSettings PageButtonCount="5" Position="TopAndBottom" />
            <PagerStyle BorderStyle="None" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT Row_Number() OVER (ORDER BY CityName) AS No, * FROM City ORDER BY CityName"></asp:SqlDataSource>
    </center>
</asp:Content>
