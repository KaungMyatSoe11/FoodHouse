using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Customer
{
    public partial class CFoodItemList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFoodItem_Command(object sender, CommandEventArgs e)
        {
            Session["FID"] = e.CommandArgument.ToString();

            Response.Redirect("Order.aspx");
        }
    }
}