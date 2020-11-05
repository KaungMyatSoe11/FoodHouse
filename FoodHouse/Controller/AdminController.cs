using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Runtime.Serialization;
using System.Security.Cryptography;
using System.Web;

namespace FoodHouse.Controller
{
    public class AdminController
    {
        public void InsertAdmin(AdminsModel admin)
        {
             using (DbContextDataContext db = new DbContextDataContext())
                {
                   tbl_Admin Admin = new tbl_Admin();
                    Admin.AdminName = admin.AdminName;
                    Admin.Password = admin.Password;
                    Admin.UpdateDate = admin.UpdateDate;

                    db.tbl_Admins.InsertOnSubmit(Admin);
                    db.SubmitChanges();
                }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="adminid"></param>
        public void DeleteAdmin(int adminid)
        {
            using (DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_Admins where a.AdminID == adminid select a).ToList();

                foreach(var field in data)
                {
                    db.tbl_Admins.DeleteOnSubmit(field);
                }
             
                db.SubmitChanges();
            }
           
        }

        public void UpdateAdmin(AdminsModel admins)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = (from a in db.tbl_Admins where a.AdminID == admins.AdminID select a).FirstOrDefault();
               
                data.AdminName=admins.AdminName;
                data.Password=admins.Password;
                data.UpdateDate=admins.UpdateDate;

                db.SubmitChanges();

            }
        }

        public bool AdminLogin(string email, string password)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = db.AdminLogIn(email, password).ToArray();
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