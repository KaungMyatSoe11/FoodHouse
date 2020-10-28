using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodHouse.Controller;

namespace FoodHouse.Admin
{
    public partial class DeliveryManList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            Session["DeliveryManID"] = e.CommandArgument.ToString();

            Response.Redirect("DeliverMan.aspx");
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            DeliveryManController deliveryManController   = new DeliveryManController();
            string id = e.CommandArgument.ToString();
            if (id != string.Empty)
            {
                deliveryManController.DeleteDeliveryMan(Convert.ToInt32(id));
            }
        }
    }
}