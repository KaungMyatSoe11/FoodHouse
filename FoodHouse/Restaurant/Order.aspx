<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/RestaurantMasterPage.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FoodHouse.Restaurant.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-5 pb-5">
    
    <div class="row">
        <%-- card start --%>
      <div class="col-sm-6">
        <div class="card">
          <div class="card-body">
              <div class="card-title">
            <b><asp:Label ID="Label3" runat="server" Text="OrderID"></asp:Label></b><br />
            Client-<asp:Label ID="Label4" runat="server" Text="UserEmail"></asp:Label>
                  </div>
            <div class="card-text">
                <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>FoodName</th>
                        <th>Qty</th>
                          <th>Price</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
                          <td>
                            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></td>
                      </tr>
                    </tbody>
                  </table>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Comfirm" CssClass="btn btn-primary" />
          </div>
        </div>
      </div>
        <%-- end --%>
        <div class="col-sm-6">
        <div class="card">
          <div class="card-body">
              <div class="card-title">
            <b><asp:Label ID="Label1" runat="server" Text="OrderID"></asp:Label></b><br />
            Client-<asp:Label ID="Label2" runat="server" Text="UserEmail"></asp:Label>
                  </div>
            <div class="card-text">
                <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>FoodName</th>
                        <th>Qty</th>
                          <th>Price</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                          <td>
                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>

 

                      </tr>
                    </tbody>
                  </table>
            </div>
            <asp:Button ID="Button2" runat="server" Text="Comfirm" CssClass="btn btn-primary" />
          </div>
        </div>
      </div>

 

    </div>
    </div>
</asp:Content>
