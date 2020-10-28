using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class CustomerModel
    {
        public int CustomerID { get; set; }

        public string CustomerName { get; set; }

        public string Password { get; set; }

        public string Address { get; set; }

        public string Nrc { get; set; }

        public string Email { get; set; }

        public String PhoneNo { get; set; }

        public int CityID { get; set; }

    }
}