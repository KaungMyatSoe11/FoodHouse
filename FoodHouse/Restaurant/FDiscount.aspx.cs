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
    public partial class FDiscount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DbContextDataContext db = new DbContextDataContext();
            if (!IsPostBack)
            {
                var data = (from a in db.vi_RFoods where a.FID == Convert.ToInt32(Session["FID"].ToString())select a).FirstOrDefault();
                lblFoodName.Text = data.FoodName;
                AddingDiscount();
               
            }
        }

        public void AddingDiscount()
        {
           
          
            using (DbContextDataContext db = new DbContextDataContext())
            {
                
                List<tbl_Discount> lstDis = new List<tbl_Discount>();

                tbl_Discount dis = new tbl_Discount();
               
                dis.DiscountID = 0;
                dis.DiscountPercentage = "**You Can Pay Discount(%)**";

                lstDis.Add(dis);

                var lst = (from a in db.tbl_Discounts select a).ToList(); ;
                foreach (var d in lst)
                {
                    lstDis.Add(d);
                }
                ddlDIscount.DataSource = lstDis;
                ddlDIscount.DataBind();
            }
        }

        protected void btnDis_Click(object sender, EventArgs e)
        {
            DbContextDataContext db = new DbContextDataContext();
            DiscountController discountController = new DiscountController();
            DiscountModel discountModel = new DiscountModel();
          
                discountModel.DiscountID = Convert.ToInt32(ddlDIscount.SelectedValue);
                discountModel.StartDate = txtStartDate.Text.Trim().ToString();
                discountModel.EndDate = txtEndDate.Text.Trim().ToString();

                discountController.UpdateFDiscount(discountModel, Convert.ToInt32(Session["FID"]));
            Response.Redirect("View.aspx");
            }
         

        }
    }


    

       

      