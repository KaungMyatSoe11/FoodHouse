using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class DeliveryManModel
    {
        public int DeliveryManID { get; set; }

        public String DeliveryName { get; set; }

        public String PhoneNumber { get; set; }

        public int CityID { get; set; }

        public String CityName { get; set; }

        public String  Status { get; set; }
    }
}