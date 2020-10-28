<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminsMasterPage.Master" AutoEventWireup="true" CodeBehind="DeliveryManList.aspx.cs" Inherits="FoodHouse.Admin.DeliveryManList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LinkButton ID="LinkButton1" Text="Add Delivery" PostBackUrl="~/Admin/DeliverMan.aspx" runat="server"></asp:LinkButton>
    <hr />
    <center>
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DeliveryManID" DataSourceID="SqlDataSource1" Width="341px">
            <Columns>
                <asp:BoundField DataField="No" HeaderText="No" ReadOnly="True" SortExpression="No" />
                <asp:BoundField DataField="DeliveryManID" HeaderText="DeliveryManID" ReadOnly="True" SortExpression="DeliveryManID" Visible="False" />
                <asp:BoundField DataField="DeliveryName" HeaderText="DeliveryName" SortExpression="DeliveryName" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="CityID" HeaderText="CityID" SortExpression="CityID" Visible="False" />
                <asp:BoundField DataField="CityName" HeaderText="City" SortExpression="CityName" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" OnCommand="btnEdit_Command" CommandArgument='<%#Eval("DeliveryManID")%>'></asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnCommand="btnDelete_Command" CommandArgument='<%#Eval("DeliveryManID")%>'>
                    </asp:LinkButton>

                    </ItemTemplate>
                    </asp:TemplateField>

            </Columns>
       </asp:GridView>
      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT Row_Number() OVER (ORDER BY DeliveryName) AS No,* FROM vi_DeliveryMan ORDER BY DeliveryName" DeleteCommand="Delete_DeliveryMan" DeleteCommandType="StoredProcedure" ></asp:SqlDataSource>
    

    </center>
</asp:Content>
