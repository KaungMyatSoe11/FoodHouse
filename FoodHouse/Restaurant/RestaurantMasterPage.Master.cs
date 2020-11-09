using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Restaurant
{
    public partial class RestaurantMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RID"] == null)
            {
                Response.Redirect("../SignIn.aspx");
            }
            else
            {
                using(DbContextDataContext db=new DbContextDataContext())
                {
                    var count = (from a in db.tbl_Orders where a.RID == Convert.ToInt32(Session["RID"]) select a).Count();
                    lblOrdercount.Text = count.ToString();

                       
                }
                btnSignin.Text = "Sign Out";
            
            }
        }
    }
}