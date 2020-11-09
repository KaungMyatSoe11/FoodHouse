<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="Discount.aspx.cs" Inherits="FoodHouse.Restaurant.Discount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <style>
        .entry {
          margin: 15px;
          
        }
        .linkbtn {
           
            text-decoration:none;
            background-color:gray;
            color:black;
          
            text-align:center;
        height: 22px;
    }
    </style>

    <div class="entry" style="margin-top:150px;" align="center">
                <asp:Label ID="Label1" Text="Discount Percentage: " runat="server" Width="200px" />
                <asp:TextBox runat="server" ID="txtDiscount"  Width="300px"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"  ControlToValidate="txtDiscount"></asp:RequiredFieldValidator>
           
         <asp:LinkButton ID="btnAdd" runat="server" CssClass=" btn btn-primary" Width="80px" OnClick="btnAdd_Click"   >Add</asp:LinkButton>

         <asp:Label ID="lblerror" runat="server" Text="" ForeColor="Red"></asp:Label>
          </div>
     <hr />
    <div>
        <center>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DiscountID" DataSourceID="SqlDataSource2" Width="555px">
         <Columns>
             <asp:BoundField DataField="No" HeaderText="No" ReadOnly="True" SortExpression="No" />
             <asp:BoundField DataField="DiscountID" HeaderText="DiscountID" InsertVisible="False" ReadOnly="True" SortExpression="DiscountID" />
             <asp:BoundField DataField="DiscountPercentage" HeaderText="DiscountPercentage" SortExpression="DiscountPercentage" />

             <asp:TemplateField HeaderText="" >
                <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" OnCommand="btnEdit_Command"  CommandArgument='<%#Eval("DiscountID")%>' CausesValidation="False">
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnCommand="btnDelete_Command" CommandArgument='<%#Eval("DiscountID")%>' CausesValidation="False">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
         </Columns>
</asp:GridView>
            
        </center>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="	SELECT Row_Number()OVER(ORDER BY DiscountPercentage)AS No, * FROM Discount ORDER BY DiscountPercentage
"
            DeleteCommand="Delete From Discount Where DiscountID=@DiscountID
">
            <DeleteParameters>
                <asp:Parameter Name="DiscountID" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    
</asp:Content>
  
