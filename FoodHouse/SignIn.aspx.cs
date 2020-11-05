using FoodHouse.Controller;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse
{
   
    public partial class SignIn : System.Web.UI.Page
    {
        string email, password;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            DbContextDataContext db = new DbContextDataContext();
            RestaurantController restaurantController = new RestaurantController();
            CustomerController customerController = new CustomerController();
            AdminController adminController = new AdminController();
            email = txtEmail.Text.Trim().ToString();
            password = txtPassword.Text.Trim().ToString();
            if(customerController.CustomerLogIn(email,password))
            {
                var id = db.CustomerLogIn(email, password).FirstOrDefault();
                Session["CID"] = id.CustomerID.ToString();
                Response.Redirect("Default.aspx");
            }
            else if(adminController.AdminLogin(email,password))
            {
               
                var id = db.AdminLogIn(email, password).FirstOrDefault();
                Session["AID"] = id.AdminID.ToString();
                Response.Redirect("~/Admin/AdminList.aspx");
            }
            else if (restaurantController.RestaurantLogIn(email, password))
            {

                var id = db.RestaurantLogIn(email, password).FirstOrDefault();
                Session["RID"] = id.RID.ToString();
                Response.Redirect("~/Restaurant/FoodItemList.aspx");
            }
            else
            {
                lblError.Visible = true;
            }
        }
    }
}