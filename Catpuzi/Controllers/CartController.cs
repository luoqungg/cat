using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Catpuzi.Models;

namespace Catpuzi.Controllers
{
    public class CartController : Controller
    { CatpuziEntities db = new CatpuziEntities();
        // GET: Cart
        public ActionResult Index()
        {
            //string username = (string )Session["Username"];
            //var user = from n in db.UserInfo.Where(n => n.user_name == username) select n;
            //int id = (int)Session["userid"];
            if (Session["UserID"]!=  null)
            {
                int id = (int)Session["userid"];        
                var list = from n in db.Goods
                           //from m in db.Cart
                           join m in db.Cart on n.good_id equals m.good_id
                           from q in db.UserInfo
                           where m.user_id == id && q.user_id == id
                           select new CartModel
                           {
                               GOOD_IMG = n.good_img,
                               GOOD_INTRODUCE = n.good_introduce,
                               GOOD_PRICE = (int)n.good_price,
                               NUM =(int) m.num,
                               cart_id=m.cart_id
                               
                           };
                //var list1 = from n in db.Cart.Where(n => n.user_id == id) select n;
                var index = new GoodsModel
                {
                    CART=list
                };
                return View(index);
            }
            else
            {
                return Content("<script>;alert('您还未登陆！');history.go(-1)</script>");
            }
            
        }
        public ActionResult Remove(int id)
        {
            var existingCart = db.Cart.FirstOrDefault(p => p.cart_id == id);
            if (existingCart != null)
            {
                db.Cart.Remove(existingCart);
                db.SaveChanges();
                return Content("<script>;alert('移除成功！');window.location.href='/Cart/Index'</script>");
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        public void jiesuan(Order os)
        {
            os.user_id = (int)Session["userid"];
            os.order_time = System.DateTime.Now;
            os.address = ("江西师范大学");
            os.phone = ("15711111111");
            //os.total_price = a;
            db.Order.Add(os);
            db.SaveChanges();
           
        }
    }
    
}