using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Restaurant
{
    public partial class FoodItemList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Response.Redirect("View.aspx? FID=" + e.CommandArgument.ToString());

        }

        protected void LbtView_Command(object sender, CommandEventArgs e)
        {
            Session["FID"] = e.CommandArgument.ToString();
            Response.Redirect("View.aspx");
        }
    }
}