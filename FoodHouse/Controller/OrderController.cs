using FoodHouse.Model;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;

namespace FoodHouse.Controller
{
    public class OrderController
    {
        public void OrderInsert(OrderModel order,List<OrderDetailModel> orderDetail)
        {
            using(DbContextDataContext db=new DbContextDataContext())
            {
                tbl_Order _Order = new tbl_Order();
              
                _Order.CustomerID = order.CustomerID;
                _Order.ODate = order.ODate;
                _Order.ONumber = GetONumber(DateTime.Now.ToShortDateString());
                _Order.GrandTotal = order.GrandTotal;
                _Order.Status = "Order Pending";
                _Order.ShippingAddress = order.ShippingAddress;
                _Order.RID = order.RID;

                db.tbl_Orders.InsertOnSubmit(_Order);
                db.SubmitChanges();

                var OrderID = (from a in db.tbl_Orders select a.OID).Max();
                
            
                foreach(var data in orderDetail)
                {
                    tbl_OrderDetail _OrderDetail = new tbl_OrderDetail();
                    _OrderDetail.OID = OrderID;
                    _OrderDetail.FID = data.FID;
                    _OrderDetail.Quantity = data.Quantity;
                    _OrderDetail.Description = data.Description;
                    db.tbl_OrderDetails.InsertOnSubmit(_OrderDetail);
                    db.SubmitChanges();
                }
            }
        }

        public String GetONumber(String Date)
        {
            using(DbContextDataContext db=new DbContextDataContext())
            {
                var data = (from a in db.tbl_Orders where a.ODate == Date select a.ONumber).Max();
                if(data==null)
                {
                    return "00000001";
                }
                else
                {
                   
                    int onum =Convert.ToInt32(data) + 1;
                    return (string.Format("{0:D8}", onum));
                }
            }
        }
    }
}