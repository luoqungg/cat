using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using Catpuzi.Attributes;
using Catpuzi.Models;

namespace Catpuzi.Controllers
{
    [IsLogIn(IsCheck = false)]//判断是否登陆
    public class UserController : Controller
    {
        UserManager userManager = new UserManager();//调用BLL层
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        #region 登录
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserInfo user, string returnUrl)
        {
            string ValidateCode = Request.Form["txtverifcode"];//获取验证码填写框的字符
            string userName = Request.Form["user"];
            if (ValidateCode != Session["ValidateCode"].ToString())
            {
                return Content("<script>;alert('验证码错误！');history.go(-1)</script>");
            }
            try
            {
                int u = userManager.Login(user);
                if (u > 0)
                {
                    Session["UserName"] = user.user_name;
                    UserInfo users = userManager.GetUserByName(Session["UserName"].ToString());//调用BLL中GetUserByName方法
                    Session["UserID"] = users.user_id;
                    Session["userHead"] = users.user_head;
                    if (returnUrl != null)//如果else里面的window.open不等于null
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return Redirect(Url.Action("Index", "Home"));
                    }
                }
                else
                {
                    return Content("<script>alert('用户名或密码错误！');window.open('" + Url.Content("~/User/Login") + "', '_self')</script>");
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }
        }
        #endregion

        #region 注册
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserInfo user)
        {
            try
            {
                var userName = userManager.SelectUser(user.user_name);
                if (ModelState.IsValid && userName.Count() == 0)
                {
                    userManager.InsertUser(user);
                    Session["UserName"] = user.user_name;
                    UserInfo users = userManager.GetUserByName(user.user_name);
                    Session["UserID"] = users.user_id.ToString();
                    return Content("<script>alert('注册成功！');window.open('" + Url.Action("Index", "Home") + "','_self');</script>");
                }
                else
                {
                    return View(user);
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }
        }
        #endregion

        #region 退出登录

        public ActionResult LoginOff()
        {
            Session["UserID"] = null;
            return Content("<script>alert('账号退出成功');window.open('" + Url.Action("Index", "Home") + "','_self');</script>");
        }
        #endregion

        #region 个人中心

        public ActionResult UserCenter()
        {
            var userID = Convert.ToInt32(Session["UserID"]);
            var user = userManager.GetUserByID(userID);
            var shop = userManager.Shop(userID);
            var cats = userManager.Cat(shop.shop_id);
            var infos = userManager.Infos(userID);
            var comments = userManager.InfoComments(userID);
            var replys = userManager.InfoReply(userID);

            var userCenterViewModel = new UserCenterViewModel()
            {
                User = user,
                Shop = shop,
                Cats = cats,
                Infos = infos,
                Comments = comments,
                Replys = replys
            };

            return View(userCenterViewModel);
        }
        #endregion

        public ActionResult Edit()
        {
            var data = userManager.GetUserByID(Convert.ToInt32(Session["UserID"]));
            return View(data);
        }


        [HttpPost]
        public ActionResult Edit(int id,string name,UserInfo user)
        {

            user.user_id = id;
            user.user_name = name;

            userManager.UpdateUserInfo(user);
            return Content("");
        }
    }
}