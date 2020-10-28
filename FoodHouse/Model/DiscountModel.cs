using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class DiscountModel
    {
        public int DiscountID { get; set; }
        public string DiscountPercentage { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
    }
}