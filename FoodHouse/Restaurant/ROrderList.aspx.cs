using FoodHouse.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;

namespace FoodHouse.Restaurant
{
    public partial class ROrderList : System.Web.UI.Page
    {
        DbContextDataContext db = new DbContextDataContext();
        RestaurantController restaurantController = new RestaurantController();
        String Status;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
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
            MultiView1.ActiveViewIndex = 1;
            ShowGridViewData();
        }

        

        protected void btnOrderPreparing_Click(object sender, EventArgs e)
        {
            Status = "Order Preparing";
            
            if (dtpDate.Text != string.Empty)
            {
                DateTime date = DateTime.Parse(dtpDate.Text);
                ShowOrderList(date.ToString("d"), Status);
            }
            else
            {
                string date = DateTime.Now.ToShortDateString();
                ShowOrderList(date, Status);
            }
        }

        protected void btnOrderPending_Click(object sender, EventArgs e)
        {
            Status = "Order Pending";
            if (dtpDate.Text != string.Empty)
            {
                DateTime date = DateTime.Parse(dtpDate.Text);
                ShowOrderList(date.ToString("d"), Status);
            }
            else
            {
                string date = DateTime.Now.ToShortDateString();
                ShowOrderList(date, Status);
            }
        }

        protected void btnDeliveried_Click(object sender, EventArgs e)
        {
            Status = "Deliveried";
            if (dtpDate.Text != string.Empty)
            {
                DateTime date = DateTime.Parse(dtpDate.Text);
                ShowOrderList(date.ToString("d"), Status);
            }
            else
            {
                string date = DateTime.Now.ToShortDateString();
                ShowOrderList(date, Status);
            }
        }

        protected void btnOrderNotAvailable_Click(object sender, EventArgs e)
        {
            Status = "Order Not Available";
            if (dtpDate.Text != string.Empty)
            {
                DateTime date = DateTime.Parse(dtpDate.Text);
                ShowOrderList(date.ToString("d"), Status);
            }
            else
            {
                string date = DateTime.Now.ToShortDateString();
                ShowOrderList(date, Status);
            }
        }

        protected void ShowGridViewData()
        {
            var data = restaurantController.OrderDetailList(Convert.ToInt32(Session["OID"]));
            GridView1.DataSource = data;
            GridView1.DataBind();
            var cinfo=data.FirstOrDefault();
            lblGrandtotal.Text = cinfo.GrandTotal.ToString();
            txtShippingAddress.Text = cinfo.ShippingAddress.ToString();
          
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Status = DropDownList1.Text;
            restaurantController.OrderStatuUpdate(Status,Convert.ToInt32(Session["OID"]));
            ScriptManager.RegisterClientScriptBlock
                      (this, this.GetType(), "alertMessage", "alert('True...')", true);
            Response.Redirect("ROrderList.aspx");
        }
    }
}