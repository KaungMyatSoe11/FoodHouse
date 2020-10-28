using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Controller
{
    public class FoodItemContoller
    {
        public void InsertFoodItem(FoodItemModel foodItem)
        {
            using(DbContextDataContext db=new DbContextDataContext())
            {
                tbl_FoodItem _FoodItem = new tbl_FoodItem();
                
                _FoodItem.RID = foodItem.RID;
                _FoodItem.FoodName = foodItem.FoodName;
                _FoodItem.Price = foodItem.Price;
                _FoodItem.Image = foodItem.Image;
          
                _FoodItem.Status = "NotAvaiable";

                db.tbl_FoodItems.InsertOnSubmit(_FoodItem);
                db.SubmitChanges();
            }
        }

        public void UpdateFood(FoodItemModel foods)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = (from a in db.tbl_FoodItems where a.FID == foods.FID select a).FirstOrDefault();

                data.FoodName = foods.FoodName;
                data.Price = foods.Price;
                data.Image = foods.Image;
                data.Status = foods.Status;
                db.SubmitChanges();

            }
        }

        public void DeleteFood(int fid)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                var data = (from a in db.tbl_FoodItems where a.FID == fid select a).ToList();

                foreach (var field in data)
                {
                    db.tbl_FoodItems.DeleteOnSubmit(field);
                }

                db.SubmitChanges();
            }

        }
    }
}