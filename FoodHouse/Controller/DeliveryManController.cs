using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHouse.Controller
{
    public class DeliveryManController
    {
        public void InsertDeliveryMan(DeliveryManModel deliveryMan)
        {
            using (DbContextDataContext db = new DbContextDataContext())
            {
                tbl_DeliveryMan _DeliveryMan = new tbl_DeliveryMan();
                _DeliveryMan.DeliveryName = deliveryMan.DeliveryName;
                _DeliveryMan.PhoneNumber = deliveryMan.PhoneNumber;
                _DeliveryMan.CityID = deliveryMan.CityID;
                _DeliveryMan.Status = deliveryMan.Status;

                db.tbl_DeliveryMans.InsertOnSubmit(_DeliveryMan);
                db.SubmitChanges();
            }
        }

        public void UpdateDeliveryMan(DeliveryManModel deliveryMan)
        {
            using(DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_DeliveryMans where a.DeliveryManID == deliveryMan.DeliveryManID select a).FirstOrDefault();

                data.DeliveryName = deliveryMan.DeliveryName;
                data.PhoneNumber = deliveryMan.PhoneNumber;
                data.CityID = deliveryMan.CityID;

                db.SubmitChanges();
            }
        }

        public void DeleteDeliveryMan(int id)
        {
            using(DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_DeliveryMans where a.DeliveryManID == id select a).FirstOrDefault();

                db.tbl_DeliveryMans.DeleteOnSubmit(data);
                db.SubmitChanges();
            }
        }
    }
}