using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Admin
{
    public partial class AdminsMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AID"]==null)
            {
                Response.Redirect("../SignIn.aspx");
            }
        }
    }
}