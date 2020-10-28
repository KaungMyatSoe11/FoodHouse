<%@ Page Title="Admin List" Language="C#" MasterPageFile="~/Admin/AdminsMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminList.aspx.cs" Inherits="FoodHouse.Admin.AdminList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .context{
                display: flex;
                flex-direction: row;
                margin:40px ;
        }
    </style>
    <%--<asp:Button Width="100" Height="50"   OnClick="btnCreate_Click" Text="Create Admin" ID="btnCreate" runat="server" />--%>
    <asp:LinkButton  Width="100" Height="50" PostBackUrl="~/Admin/Admin.aspx"  Text="Create Admin" ID="btnCreate" runat="server" />
           <br />
           <hr  />
    <div class="context">
           <asp:ListView ID="ListView1"   runat="server" DataSourceID="SqlDataSource1">
               <ItemTemplate>
                   <div style="border:1px solid black; width:200px; margin:15px; padding:10px;">
               <div>
                   <asp:Image ID="Image1" ImageUrl="~/Image/administrator.png" Width="150" Height="150" runat="server" /><br />
                   <br />
                   <div style="display: flex; flex-direction: row; justify-content: space-between;">
              
                   <asp:Label ID="Label4" Text='<%#Eval("No") %>'  runat="server" />
          
                   <asp:Label Text='<%#Eval("AdminName") %>'  align="right" runat="server" />
                     </div>
               </div>
                        <br />
               <div>
                   <asp:Button Text="Edit" runat="server" CommandName="Edit" CommandArgument='<%#Eval("AdminID")%>' OnCommand="btnEdit_Command" ID="btnEdit" />
                   <asp:Button Text="Delete" ID="btnDelete" CommandName="Delete" OnCommand="btnDelete_Command" CommandArgument='<%#Eval("AdminID")%>'  runat="server" />
               </div>
           </div>
               </ItemTemplate>
               
           </asp:ListView>
        
        </div>
         
        <hr />
    <center>
          <asp:DataPager  ID="DataPager1"  runat="server" PageSize="5" PagedControlID="ListView1">
        <Fields>
            <asp:NextPreviousPagerField ButtonCssClass="page-item page-link d-inline" ButtonType="Link" PreviousPageText="Previous" ShowPreviousPageButton="true" ShowNextPageButton="false"  />
            <asp:NumericPagerField NumericButtonCssClass="page-item page-link d-inline" ButtonType="Link"  />
            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="page-item page-link d-inline" ShowNextPageButton="true" NextPageText="Next" ShowPreviousPageButton="false" />
        </Fields>
    </asp:DataPager>
        </center>
          <%-- <div style="border:1px solid black; width:200px; padding:10px; margin:10px;">
               <div>
                   <asp:Image ImageUrl="~/Image/administrator.png" Width="150" Height="150" runat="server" /><br />
                   <br />
                   <br />
               </div>
               <div>
                   <asp:Button Text="Edit" runat="server" ID="btnEdit" />
                   <asp:Button Text="Delete" ID="btnDelete" runat="server" />
               </div>
           </div>--%>
          <%-- <div >
               <center/>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AdminID" DataSourceID="SqlDataSource1">
               <Columns>
                   <asp:BoundField DataField="No" HeaderText="No" ReadOnly="True" SortExpression="No" />
                   <asp:BoundField DataField="AdminID" HeaderText="AdminID" InsertVisible="False" ReadOnly="True" SortExpression="AdminID" />
                   <asp:BoundField DataField="AdminName" HeaderText="AdminName" SortExpression="AdminName" />
                   <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                   <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" SortExpression="UpdateDate" />
               </Columns>
           </asp:GridView>
               </div>--%>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="Select Row_Number()Over(Order By AdminName) As No , * From Admin Order By AdminName" DeleteCommand="SP_DeleteAdmin" DeleteCommandType="StoredProcedure" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
