using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class OrderDetailModel
    {
        public int OID { get; set; }
        public int FID { get; set; }
        public int Quantity { get; set; }
        public String Description { get; set; }
    }
}