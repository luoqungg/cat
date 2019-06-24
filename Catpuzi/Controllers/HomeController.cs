using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Models;
using Catpuzi.Models;

namespace Catpuzi.Controllers
{
    public class HomeController : Controller
    {
        CatManager catManager = new CatManager();
        CatpuziEntities db = new CatpuziEntities();
        public ActionResult Index()
        {
            var buou = catManager.getBuou();
            var xianluo = catManager.getXianLuo();
            var recommend = catManager.getRecommend();
            var yd = catManager.getYd();
            var post = (from p in db.info select p).OrderBy(p => p.info_id).Take(6);
            indexViewModel index = new indexViewModel();
            index.Yd = yd;
            index.Recommend = recommend;
            index.Buou = buou;
            index.XianLuo = xianluo;
            index.Post = post;
            return View(index);
        }
    }
}