using FoodHouse.Controller;
using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Admin
{
    public partial class RestaurantList : System.Web.UI.Page
    {
        private int _RID;
        private String status="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                grid();
            }
            
        }

        //private void ShowData()
        // {
          
        //    List<RestaurantModel> tbls = new List<RestaurantModel>();
        //    RestaurantModel restaurant = new RestaurantModel();
        //    using (DbContextDataContext db = new DbContextDataContext())
        //    {
        //        tbls.Clear();
        //        var data = db.SelectAllResturant().ToList();
        //        int no = 0;
        //        foreach (var d in data)
        //        {
        //            no++;
        //            byte[] b = (byte[])d.RLogo.ToArray();
        //            //= "data: image / jpg; base64," + Convert.ToBase64String(b);
        //            restaurant.NO = no;
        //            restaurant.RID = d.RID;
        //            restaurant.RName = d.RName;
        //            restaurant.PhoneNumber = d.PhoneNumber;
        //            restaurant.Address = d.Address;
        //            restaurant.CityID = d.CityID.Value;
        //            restaurant.CityName = d.CityName;
        //            restaurant.R_Email = d.R_Email;
        //            restaurant.R_Password = d.R_Password;
        //            restaurant.UpdateDate = d.UpdateDate;
        //            restaurant.RLogo = b;
        //            restaurant.Website = d.Website;
        //            restaurant.CategoryID = d.CategoryID.Value;
        //            restaurant.CategoryName = d.CategoryName;
        //            restaurant.Status = d.Status;
        //            tbls.Add(restaurant);
        //        }


        //    }

       
            
        //    GridView1.DataSource = tbls;
        //    GridView1.DataBind();
        //  //  grid();
            

        //}

        

        private void grid()
        {
            if (GridView1.Rows.Count > 0)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    Button btnStaus = (Button)row.FindControl("btnStaus");
                    if (btnStaus.Text == "Confirm" )
                    {
                        btnStaus.CssClass = "btn btn-success";
                    }
                    else
                    {
                        btnStaus.CssClass = "btn btn-secondary";
                    }
                }
            }
        }

        protected void btnStaus_Command(object sender, CommandEventArgs e)
        {
            
            RestaurantController restaurantController = new RestaurantController();
            var a = e.CommandArgument.ToString().Split(',').ToArray();
            _RID = Convert.ToInt32(a[0]);
            status = a[1].ToString();
            restaurantController.AcceptRestaurant(_RID);
            GridView1.DataBind();//
            grid();
        }

        protected void btnStaus_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int RowIndex = GridView1.SelectedIndex;

            //GridViewRow Row = GridView1.Rows[RowIndex];
            //Button btnStaus = (Button)Row.FindControl("btnStaus");
            //if (btnStaus.Text == "Confirm")
            //{
            //    btnStaus.Text = "Pending";
            //    btnStaus.CssClass = "btn btn-secondary";
            //}
            //else
            //{
            //    btnStaus.Text = "Confirm";
            //    btnStaus.CssClass = "btn  btn-success";
            //}
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
          
        }
    }
}