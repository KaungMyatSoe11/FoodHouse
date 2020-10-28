using FoodHouse.Controller;
using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Admin
{
    public partial class DeliverMan : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                AddDropDown();
                if (Session["DeliveryManID"] != null)
                {
                    DbContextDataContext db = new DbContextDataContext();
                    ViewState["id"] = Convert.ToInt32(Session["DeliveryManID"]);
                    var data = (from a in db.tbl_DeliveryMans where a.DeliveryManID == Convert.ToInt32(ViewState["id"]) select a).FirstOrDefault();
                    txtDeliveryName.Text = data.DeliveryName;
                    txtPhoneNumber.Text = data.PhoneNumber;
                    ddlCity.SelectedValue = data.CityID.ToString();
                    btnSave.Text = "Update";
                }
                
            }
        }
        private void AddDropDown()
        {
            ddlCity.SelectedIndex = 0;
            using (DbContextDataContext db = new DbContextDataContext())
            {

                List<tbl_City> lstCity = new List<tbl_City>();
                List<tbl_Category> lstCategory = new List<tbl_Category>();
                tbl_City tbl = new tbl_City();
                tbl.CityID = 0;
                tbl.CityName = "-----Select----";
                lstCity.Add(tbl);
                var lst = db.SelectAllCity().ToList();
                foreach (var d in lst)
                {
                    lstCity.Add(d);
                }
                ddlCity.DataSource = lstCity;
                ddlCity.DataBind();
                /////
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DeliveryManModel deliveryMan = new DeliveryManModel();
            DeliveryManController deliveryManController = new DeliveryManController();
            DbContextDataContext db = new DbContextDataContext();
           
            if(btnSave.Text=="Save")
            {
                var data = (from a in db.tbl_DeliveryMans where a.PhoneNumber == txtPhoneNumber.Text.Trim().ToString() select a).Count();
                if (data > 0)
                {
                    ScriptManager.RegisterClientScriptBlock
                       (this, this.GetType(), "alertMessage", "alert('Already Exist Phone number?')", true);
                    txtDeliveryName.Focus();
                }
                else
                {
                    deliveryMan.DeliveryName = txtDeliveryName.Text.Trim().ToString();
                    deliveryMan.PhoneNumber = txtPhoneNumber.Text.Trim().ToString();
                    deliveryMan.CityID = Convert.ToInt32(ddlCity.SelectedValue);
                    deliveryManController.InsertDeliveryMan(deliveryMan);
                    Response.Redirect("DeliveryManList.aspx");
                }
            }
            else
            {
                deliveryMan.DeliveryManID = Convert.ToInt32(ViewState["id"]);
                deliveryMan.DeliveryName = txtDeliveryName.Text.Trim().ToString();
                deliveryMan.PhoneNumber = txtPhoneNumber.Text.Trim().ToString();
                deliveryMan.CityID = Convert.ToInt32(ddlCity.SelectedValue);
                deliveryManController.UpdateDeliveryMan(deliveryMan);
                Session["DeliveryManID"] = null;
            }
            
        }
    }
}