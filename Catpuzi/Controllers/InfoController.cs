using BLL;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;

using DALFactory;
using Catpuzi.Models;

namespace Catpuzi.Controllers
{
    public class InfoController : Controller
    {
        private CatpuziEntities db = new CatpuziEntities();
        InfoManager infoManager = new InfoManager();//调用BLL层
        CommentManager commentManager = new CommentManager();                     //GET: Info
        UserManager userManager = new UserManager();
        public ActionResult Index(int page = 1)
        {
            var info1 = infoManager.SelectInfo();
            
            var index = new ViewModel()
            {
               INFO = info1.ToPagedList(page, 6),

            };
            return View(index);
        }
        public ActionResult Detail(int id, info info)
        {
            Session["info_id"] = id;
            string name=(string) Session["UserName"];
            //int id1 =(int) Session["userid"];
            var list = infoManager.GetInfo(id);
            var list1 = commentManager.Selectinfo(id);
            var list2 = userManager.SelectUser(name);
            var index = new CommentDetail()
            {
                INFO=list,
                INFO1=list1,
                USERINFO = list2
            };
            return View(index);
        }
        [HttpPost]
        public ActionResult Pingluen(string a, infoComment infoComment)
        {

            if (Session["UserName"] != null)
            {
                if (a != "")
                {
                    string comment = a;
                    infoComment.comment = comment;
                    infoComment.info_id = (int)Session["info_id"];
                    infoComment.user_id = (int)Session["userid"];
                    infoComment.addtime = System.DateTime.Now;
                    db.infoComment.Add(infoComment);
                    db.SaveChanges();
                    return Content(a);
                }
                else
                {
                    return Content("<script> alert('评论不能为空！'); </script>");
                }

            }
            else
            {
                return Content("<script>  alert('请先登录!');history.go(-1)</script>");
            }
        }

    }
}