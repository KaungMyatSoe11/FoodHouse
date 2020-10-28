<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminsMasterPage.Master" AutoEventWireup="true" CodeBehind="RestaurantList.aspx.cs" Inherits="FoodHouse.Admin.RestaurantList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<iframe width="560" height="315" src="https://www.youtube.com/embed/DnEHl90QwG8?start=1805" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>--%>
       <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <asp:GridView CssClass="table" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="No" HeaderText="No" ReadOnly="True" SortExpression="No" />
                    <asp:BoundField DataField="RID" HeaderText="RID" Visible="false" ReadOnly="True" SortExpression="RID" />
                    <asp:BoundField DataField="RName" HeaderText="RName" SortExpression="RName" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Contanct" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="CityID" Visible="false" HeaderText="CityID" SortExpression="CityID" />
                    <asp:BoundField DataField="CityName" HeaderText="City" SortExpression="CityName" />
                    <asp:BoundField DataField="R_Email" HeaderText="Email" SortExpression="R_Email" />
                    <asp:BoundField DataField="R_Password" Visible="false" HeaderText="R_Password" SortExpression="R_Password" />
                    <asp:BoundField DataField="UpdateDate" HeaderText="Date" SortExpression="UpdateDate" />

                    <%--<asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%#Eval("Website") %>' Text='<%#Eval("Website") %>' runat="server" />  
                   
                </ItemTemplate>
            </asp:TemplateField>--%>
                    <asp:HyperLinkField DataNavigateUrlFields="Website" Target="_blank" DataTextField="Website" NavigateUrl="Website" />
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" Visible="False" />
                    <asp:BoundField DataField="CategoryID" Visible="false" HeaderText="CategoryID" SortExpression="CategoryID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text='<%#Eval("Status").ToString()%>' CommandName="Select" CssClass="" ID="btnStaus" CommandArgument='<%#  Eval("RID")+","+Eval("Status")  %>' OnCommand="btnStaus_Command" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image Width="100" Height="100" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("RLogo")).ToArray()) %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
            <asp:UpdateProgress ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #fff; opacity: 0.95;">
                        <%--<span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; ">Loading ... please wait</span>--%>
                        <div class="spinner-border text-success position-fixed  " style="width:5rem; height:5rem; left: 50%; top: 50%;" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                        </div>
                        
                    
                    
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:SqlDataSource  ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SelectAllResturant"  SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
        </ContentTemplate>
        
    </asp:UpdatePanel>
     
    
   
    </asp:Content>
