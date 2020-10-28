using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodHouse.Model;
using FoodHouse.Controller;

namespace FoodHouse.Restaurant
{
    public partial class Discount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DiscountID"] != null)
                {
                    DbContextDataContext db = new DbContextDataContext();
                    ViewState["id"] = Convert.ToInt32(Session["DiscountID"]);
                    var data = (from a in db.tbl_Discounts where a.DiscountID == Convert.ToInt32(ViewState["id"]) select a).FirstOrDefault();
                    txtDiscount.Text = data.DiscountPercentage;
                    btnAdd.Text = "Update";
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
             DiscountController discountcontroller = new DiscountController();
            DiscountModel discount = new DiscountModel();
            if (btnAdd.Text == "Add")
            {
                discount.DiscountPercentage = txtDiscount.Text.Trim().ToString();



                using (DbContextDataContext db = new DbContextDataContext())
                {
                    var data = (from a in db.tbl_Discounts where a.DiscountPercentage == discount.DiscountPercentage select a).ToArray();
                    if (data.Length > 0)
                    {
                        lblerror.Text = "Already Exist!";
                    }
                    else
                    {
                        discountcontroller.InsertDiscount(discount);
                        Response.Redirect("Discount.aspx");
                    }

                }
            }
             else if(btnAdd.Text=="Update")
            {
            
                discount.DiscountID = Convert.ToInt32(Session["DiscountID"]);
                discount.DiscountPercentage = txtDiscount.Text.Trim().ToString();
                
                discountcontroller.UpdateDiscount(discount);
                Session["DiscountID"] = null;
                Response.Redirect("Discount.aspx");
              
            }
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
         Session["DiscountID"] = e.CommandArgument.ToString();

            Response.Redirect("Discount.aspx");
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
         DiscountController discountController = new DiscountController();
            string id = e.CommandArgument.ToString();
            if (id != string.Empty)
            {
                discountController.DeleteDiscount(Convert.ToInt32(id));
            }
        }
    }

        }
         