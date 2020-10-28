<%@ Page EnableEventValidation="true" Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FoodHouse.Customer.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container-fluid">
                <style>
                    .P_lbl {
                        padding-left: 100px;
                        margin-left: 30px;
                    }

                    .price {
                        position: absolute;
                        top: 32px;
                        left: 410px;
                    }
                </style>

                <asp:ListView ID="ListView1" DataKeyNames="FID" OnItemCommand="ListView1_ItemCommand" runat="server">
                    <ItemTemplate>
                        <div class="d-flex flex-row align-items-center position-relative col-lg-9 bg-primary mt-1 rounded shadow-sm w-100 ">
                            <div class="col-8 p-2 w-auto">
                                <asp:Image ImageUrl='<%# Eval("Image") %>' Width="80" Height="80" runat="server" />

                                <asp:Label Text='<%#Eval("FoodName")%>' CssClass=" P_lbl " runat="server" />


                                <asp:Label Text='<%#Eval("Price") %>' CssClass="text-muted  price " runat="server" />


                            </div>
                            <div class=" btn-group col-4 w-100 align-items-center">

                                <asp:Button Text="-" CommandName="Sub" CommandArgument='<%#Eval("FID") %>' ID="btnsubqty" Width="40" CssClass="btn text-center btn-light font-weight-bold " runat="server" />
                                <asp:TextBox Text='<%#Eval("Qty") %>' Width="50" ID="txtQty" CssClass="text-center input-group-text d-inline ml-1 btn  " runat="server" />
                                <asp:Button Text="+" ID="btnaddqty" CommandName="Add" CommandArgument='<%#Eval("FID") %>' CssClass="btn btn-light text-center ml-1 font-weight-bold  " Width="40" runat="server" />

                                <asp:Button Text="Delete" CssClass="btn btn-danger m-2" CommandArgument='<%#Eval("FID") %>' runat="server" CommandName="Delete" />

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #fff; opacity: 0.95;">
                            <%--<span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; ">Loading ... please wait</span>--%>
                            <div class="spinner-border text-success position-fixed  " style="width: 5rem; height: 5rem; left: 50%; top: 50%;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>



                    </ProgressTemplate>
                </asp:UpdateProgress>



                <%--<div class="d-flex flex-row align-items-center justify-content-around col-lg-8 bg-primary mt-1 rounded shadow-sm w-100 ">
                    <div class="col-8 p-2 w-auto">
                        <asp:Image ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("Image")).ToArray()) %>' Width="80" Height="80" runat="server" />

                        <asp:Label Text="<%#Eval("FName")%>" CssClass="col-form-label-lg P_lbl ml-lg-5" runat="server" />


                        <asp:Label Text="<%#Eval("Price") %>" CssClass="text-muted P_lbl " runat="server" />


                    </div>
                    <div class=" btn-group col-4 w-100">
                     

                                <asp:Button Text="-" CommandArgument="<%#Eval("FID") %>" ID="btnsubqty" Width="40" CssClass="btn text-center btn-light font-weight-bold " runat="server" />
                                <asp:TextBox Text="1" Width="50" ID="txtQty" CssClass="text-center input-group-text d-inline ml-1 btn  " runat="server" />
                                <asp:Button Text="+" ID="btnaddqty" CommandArgument="<%#Eval("FID") %>" CssClass="btn btn-light text-center ml-1 font-weight-bold  " Width="40" runat="server" />
                                <asp:Button Text="Delete" CssClass="btn btn-danger m-2" CommandArgument="<%#Eval("FID") %>" runat="server" />
                            
                    </div>
                </div>--%>
                <%--<div class="d-flex flex-row align-items-center justify-content-around col-lg-8 bg-primary mt-1 rounded shadow-sm w-100 ">
            <div class="col-8 p-2 w-auto">
                <asp:Image ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String(((byte[]) Eval("Image")).ToArray()) %>' Width="80" Height="80" runat="server" />
              
                    <asp:Label Text="<%#Eval("FName")%>" CssClass="col-form-label-lg P_lbl ml-lg-5" runat="server" />
                  
                
                  <asp:Label Text="<%#Eval("Price") %>" CssClass="text-muted P_lbl " runat="server" />
                
                
            </div>
            <div class=" btn-group col-4 w-100">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <asp:Button Text="-" CommandArgument="<%#Eval("FID") %>" ID="btnsubqty" Width="40" CssClass="btn text-center btn-light font-weight-bold " runat="server" />
                        <asp:TextBox Text="1" Width="50" ID="txtQty" CssClass="text-center input-group-text d-inline ml-1 btn  " runat="server" />
                        <asp:Button Text="+" ID="btnaddqty" CommandArgument="<%#Eval("FID") %>" CssClass="btn btn-light text-center ml-1 font-weight-bold  " Width="40" runat="server" />
                        <asp:Button Text="Delete" CssClass="btn btn-danger m-2" CommandArgument="<%#Eval("FID") %>" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


            
        </div>--%>

                <div class="col-3 w-100 bg-info d-flex flex-column  position-fixed m-1 p-2 rounded" style="height: 83vh; right: 1px; top: 95px;">
                    <div class="w-100 mt-3  bg-light">
                        <asp:Label Text="SubTotal :" CssClass="col-6 text-right float-lg-left" runat="server" />
                        <asp:Label ID="lblSubtotal" Text="" runat="server" CssClass="col-6 text-right float-lg-right pr-5" />
                    </div>

                    <div class="w-100  mt-5 bg-light">
                        <asp:Label Text="Tax :" CssClass="col-6 text-right  float-lg-left" runat="server" />
                        <asp:Label Text="300" ID="lblTax" runat="server" CssClass="col-6 text-right  float-lg-right pr-5" />
                    </div>

                    <div class="w-100  mt-5 bg-light">
                        <asp:Label Text="Discount :" CssClass="col-6 text-right  float-lg-left" runat="server" />
                        <asp:Label Text="-30" ID="lblDiscount" runat="server" CssClass="col-6 text-right  float-lg-right pr-5" />
                    </div>

                    <div class="w-100  mt-5  bg-light">
                        <asp:Label Text="Total :" CssClass="col-6 text-right  float-lg-left" runat="server" />
                        <asp:Label Text="3940" ID="lblGrandtotal" runat="server" CssClass="col-6 text-right  float-lg-right pr-5" />
                    </div>
                    <div class="bg-light w-auto mt-1" style="height: 0.1vh;">
                    </div>
                    <div class="w-100  mt-5  ">

                        <asp:TextBox runat="server" placeholder="Shipping Address" ID="txtShippingAddress" TextMode="MultiLine" Height="100" CssClass="w-100 form-control rounded" />
                        <%--                <asp:CheckBox Text="Your Address"  runat="server" />--%>
                    </div>

                    <asp:Button Text="Check Out" CssClass="btn btn-success mt-5" runat="server" ID="btnCheckOut" OnClick="btnCheckOut_Click" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
