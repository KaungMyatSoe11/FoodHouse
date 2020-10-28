using System;
using System.Data.Linq;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodHouse.Model;

namespace FoodHouse.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<RestaurantModel> tbls = new List<RestaurantModel>();
            RestaurantModel restaurant = new RestaurantModel();
            using (DbContextDataContext db = new DbContextDataContext())
            {
                
                var data = db.SelectAllResturant();

                foreach (var d in data)
                {
                    byte[] b = (byte[])d.RLogo.ToArray();
                    //= "data: image / jpg; base64," + Convert.ToBase64String(b);

                    restaurant.RName = d.RName;
                    restaurant.PhoneNumber = d.PhoneNumber;
                    restaurant.Address = d.Address;
                    restaurant.CityID = d.CityID.Value;
                    restaurant.R_Email = d.R_Email;
                    restaurant.R_Password = d.R_Password;
                    restaurant.UpdateDate = d.UpdateDate;
                    restaurant.RLogo = b;
                    restaurant.Website = d.Website;
                    restaurant.CategoryID = d.CategoryID.Value;
                    restaurant.Status = d.Status;
                    tbls.Add(restaurant);
                }
                tbls.Add(restaurant);
                
            }
            GridView1.DataSource = tbls;
            GridView1.DataBind();
}

        protected void btnStaus_Command(object sender, CommandEventArgs e)
        {

        }
    }
}