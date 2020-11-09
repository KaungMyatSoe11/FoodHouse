using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (Session["c"] != null)
                {
                    var data = (List<cart>)Session["c"];
                    lblcart.Text = data.Count().ToString();
                }
            
            if (Session["CID"] != null)
            {
                btnSignin.Text = "Sign Out";
            }
            


        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            if (btnSignin.Text == "Sign Out")
            {
                Session["CID"] = null;

                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
    }
}