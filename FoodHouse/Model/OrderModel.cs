using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class OrderModel
    {
        public int OID { get; set; }
        public int CustomerID { get; set; }
        public String ODate { get; set; }
        public String ONumber { get; set; }
        public int GrandTotal { get; set; }

        public String Status { get; set; }
        public String ShippingAddress { get; set; }
        public int DeliveryManID { get; set; }
        public int RID { get; set; }

    }
}