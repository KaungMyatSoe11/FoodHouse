using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Controller
{
    public class RestaurantController
    {
        public void RegisterRestaurant(RestaurantModel restaurant)
        {
            using(DbContextDataContext db=new DbContextDataContext())
            {
                tbl_Restaurant _Restaurant = new tbl_Restaurant();

                _Restaurant.RName = restaurant.RName;
                _Restaurant.PhoneNumber = restaurant.PhoneNumber;
                _Restaurant.Address = restaurant.Address;
                _Restaurant.CityID = restaurant.CityID;
                _Restaurant.R_Email = restaurant.R_Email;
                _Restaurant.R_Password = restaurant.R_Password;
                _Restaurant.UpdateDate = restaurant.UpdateDate;
                _Restaurant.RLogo = restaurant.RLogo;
                _Restaurant.Website = restaurant.Website;
                _Restaurant.CategoryID = restaurant.CategoryID;
                _Restaurant.Status = "Pending";

                db.tbl_Restaurants.InsertOnSubmit(_Restaurant);
                db.SubmitChanges();
            }
        }

        public void AcceptRestaurant(int ID)
        {
            using (DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_Restaurants where a.RID == ID select a).FirstOrDefault();

                if(data.Status=="Pending")
                {
                    data.Status = "Confirm";
                }
                else
                {
                    data.Status = "Pending";
                }

                db.SubmitChanges();
            }
        }
        public bool CheckRestaurant(String RName,String Address)
        {
            using (DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_Restaurants where a.RName == RName && a.Address == Address select a).ToArray();
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

        public bool RestaurantLogIn(string email,string password)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = db.RestaurantLogIn(email, password).ToArray();
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


        public List<vi_Order> OrderList(String Date,String Status)
        {
            using (DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.vi_Orders where a.ODate == Date && a.Status==Status select a).ToList();

                return data;
            }
        }

        public List<vi_FoodOrderList> OrderDetailList(int OID)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = (from a in db.vi_FoodOrderLists where a.OID ==OID  select a).ToList();

                return data;
            }
        }

        public void OrderStatuUpdate(String Status,int OID)
        {
            using(DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_Orders where a.OID == OID select a).FirstOrDefault();

                data.Status = Status;

                db.SubmitChanges();
            }
        }
    }
}