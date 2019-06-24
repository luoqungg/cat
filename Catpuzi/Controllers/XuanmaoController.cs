using BLL;
using PagedList;
using Catpuzi.Models;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Catpuzi.Controllers
{
    public class XuanmaoController : Controller
    {
        private CatpuziEntities db = new CatpuziEntities();
        InfoManager infoManager = new InfoManager();//调用BLL层
                                                    //GET: Info

        public ActionResult Index(int page = 1)
        {
            var info1 = infoManager.SelectInfo1();

            var index = new ViewModel1()
            {
                INFO = info1.ToPagedList(page, 6),

            };
            return View(index);
        }
        public ActionResult Detail(int id, info info)
        {
            var list = infoManager.GetInfo(id);
            return View(list);
        }
    }
}