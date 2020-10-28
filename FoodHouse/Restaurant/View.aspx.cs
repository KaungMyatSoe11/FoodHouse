using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodHouse.Controller;

namespace FoodHouse.Restaurant
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

          
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            Session["FID"] = e.CommandArgument.ToString();

            Response.Redirect("FoodEntry.aspx");
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
             FoodItemContoller foodController = new FoodItemContoller();
            string id = e.CommandArgument.ToString();
            if (id != string.Empty)
            {
                foodController.DeleteFood(Convert.ToInt32(id));
            }
        }

        protected void btnDiscount_Command(object sender, CommandEventArgs e)
        {
            Session["FID"] = e.CommandArgument.ToString();
            Response.Redirect("FDiscount.aspx");
        }
    }
}
   