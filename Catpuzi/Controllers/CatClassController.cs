using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Models;

namespace Catpuzi.Controllers
{
    public class CatClassController : Controller
    {
        CatClassManager classManager = new CatClassManager();
        // GET: CatClass
        public ActionResult ClassIndex()
        {
            IEnumerable<catClass> cs = classManager.ClassName();
            return View(cs);
        }
    }
}