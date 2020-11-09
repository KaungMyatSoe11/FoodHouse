using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Customer
{
    public partial class COrderList : System.Web.UI.Page
    {
        DbContextDataContext db = new DbContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<vi_FoodOrderList> _FoodOrderLists = new List<vi_FoodOrderList>();

            if (!IsPostBack)
            {
                var data = (from a in db.tbl_Orders where a.CustomerID == Convert.ToInt32(Session["CID"]) && a.ONumber != null orderby a.ODate descending, a.ONumber descending select a).ToList();
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
           
        }

        protected void Repeater1_PreRender(object sender, EventArgs e)
        {
           
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
          Label lbl= (Label)  e.Item.FindControl("lblODate");
          Label lblONum= (Label)  e.Item.FindControl("lblONumber");
            GridView GridView1 = (GridView)e.Item.FindControl("GridView1");
            var data = (from a in db.vi_FoodOrderLists where a.ODate == lbl.Text && a.ONumber==lblONum.Text  select a  ).ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

      
    }
}