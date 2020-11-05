<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="FoodHouse.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container-fluid" style="padding-top:10%;">
        <div class="mr-auto ml-auto shadow p-3 bg-light rounded-sm" style="width:30%;  opacity:0.95; height:fit-content; ">
            
            <center >
                <div  class="bg-light rounded-circle p-3 border border-dark" style="width:fit-content;">
                <center/>
                <svg height="512pt"  style="height:90px; width:90px;"  viewBox="0 -32 512.016 512" class="m-auto" width="512pt" xmlns="http://www.w3.org/2000/svg"><path d="m192 213.339844c-58.816406 0-106.667969-47.847656-106.667969-106.664063 0-58.816406 47.851563-106.6679685 106.667969-106.6679685s106.667969 47.8515625 106.667969 106.6679685c0 58.816407-47.851563 106.664063-106.667969 106.664063zm0-181.332032c-41.171875 0-74.667969 33.492188-74.667969 74.667969 0 41.171875 33.496094 74.664063 74.667969 74.664063s74.667969-33.492188 74.667969-74.664063c0-41.175781-33.496094-74.667969-74.667969-74.667969zm0 0"/><path d="m368 448.007812h-352c-8.832031 0-16-7.167968-16-16v-74.667968c0-55.871094 45.460938-101.332032 101.332031-101.332032h181.335938c55.871093 0 101.332031 45.460938 101.332031 101.332032v74.667968c0 8.832032-7.167969 16-16 16zm-336-32h320v-58.667968c0-38.226563-31.105469-69.332032-69.332031-69.332032h-181.335938c-38.226562 0-69.332031 31.105469-69.332031 69.332032zm0 0"/><path d="m496 218.675781h-181.332031c-8.832031 0-16-7.167969-16-16s7.167969-16 16-16h181.332031c8.832031 0 16 7.167969 16 16s-7.167969 16-16 16zm0 0"/><path d="m410.667969 304.007812c-4.097657 0-8.191407-1.558593-11.308594-4.691406-6.25-6.253906-6.25-16.386718 0-22.636718l74.027344-74.027344-74.027344-74.027344c-6.25-6.25-6.25-16.382812 0-22.632812s16.382813-6.25 22.636719 0l85.332031 85.332031c6.25 6.25 6.25 16.386719 0 22.636719l-85.332031 85.332031c-3.136719 3.15625-7.234375 4.714843-11.328125 4.714843zm0 0"/></svg>
                    
                </div>
            </center>
            
            <div class="w-100 p-2  d-flex flex-column justify-content-around">

                <div class="form-group w-100 ">
                    <asp:Label Text="Email" runat="server" />
                   
                    <asp:TextBox runat="server" ID="txtEmail"  CssClass="form-control w-100 " AutoCompleteType="None" required TabIndex="1" />
                </div>

                <div class="form-group  w-100  ">
                    <asp:Label Text="Password" runat="server" CssClass="font-weight-lighter " />
                    
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"  CssClass="form-control w-100   " AutoCompleteType="Disabled" required TabIndex="2" />
                    <span><asp:Label Text="Check your Email and Password!" CssClass="text-danger m-0 p-0" Font-Size="10" ID="lblError" Visible="false" runat="server" /></span>
                </div>
                
            </div>
          

            <div class="form-group w-75 d-flex flex-column ml-auto mr-auto  ">
                <asp:Button Text="Sign In"  CssClass="btn btn-primary w-75 mr-auto ml-auto " runat="server" ID="btnSignIn"  TabIndex="3" OnClick="btnSignIn_Click" />
                <span class="text-muted ml-auto mr-auto mt-1"  >
                 Don't have an account?
                <asp:LinkButton PostBackUrl="~/Customer/SignUp.aspx" CssClass="btn-link" Text="Sign Up" runat="server" TabIndex="4" />
                </span>
                
                 <span class="text-muted ml-auto mr-auto mt-1"  >
                <asp:LinkButton PostBackUrl="~/Restaurant/Restaurant.aspx" CssClass="btn-link" Text="Restaurant Register" runat="server" TabIndex="4" />
                </span>
            </div>
        </div>
    </div>

</asp:Content>
