using FoodHouse.Controller;
using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Restaurant
{
    
    public partial class Restaurant : System.Web.UI.Page
    {
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                AddDropDown();
            }
        }

        private void AddDropDown()
        {
            ddlCity.SelectedIndex = 0;
            using(DbContextDataContext db =new DbContextDataContext())
            {
                
                List<tbl_City> lstCity = new List<tbl_City>();
                List<tbl_Category> lstCategory = new List<tbl_Category>();
                tbl_City tbl = new tbl_City();
                tbl.CityID = 0;
                tbl.CityName = "-----Select----";
                lstCity.Add(tbl);
                var lst = db.SelectAllCity().ToList();
                foreach(var d in lst)
                {
                    lstCity.Add(d);
                }
                ddlCity.DataSource = lstCity;
                ddlCity.DataBind();
                /////

                tbl_Category _Category = new tbl_Category();
                _Category.CategoryID = 0;
                _Category.CategoryName = "-----Select-----";
                lstCategory.Add(_Category);
                var lst_ = (from a in db.tbl_Categories select a ).ToList();

                foreach(var d in lst_)
                {
                    lstCategory.Add(d);
                }
                ddlCategory.DataSource = lstCategory;
                ddlCategory.DataBind();


           
            }
        }

        private static byte[] ReadImage(string p_postedImageFileName)
        {
            FileStream fs = new FileStream(p_postedImageFileName, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            byte[] image = br.ReadBytes((int)fs.Length);
            br.Close();
            fs.Close();
            return image;
        }

        [HttpMethod]
        protected void btnSave_Click(object sender, EventArgs e)
        {
            RestaurantController restaurantController = new RestaurantController();
            RestaurantModel restaurant = new RestaurantModel();
            if(restaurantController.CheckRestaurant(txtRestaurantName.Text.Trim().ToString(),txtAddress.Text.Trim().ToString()))
            {
                restaurant.RName = txtRestaurantName.Text.Trim().ToString();
                restaurant.PhoneNumber = txtPhoneNumber.Text.Trim().ToString();
                restaurant.Address = txtAddress.Text.Trim().ToString();
                restaurant.CityID = Convert.ToInt32(ddlCity.SelectedValue.ToString());
                restaurant.R_Email = txtRestaurantEmail.Text.Trim().ToString();
                restaurant.R_Password = txtPassword.Text.Trim().ToString();
                restaurant.UpdateDate = DateTime.Now.ToShortDateString();
                restaurant.RLogo = fupLogo.FileBytes;
                restaurant.Website = txtRestaurantWebsite.Text.Trim().ToString();
                restaurant.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue.ToString());
                restaurantController.RegisterRestaurant(restaurant);
                Response.Redirect("~/Restaurant/Restaurant.aspx");
            }
            else
            {
                lblerror.Text = "Already Exist";
                ScriptManager.RegisterClientScriptBlock
                    (this, this.GetType(), "alertMessage", "alert('Already Exist?')", true);

            }
        }
    }
}