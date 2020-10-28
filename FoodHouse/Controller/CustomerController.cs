using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;

namespace FoodHouse.Controller
{
    public class CustomerController
    {
        public void InsertCustomer(CustomerModel customer)
        {
            using (DbContextDataContext db=new DbContextDataContext())
            {
                tbl_Customer _Customer = new tbl_Customer();
                _Customer.CustomerName = customer.CustomerName;
                _Customer.Password = customer.Password;
                _Customer.Address = customer.Address;
                _Customer.NRC = customer.Nrc;
                _Customer.Email = customer.Email;
                _Customer.PhoneNo = customer.PhoneNo;
                _Customer.CityID = customer.CityID;

                db.tbl_Customers.InsertOnSubmit(_Customer);
                db.SubmitChanges();
            }
        }

        public bool CheckCustomerEmail(string email)
        {
            
            using(DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_Customers where a.Email == email select a).ToArray();
                if(data.Count()>0)
                {
                    return false;
                }
                else
                {
                    return true;
                }

                
            }
        }

        public bool CustomerLogIn(string email,string password)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = db.CustomerLogIn(email, password).ToArray();
                if (data.Count() == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}