using FoodHouse.Controller;
using FoodHouse.Model;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using System.Web.WebSockets;

namespace FoodHouse.Customer
{
    public partial class Cart : System.Web.UI.Page
    {
        OrderController orderController = new OrderController();
        DbContextDataContext db = new DbContextDataContext();
        private int Subtotal = 0, Grandtotal = 0, Tax = 250, Discounttotal = 0;
        List<CheckoutFood> checkoutFoods = new List<CheckoutFood>();
        List<cart> carts = new List<cart>();
        private int index;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Addfood();
                ListView1.Items.Clear();
                ListView1.DataSource = checkoutFoods;
                ListView1.DataBind();
                Calculate_Total();
            }
            
        }

        void Addfood()
        {
            
            var d = (List<cart>)Session["c"];
            checkoutFoods.Clear();
           foreach(var Cfood in d)
            {
                var data = (from a in db.vi_CustomerFoods where a.FID ==Convert.ToInt32(Cfood.id) select a ).FirstOrDefault();
                    
                    CheckoutFood foods = new CheckoutFood();
                    foods.FID = data.FID;
                    foods.RID = (int)data.RID;
                    foods.FoodName = data.FoodName;
                    foods.RName = data.RName;
                    foods.Price = (int)data.Price;
                    foods.Image = "data:image/jpg;base64," + Convert.ToBase64String(((Binary)data.Image).ToArray());
                    foods.DiscountID = (int)data.DiscountID;
                    foods.Qty = Convert.ToInt32(Cfood.qty);
                    foods.DiscountPrice = Convert.ToInt32(Cfood.DPrice);
                    checkoutFoods.Add(foods);
            }
          
           
        }

        private void Calculate_Total()
        {
           
            int taxtotal = 0;
            foreach(var data in checkoutFoods)
            {
                Subtotal += data.Price*data.Qty;
                lblSubtotal.Text = Subtotal.ToString() ;
                taxtotal += Tax * data.Qty;
                lblTax.Text = taxtotal.ToString();
                Discounttotal += data.DiscountPrice * data.Qty;
                lblDiscount.Text ="-"+Discounttotal.ToString();
                
            }
            Grandtotal += taxtotal + (Subtotal - Discounttotal);
            lblGrandtotal.Text = Grandtotal.ToString();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if(Session["CID"]!=null)
            {
                
                OrderModel order = new OrderModel();
                List<OrderDetailModel> orderDetails = new List<OrderDetailModel>();
                order.CustomerID = Convert.ToInt32(Session["CID"]);
                order.ODate = DateTime.Now.ToShortDateString();
                order.GrandTotal =Convert.ToInt32(lblGrandtotal.Text);
                order.ShippingAddress = txtShippingAddress.Text.ToString();
                order.RID = Convert.ToInt32(Session["RID"]);
                Addfood();
                foreach(var odetail in checkoutFoods)
                {
                    OrderDetailModel orderDetailModel = new OrderDetailModel();
                    orderDetailModel.FID = odetail.FID;
                    orderDetailModel.Quantity = odetail.Qty;
                    orderDetails.Add(orderDetailModel);

                }
                orderController.OrderInsert(order, orderDetails);
                ScriptManager.RegisterClientScriptBlock
                      (this, this.GetType(), "alertMessage", "alert('Ordering...')", true);
                Session["c"] = null;
                //Response.Redirect("../Default.aspx");

            }
            else
            {
                Response.Redirect("../SignIn.aspx");
            }
            
            
        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            //
           
        }

        private void changeQty(int id,String qty)
        {
            Addfood();
            var d = (List<cart>)Session["c"];
            var fooddata = (from a in d where a.id == id.ToString() select a).FirstOrDefault();
            fooddata.qty =qty;

            d.Remove(fooddata);
            d.Add(fooddata);
            Session["c"] = d;
      
        }
        

       

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var btnsub = (Button)e.Item.FindControl("btnsubqty");
            var txtqty = (TextBox)e.Item.FindControl("txtQty");
            if (e.CommandName=="Sub")
            {
             
                if (txtqty.Text != "1")
                {
                    int qty = Convert.ToInt32(txtqty.Text);
                    txtqty.Text = (qty - 1).ToString();
                    changeQty(Convert.ToInt32(e.CommandArgument), txtqty.Text);
                    btnsub.Enabled = Convert.ToInt32(txtqty.Text) <= 1 ? false : true;
                }
                else
                {
                    btnsub.Enabled = false;
                }
                

            }
            else if(e.CommandName=="Add")
            {
                 txtqty = e.Item.FindControl("txtQty") as TextBox;
                int qty =Convert.ToInt32(txtqty.Text);
                txtqty.Text = (qty+1).ToString();
                changeQty(Convert.ToInt32(e.CommandArgument), txtqty.Text);
                btnsub.Enabled = Convert.ToInt32(txtqty.Text) <= 1 ? false : true;
                Addfood();
                Calculate_Total();
            }
            else if(e.CommandName=="Delete")
            {
                Addfood();
                var d = (List<cart>)Session["c"];
                var data = (from a in checkoutFoods where a.FID == Convert.ToInt32(e.CommandArgument) select a).FirstOrDefault();
                var Cfood = (from a in d where a.id == e.CommandArgument.ToString() select a).FirstOrDefault();
                d.Remove(Cfood);
                Session["c"] = d;
                checkoutFoods.Remove(data);
                Response.Redirect("Cart.aspx");

                
            }
        }

        
    }
}