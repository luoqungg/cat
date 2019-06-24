using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Catpuzi.Models;
using Models;

namespace Catpuzi.Controllers
{
    public class PublishController : Controller
    {
        public CatpuziEntities db = new CatpuziEntities();
        // GET: Publish
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Menu()
        {
            var catClassName = (from p in db.catClass select p);
            var infoClass = (from p in db.infoClass select p);
            var goodsClass = (from p in db.goodClass select p);
            PublishViewModel publish = new PublishViewModel();
            publish.CatClass = catClassName;
            publish.InfoClass = infoClass;
            publish.GoodsClass = goodsClass;
            return View(publish);
        }
        [HttpPost]
        public ActionResult Menu(string name, byte sex, int price, string filepath)
        {
            Cat fs = new Cat();
            try
            {
                if (Session["UserName"] != null)
                {
                    int userID = Convert.ToInt32(Session["UserID"]);
                    Shop shop = (from p in db.Shop select p).Where(p => p.user_id == userID).FirstOrDefault();
                    Cat cat = (from p in db.Cat select p).Where(p => p.catClass.catClass_name == name).First();
                    if (filepath != null)
                    {
                        string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                        string serverpath = Server.MapPath(@"/images/info/") + filename;
                        string relativepath = @"/images/info/" + filename;
                        int shopid = shop.shop_id;
                        int catclassid = (int)cat.catClass_id;
                        fs.cat_img = relativepath;
                        fs.shop_id = shopid;
                        fs.catClass_id = catclassid;
                        fs.cat_sex = sex;
                        fs.cat_price = price;
                        db.Cat.Add(fs);
                        db.SaveChanges();
                        return Content("");
                    }
                    else
                    {
                        return Content("");
                    }
                }
                else
                {

                    return Content("");
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }
        }//发布猫咪

        [HttpPost]
        public ActionResult PublishInfo(string name, string title, string content, string filepath)
        {
            info fs = new info();
            int userID = Convert.ToInt32(Session["UserID"]);
            info info = (from p in db.info select p).Where(p => p.infoClass.infoClass_name == name).First();
            string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
            string serverpath = Server.MapPath(@"/images/info/") + filename;
            string relativepath = @"/images/info/" + filename;
            int infoclassid = info.infoClass_id;
            fs.user_id = userID;
            fs.infoClass_id = infoclassid;
            fs.info_img = relativepath;
            fs.info_title = title;
            fs.info_content = content;
            db.info.Add(fs);
            db.SaveChanges();
            return Content("");
        }//发布资讯

        [HttpPost]
        public ActionResult PublishGoods(string name,int price,string introduce,string filepath)
        {
            Goods fs = new Goods();
            int userID = Convert.ToInt32(Session["UserID"]);
            Goods good = (from p in db.Goods select p).Where(p => p.goodClass.goodClass_name == name).First();
            Shop shop = (from p in db.Shop select p).Where(p => p.user_id == userID).First();
            string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
            string serverpath = Server.MapPath(@"/images/info/") + filename;
            string relativepath = @"/images/info/" + filename;
            int goodclassid = good.goodClass_id;
            int shopid = shop.shop_id;
            fs.goodClass_id = goodclassid;
            fs.good_img = relativepath;
            fs.shop_id = shopid;
            fs.good_price = price;
            fs.good_introduce = introduce;
            db.Goods.Add(fs);
            db.SaveChanges();
            return Content("");
        }//发布商品
    }
}