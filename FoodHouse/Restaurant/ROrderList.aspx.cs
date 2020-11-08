using FoodHouse.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;

namespace FoodHouse.Restaurant
{
    public partial class ROrderList : System.Web.UI.Page
    {
        RestaurantController restaurantController = new RestaurantController();
        String Status;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Status = "Order Pending";
                dtpDate.Text = DateTime.Now.ToShortDateString();
                ShowOrderList(dtpDate.Text,Status);
            }
            


        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var d = e.Item;
            var tool =(Label) d.FindControl("StatusLabel");
            switch(tool.Text)
            {
                case "Order Pending": tool.CssClass = "font-weight-bold text-warning"; break;
                case "Order Preparing": tool.CssClass = "font-weight-bold text-secondary"; break;
                case "Deliveried": tool.CssClass = "font-weight-bold text-success"; break;
                case "Order Not available": tool.CssClass = "font-weight-bold text-danger"; break;
            }
            
        }

        protected void ShowOrderList(String Date,String Status)
        {
            ListView1.DataSource = restaurantController.OrderList(Date,Status);
            ListView1.DataBind();
        }

        protected void btnView_Command(object sender, CommandEventArgs e)
        {
            Session["OID"] = e.CommandArgument;
            Response.Redirect("OrderDetailList.aspx");
        }

        

        protected void btnOrderPreparing_Click(object sender, EventArgs e)
        {
            Status = "Order Preparing";
            DateTime date = DateTime.Parse(dtpDate.Text);
            if (dtpDate.Text != null)
            {
                ShowOrderList(date.ToString("d"), Status);
            }
        }
    }
}