using FoodHouse.Model;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;

namespace FoodHouse.Customer
{
    public partial class Order : System.Web.UI.Page
    {
        String Percentage;
        DbContextDataContext db = new DbContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                ViewState["ID"] = Session["FID"];
                var data = (from a in db.vi_CustomerFoods where a.FID == Convert.ToInt32(Session["FID"]) select a).FirstOrDefault();
                lblFoodName.Text = data.FoodName;
                lblRName.Text = data.RName;
                lblPrice.Text = data.Price.ToString() + "Ks";
                FImage.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(((Binary)data.Image).ToArray());
                if (data.DiscountID != null)
                {
                    foreach(var p in data.DiscountPercentage.ToString())
                    {
                        if(p!='%')
                        {
                            Percentage += p;
                        }
                        else
                        {
                            break;
                        }
                    }

                    double rate = Convert.ToDouble((Convert.ToDouble(Percentage) / 100));
                    double pec = Convert.ToDouble(data.Price) * rate;//2500 * 0.3 , 750
                    int Dis = (int)data.Price - Convert.ToInt32(pec);
                    lblDiscount.Text = Dis.ToString();
                    lblPrice.CssClass += "text-muted   d";
                }
                else
                {
                    lblDiscount.Enabled = false;
                }
                btnsubqty.Enabled = Convert.ToInt32(txtQty.Text) <= 1 ? false : true;
            }
            
            
        }

        

       

        protected void btnCart_Click(object sender, EventArgs e)
        {
            cart c = new cart();
            var carts = new List<cart>();
            if(Session["c"]!=null)
            {
                carts= (List<cart>) Session["c"];
                
            }
            
          
            c.id = ViewState["ID"].ToString() ;
            c.qty = txtQty.Text;
            c.DPrice = lblDiscount.Text;
            var d = (from a in carts where a.id == c.id select a).FirstOrDefault();
            if(d !=null)
            {
                carts.Remove(d);
            }
            carts.Add(c);
            Session["c"] = carts;

            Response.Redirect("CFoodItemList.aspx");
           
              
        }

      

        protected void btnsubqty_Click(object sender, EventArgs e)
        {
            int count = Convert.ToInt32(txtQty.Text.Trim().ToString());
            txtQty.Text = (count - 1).ToString();
            btnsubqty.Enabled = Convert.ToInt32(txtQty.Text) <= 1 ? false : true;
        }

        protected void btnaddqty_Click(object sender, EventArgs e)
        {
            int count =Convert.ToInt32(txtQty.Text.Trim().ToString());
            txtQty.Text =(count+1).ToString();
            btnsubqty.Enabled = Convert.ToInt32(txtQty.Text) <= 1 ? false : true;
        }
    }
}