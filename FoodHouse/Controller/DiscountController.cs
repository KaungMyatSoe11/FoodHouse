using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Controller
{
    public class DiscountController
    {
        public void AddingFDiscount(DiscountModel discount)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                tbl_FoodItem fd = new tbl_FoodItem();

                fd.DiscountID = discount.DiscountID;
                fd.DisStartDate = discount.StartDate;
                fd.DisEndDate = discount.EndDate;
                fd.Status = discount.Status;
                fd.Description = discount.Description;
                db.tbl_FoodItems.InsertOnSubmit(fd);
                db.SubmitChanges();
            }
        }
        public void UpdateFDiscount(DiscountModel discount, int FID)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = (from a in db.tbl_FoodItems where a.FID == FID select a).FirstOrDefault();
                data.DiscountID = discount.DiscountID;
                data.DisStartDate = discount.StartDate;
                data.DisEndDate = discount.EndDate;
                db.SubmitChanges();
            }
        }

        public void InsertDiscount(DiscountModel discount)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                tbl_Discount Discount = new tbl_Discount();
                Discount.DiscountPercentage = discount.DiscountPercentage;


                db.tbl_Discounts.InsertOnSubmit(Discount);
                db.SubmitChanges();




            }
        }


        public void UpdateDiscount(DiscountModel discounts)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = (from a in db.tbl_Discounts where a.DiscountID == discounts.DiscountID select a).FirstOrDefault();

                data.DiscountPercentage = discounts.DiscountPercentage;


                db.SubmitChanges();

            }
        }


        public void DeleteDiscount(int discountid)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = (from a in db.tbl_Discounts where a.DiscountID == discountid select a).FirstOrDefault();
                  db.tbl_Discounts.DeleteOnSubmit(data);
                   db.SubmitChanges();
            }

        }
    }
}