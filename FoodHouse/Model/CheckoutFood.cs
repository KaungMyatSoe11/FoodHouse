using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class CheckoutFood
    {
        public int FID { get; set; }
        public int RID { get; set; }
        public String FoodName { get; set; }
        public String RName { get; set; }
        public int Price { get; set; }
        public String Image { get; set; }
        public int DiscountID { get; set; }
        public int DiscountPrice { get; set; }
        public int Qty { get; set; }
        
    }
}