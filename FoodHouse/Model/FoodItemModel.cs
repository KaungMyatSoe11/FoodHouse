using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class FoodItemModel
    {
        public  int FID { get; set; }
        public  int RID { get; set; }
        public  string FoodName { get; set; }
        public  int Price { get; set; }
        public  byte[] Image { get; set; }
        public  int DiscountID { get; set; }
        public  string DisStartDate { get; set; }
        public  string DisEdnDate { get; set; }
        public  string Description { get; set; }
        public  string Status { get; set; }
    }
}