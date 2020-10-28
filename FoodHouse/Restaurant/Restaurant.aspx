<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="Restaurant.aspx.cs" Inherits="FoodHouse.Restaurant.Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .entry {
          display: flex;
            margin: 15px;
           
            flex-direction: column;
        }
        .val{
            display:inline;
        }
    </style>
   
   
           
    <div style="width: 100%; height: 80vh;">
        <div style="width: 55%; opacity:0.95;  background-color:whitesmoke; margin: 100px auto; display: flex; flex-direction: column; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); padding: 10px;">

            <div style="margin-top: 10px; opacity: 1; margin-left: auto; width: 165px; margin-right: auto;">
            </div>
            <div class="entry">
                <asp:Label CssClass="form-text" ID="Label1" Text="Restaurant Name " runat="server" />
                <%--<asp:TextBox runat="server" ID="txtAdminName" Width="100%" Height="30" />--%>
                <asp:TextBox runat="server" ID="txtRestaurantName" Width="100%" Height="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtRestaurantName" Display="Dynamic">

                </asp:RequiredFieldValidator>
            </div>
            <div class="entry">
                <asp:Label ID="Label2" Text="Phone Number" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtPhoneNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtPhoneNumber" Width="100%" Height="30" />
            </div>
            <div class="entry">
                <asp:Label ID="Label3" Text="Address" runat="server" />
                <asp:RequiredFieldValidator CssClass="val" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox runat="server" ID="txtAddress" Width="100%" Height="30" />

            </div>

            <div class="entry">
                <asp:Label ID="Label9" Text="City" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtPhoneNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:DropDownList DataTextField="CityName" DataValueField="CityID" ID="ddlCity" runat="server">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDeliverConnectionString %>" SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource>
            </div>
            <div class="entry">
                <asp:Label ID="Label4" Text="Restaurant Email" runat="server" />
                <asp:RequiredFieldValidator CssClass="val" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtRestaurantEmail" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox runat="server" ID="txtRestaurantEmail" Width="100%" Height="30" />

            </div>

            <div class="entry">
                <asp:Label ID="Label5" Text="Restaurant Password" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtPassword" Width="100%" TextMode="Password" Height="30" />
            </div>

            <div class="entry">
                <asp:Label ID="Label6" Text="Update Date" runat="server" />
                <asp:RequiredFieldValidator CssClass="val" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtUpdateDate" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox runat="server" ID="txtUpdateDate" Width="100%" Height="30" />

            </div>
            <div class="entry">
                <asp:Label ID="Label10" Text="Category" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtPhoneNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:DropDownList DataTextField="CategoryName" DataValueField="CategoryID" ID="ddlCategory" runat="server">
                </asp:DropDownList>
            </div>
            <div class="entry">
                <asp:Label ID="Label7" Text="Restaurant Logo" runat="server" />
                <asp:TextBox ID="txtRestaurantLogo" Visible="false" Width="100" AutoComplete="off" runat="server"></asp:TextBox>

                <asp:FileUpload ID="fupLogo" runat="server" />
            </div>


            <div class="entry">
                <asp:Label ID="Label8" Text="Restaurant Website" runat="server" />
                <asp:RequiredFieldValidator CssClass="val" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required*" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtRestaurantWebsite" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox runat="server" ID="txtRestaurantWebsite" Width="100%" Height="30" />

            </div>

            <div style="display: flex; justify-content: space-around;">

                <asp:Button CssClass="btn btn-success w-50" Text="Save" ID="btnSave" runat="server" OnClick="btnSave_Click" />
                &nbsp &nbsp &nbsp
                <%--<asp:Button Text="Cancel" ID="btnCancel" Width="80" Height="30" runat="server" />--%>
                <asp:HyperLink ID="HyperLink1" Text="Cancel" CssClass="btn btn-danger w-50" NavigateUrl="~/Admin/AdminList.aspx" runat="server"></asp:HyperLink>

            </div>
            
            <asp:Label ID="lblerror" runat="server" Text="Label"></asp:Label>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Launch demo modal
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
         
</asp:Content>
