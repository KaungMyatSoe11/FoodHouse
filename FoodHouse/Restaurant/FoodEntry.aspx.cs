using FoodHouse.Controller;
using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Restaurant
{
    public partial class FoodEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FID"] != null)
                {
                    DbContextDataContext db = new DbContextDataContext();
                    ViewState["id"] = Convert.ToInt32(Session["FID"]);
                    var data = (from a in db.tbl_FoodItems where a.FID == Convert.ToInt32(ViewState["id"]) select a).FirstOrDefault();
                    txtfoodname.Text = data.FoodName;
                    txtPrice.Text = data.Price.ToString();
                    if(data.Status=="Available")
                    {
                        chkStuatus.Checked = true;
                    }
                    else
                    {
                        chkStuatus.Checked = false;
                    }

                    btnSave.Text = "Update";
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
            DbContextDataContext db = new DbContextDataContext();
            FoodItemContoller foodItemContoller = new FoodItemContoller();
            FoodItemModel food = new FoodItemModel();

            if (btnSave.Text == "Save")
            {


                var data = (from a in db.tbl_FoodItems where a.FoodName == txtfoodname.Text.Trim().ToString() select a).ToList();

                if (data.Count > 0)
                {
                    ScriptManager.RegisterClientScriptBlock
                       (this, this.GetType(), "alertMessage", "alert('Already Exist?')", true);
                    txtfoodname.Focus();
                }
                else
                {
                    food.RID = Convert.ToInt32(Session["RID"]);
                    food.FoodName = txtfoodname.Text.Trim().ToString();
                    food.Price = Convert.ToInt32(txtPrice.Text);
                    food.Image = FileUploadImage.FileBytes;
                    food.Status = chkStuatus.Checked ? "Available" : "NotAvailable";
                    foodItemContoller.InsertFoodItem(food);
                    Response.Redirect("~/Restaurant/FoodItemList.aspx");

                }
            }
            else if (btnSave.Text == "Update")
            {

                food.FID = Convert.ToInt32(Session["FID"]);
                food.FoodName = txtfoodname.Text.Trim().ToString();
                food.Price = Convert.ToInt32(txtPrice.Text);
                food.Image = FileUploadImage.FileBytes;
                food.Status = chkStuatus.Checked ? "Available" : "NotAvailable";
                foodItemContoller.UpdateFood(food);
                Session["FID"] = null;
                Response.Redirect("View.aspx");
            }

        }
    }
}