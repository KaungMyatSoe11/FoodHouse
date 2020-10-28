using FoodHouse.Controller;
using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHouse.Customer
{
    public partial class SingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlCityData();
            }
        }

        /// <summary>
        /// Add Data To DrowDownList City
        /// </summary>
        private void ddlCityData()
        {
            using(DbContextDataContext db=new DbContextDataContext())
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
            }
        }

        protected void btnSginUp_Click(object sender, EventArgs e)
        {
            CustomerController customerController = new CustomerController();
            CustomerModel customer = new CustomerModel();
           if(customerController.CheckCustomerEmail(txtEmail.Text.Trim().ToString()))
           {
                customer.CustomerName = txtUserName.Text.Trim().ToString();
                customer.Email = txtEmail.Text.Trim().ToString();
                customer.PhoneNo = txtPhone.Text.Trim().ToString();
                customer.Password = txtPassword.Text.Trim().ToString();
                customer.Nrc = txtNrc.Text.Trim().ToString();
                customer.CityID = Convert.ToInt32(ddlCity.SelectedValue.ToString());
                customer.Address = txtAddress.Text.Trim().ToString();
                customerController.InsertCustomer(customer);
           }
           else
           {
                ScriptManager.RegisterClientScriptBlock
                   (this, this.GetType(), "alertMessage", "alert('Already Exist?')", true);
                txtEmail.Focus();
           }
            
        }

        
    }
}