using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Model
{
    public class AdminsModel
    {
        public int AdminID { get; set; }

        public String AdminName { get; set; }

        public String Password { get; set; }

        public String UpdateDate { get; set; }
    }
}