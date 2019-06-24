using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Models;
using Catpuzi.Models;
using PagedList;

namespace Catpuzi.Controllers
{
    public class CatController : Controller
    {
        /*
            catManager.getCat()//获取所有猫咪 ，无条件的
                       getName()//获取所有猫咪类型名称
                       getCatByID()//通过猫咪ID获取猫咪
                       getByShopId()//通过店铺ID获取 该店铺的10只猫咪 通过猫咪ID进行降序排序
                       Cats(int? price,string name=null)//通过价格和猫咪类型名称获取猫咪
                       Shop(int id)//通过猫咪id获取该猫咪所在的店铺
                       User(int id)//通过店铺id获取店主（用户）
        */


        CatManager catManager = new CatManager();
        //private CatpuziEntities db = new CatpuziEntities();

        public ActionResult CatIndex()//筛选猫咪的主页
        {
            var className = catManager.getName();//获取所有类型名称
            var catIndex = new catIndexViewModel()
            {
                CatName = className
            };
            return View(catIndex);
        }

        public ActionResult Cat(int page =1)//展示猫咪的分布视图
        {
            var cats = catManager.getCat();
            var catIndex = new catIndexViewModel()
            {
                AllCats = cats,

            };
            return PartialView(catIndex);
        }

        [HttpPost]
        public ActionResult Cat(int? price,string name = null)//根据条件筛选符合条件的猫咪
        {
            
            var cats = catManager.Cats(price, name);//筛选条件放到DAL层中
            var catIndex = new catIndexViewModel();
            catIndex.AllCats = cats;
            return PartialView(catIndex);
        }

        [HttpGet]
        public ActionResult CatDetails(int id)//猫咪细节
        {
            var data = catManager.getCatByID(id);//通过ID获取猫咪
            var shop = catManager.Shop(Convert.ToInt32(data.shop_id));//通过猫咪id获取所在店铺
            var user = catManager.User(Convert.ToInt32(shop.user_id));//通过店铺id获取店主（用户）
            var cat = catManager.getByShopId(Convert.ToInt32(shop.shop_id));//通过店铺ID获取该店中的10只猫咪

            catIndexViewModel catIndex = new catIndexViewModel();
            catIndex.ByID = data;//通过ID获取猫咪
            catIndex.ByCatID = shop;//通过猫咪id获取所在店铺
            catIndex.ByShopID = user;//通过店铺id获取店主（用户）
            catIndex.BySId = cat;//通过店铺ID获取该店中的10只猫咪
            return View(catIndex);
        }


        //public ActionResult CatShop(int id)
        //{
        //    var data = catManager.getCatByID(id);//通过id获取猫咪
        //    var cat = catManager.getByShopId(id); //通过店铺ID获取 该店铺的10只猫咪 通过猫咪ID进行降序排序
        //    var shop = catManager.Shop(Convert.ToInt32(data.shop_id));//通过猫咪id获取所在店铺
        //    var user = catManager.User(Convert.ToInt32(shop.user_id));//通过店铺id获取店主（用户）
        //    catIndexViewModel catIndex = new catIndexViewModel();
        //    catIndex.BySId = cat;
        //    catIndex.ByCatID = shop;
        //    catIndex.ByShopID = user;
        //    return PartialView(catIndex);
        //}
    }
}