<%@ Page Language="C#" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FoodHouse.Admin.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
            <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RID" Width="858px">
                <Columns>
                    <asp:BoundField DataField="RID" HeaderText="RID" InsertVisible="False" ReadOnly="True" SortExpression="RID" />
                    <asp:BoundField DataField="RName" HeaderText="RName" SortExpression="RName" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="CityID" HeaderText="CityID" SortExpression="CityID" />
                    <asp:BoundField DataField="R_Email" HeaderText="R_Email" SortExpression="R_Email" />
                    <asp:BoundField DataField="R_Password" HeaderText="R_Password" SortExpression="R_Password" />
                    <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" SortExpression="UpdateDate" />
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button  Text='<%#Eval("Status").ToString()%>' CssClass="" ID="btnStaus" CommandArgument='<%# Eval("RID") %>'  OnCommand="btnStaus_Command" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image Width="100" Height="100" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("RLogo")).ToArray()) %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
