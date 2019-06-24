using Catpuzi.Models;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;

namespace Catpuzi.Controllers
{
    public class GoodsController : Controller
    {
        GoodsManager goodManager = new GoodsManager();
        public CatpuziEntities db = new CatpuziEntities();
        // GET: Goods
        public ActionResult Index()
        {
            var list = goodManager.Getinfo();
            var index = new GoodsModel()
            {
                GOODS=list
            };
            
            return View(index);
        }
        public ActionResult Detail(int id)
        {
            Session["ID"] = (int)id;
            var list = from n in db.Goods.Where(n=>n.good_id ==id)  select n;

            int id1 = Convert.ToInt32(Session["userid"]);
            Session["Fs_id"] = id;
            var list2 = from m in db.goodReply
                        from n in db.goodComment
                        where n.goodComment_id==m.goodComment_id
                        //join n in db.goodComment on m.goodComment_id equals n.goodComment_id
                        //where n.goodComment_id == m.goodComment_id
                        select new UserReplyModel
                        {
                            REPLY = m.reply,
                            ADDTIME = (m.addtime).ToString(),
                            USER_IMG = m.UserInfo.user_head,
                        };
            //var list3 = from n in list2.Where(n => n.FS_COMMENTID == id) select n;
            var list1 = from n in db.goodComment
                        where n.good_id == id

                        select new UserCommentModel
                        {
                            GOOD_COMMENTID = n.goodComment_id,
                            COMMENT = n.comment,
                            USER_ID = n.UserInfo.user_id,
                            USER_IMG = n.UserInfo.user_head,
                            USER_NAME = n.UserInfo.user_name,


                        };
            int comment_id = Convert.ToInt32(Request["comment_id"]);

            var index = new GoodsModel()
            {
                USERCOMMENT=list1,
                FOODSHAREREPLY =list2,
                GOODS = list
            };
            return View(index);
        }
        [HttpPost]
        public ActionResult Collection(Cart goods, int? num)
        {
            if (Session["userid"] != null)
            {
                int id = (int)Session["ID"];
                goods.user_id = (int)Session["userid"];
                goods.good_id = id;
                if (num <= 0) { return Content("<script>;alert('数量不可小于0!');history.go(-1);</script>"); }
                if(num == null) { return Content("<script>;alert('数量不可为空!');history.go(-1);</script>"); }
                goods.num = num;
                db.Cart.Add(goods);
                db.SaveChanges();
                return Content("<script>;alert('加入成功!');history.go(-1);</script>");
            }
            else
            {
                return Content("<script>;alert('请先登录!');history.go(-1);</script>");

            }
        }
        [HttpPost]
        public ActionResult Pingluen(string a, goodComment Comment)
        {

            if (Session["UserName"] != null)
            {
                if (a != "")
                {
                    string comment = a;
                    Comment.comment = comment;
                    Comment.good_id = (int)Session["ID"];
                    Comment.user_id = (int)Session["UserID"];
                    Comment.addtime = System.DateTime.Now;
                    db.goodComment.Add(Comment);
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
                return Content("<script>;alert('请先登录!');</script>");
            }
        }
        [HttpPost]
        public ActionResult Reply(string reply, goodReply goodReply)
        {
            int comment_id = Convert.ToInt32(Request["comment_id"]);
            if (Session["UserName"] != null)
            {
                string comment = reply;
                goodReply.goodComment_id = comment_id;
                goodReply.reply = comment;
                //goodReply.Fs_id = (int)Session["ID"];
                goodReply.user_id = (int)Session["UserID"];
                goodReply.addtime = System.DateTime.Now;
                //foodShareReply.FsComment_id =;
                db.goodReply.Add(goodReply);
                db.SaveChanges();
                return Content(reply);
            }
            else
            {
                return Content("<script>;alert('请先登录!');</script>");
            }

        }

    }
}