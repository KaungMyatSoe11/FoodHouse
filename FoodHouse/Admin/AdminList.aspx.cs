using FoodHouse.Controller;
using System;
using System.Web.UI.WebControls;

namespace FoodHouse.Admin
{
    public partial class AdminList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            AdminController adminController = new AdminController();
            string id = e.CommandArgument.ToString();
           if(id!=string.Empty)
            {
                adminController.DeleteAdmin(Convert.ToInt32(id));
            }

        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            Session["AdminID"] = e.CommandArgument.ToString();

            Response.Redirect("Admin.aspx");

        }
    }
}