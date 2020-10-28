using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Web;

namespace FoodHouse.Model
{
    public class RestaurantModel
    {
        public int NO { get; set; }
        public int RID { get; set; }

        public String RName { get; set; }

        public String PhoneNumber { get; set; }

        public String Address { get; set; }

        public int CityID { get; set; }

        public string CityName { get; set; }
        public String R_Email { get; set; }

        public String R_Password { get; set; }

        public String UpdateDate { get; set; }

        public byte[] RLogo { get; set; }

        public String Website { get; set; }

        public int CategoryID { get; set; }

        public  string CategoryName { get; set; }
        public String Status { get; set; }
    }
}