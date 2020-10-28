using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRestaurant_Command(object sender, CommandEventArgs e)
        {
            Session["RID"] = e.CommandArgument.ToString();

            Response.Redirect("~/Customer/CFoodItemList.aspx");
        }
    }
}