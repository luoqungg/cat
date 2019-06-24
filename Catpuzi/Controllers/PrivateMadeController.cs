using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Catpuzi.Models;
using PagedList;
using System.Net;
using Models;


namespace Plates.Controllers
{
    public class PrivateMadeController : Controller
    {
        CatpuziEntities db = new CatpuziEntities();
        // GET: PrivateMade

        public ActionResult Index3()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index3(MakePrivate makeprivate)
        {


            //int myprivate_id = Convert.ToInt32(Request["myprivate_id"]);
            //string tools = Request["tools"];

            if (Session["username"] == null)
            {

                return Content("<script>;alert('请先登录!');history.go(-1);</script>");
            }
            else
            {


                //if (ModelState.IsValid)
                //{
                //makeprivate.myprivate_id = myprivate_id;
                makeprivate.Users_id = Convert.ToInt32(Session["userid"].ToString());
                makeprivate.customname = Request["txtCustomname"];
                //makeprivate.count=Convert.ToInt32(Request["txtCount"]);
                makeprivate.dates = Convert.ToDateTime(Request["txtDates"]);
                makeprivate.destination = Request["txtDestination"];
                //makeprivate.email=Request["txtEmail"];
                makeprivate.expenses = Convert.ToInt32(Request["txtExpenses"]);
                makeprivate.notes = Request["txtNotes"];
                //makeprivate.FoodType=Request["txtFoodType"];
                makeprivate.tools = Request["txtTools"];
                makeprivate.phone = Request["txtPhone"];
                db.MakePrivate.Add(makeprivate);
                db.SaveChanges();
                return Content("<script>;alert('提交成功，我们会尽快联系您为您提供服务!');window.location.href='/Home/Index'</script>");

                //}
                //else
                //{
                //    return Content("<script>;alert('提交失败！');history.go(-1)</script>");
                //}

            }
            //return View(makeprivate);
        }



    }
}