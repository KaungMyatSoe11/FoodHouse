using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodHouse.Model;
using FoodHouse.Controller;

namespace FoodHouse.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["AdminID"] != null)
                {
                    DbContextDataContext db = new DbContextDataContext();
                    ViewState["id"] = Convert.ToInt32(Session["AdminID"]);
                    var data = (from a in db.tbl_Admins where a.AdminID == Convert.ToInt32(ViewState["id"]) select a).FirstOrDefault();
                    txtAdminName.Text = data.AdminName;
                    btnSave.Text = "Update";
                }
                else
                {
                    btnSave.Text = "Save";
                }
                Session["AdminID"] = null;
            }
                
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            AdminController admincontroller = new AdminController();
            AdminsModel admin = new AdminsModel();
           

            if (btnSave.Text == "Save")
            {
                admin.AdminName = txtAdminName.Text.Trim().ToString();
                admin.Password = txtPassword.Text.Trim().ToString();
                admin.UpdateDate = DateTime.UtcNow.ToShortDateString();


                using (DbContextDataContext db = new DbContextDataContext())
                {
                    var data = (from a in db.tbl_Admins where a.AdminName == admin.AdminName select a).ToArray();
                    if (data.Length > 0)
                    {
                        lblerror.Text = "Already Exist!";
                    }
                    else
                    {
                        admincontroller.InsertAdmin(admin);
                        Response.Redirect("AdminList.aspx");
                    }
                }
            }
            else if(btnSave.Text=="Update")
            {

                admin.AdminID = Convert.ToInt32(ViewState["id"]);
                admin.AdminName = txtAdminName.Text.Trim().ToString();
                admin.Password = txtPassword.Text.Trim().ToString();
                admin.UpdateDate = DateTime.UtcNow.ToShortDateString();

                admincontroller.UpdateAdmin(admin);
                Response.Redirect("AdminList.aspx");
                
            }
        }



       
    }
}