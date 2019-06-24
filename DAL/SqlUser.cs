using IDAL;
using Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class SqlUser : IUser
    {
        CatpuziEntities db = new CatpuziEntities();

        #region 通过用户名获取用户
        public UserInfo GetUserByName(string userName)
        {
            UserInfo users = (from u in db.UserInfo
                              where u.user_name == userName
                              select u).FirstOrDefault();
            return users;
        }
        #endregion
        #region 通过ID获取用户
        public UserInfo GetUserByID(int userID)
        {
            UserInfo users = (from u in db.UserInfo
                              where u.user_id == userID
                              select u).FirstOrDefault();
            return users;
        }
        #endregion
        #region 登录
        public int Login(UserInfo user)
        {

            var users = from u in db.UserInfo
                        where u.user_name == user.user_name && u.password == user.password
                        select u;
            int result = users.Count();
            return result;
        }
        #endregion

        public void InsertUser(UserInfo user)
        {
            db.UserInfo.Add(user);
            db.SaveChanges();
        }

        public List<UserInfo> SelectUser(string userName)
        {
            var users = (from u in db.UserInfo
                         where u.user_name == userName
                         select u).ToList();
            return users;
        }

        public Shop Shop(int id)//通过用户id查询该用户拥有的店铺
        {
            var shop = (from p in db.Shop select p).Where(p => p.user_id == id).FirstOrDefault();
            return shop;
        }

        public List<Cat> Cat(int id)//通过店铺id获取 该店铺的6只猫咪
        {
            var cats = (from p in db.Cat select p).Where(p => p.shop_id == id).OrderByDescending(p => p.cat_id).ToList();
            return cats;
        }

        public List<info> Info(int id)//通过用户id获取该用户发表的资讯
        {
            var infos = (from p in db.info select p).Where(p => p.user_id == id).Take(10).OrderByDescending(p => p.info_id).ToList();
            return infos;
        }

        public List<infoComment> InfoComment(int id)//通过用户id获取评论信息
        {
            var comments = (from p in db.infoComment select p).Where(p => p.user_id == id).OrderByDescending(p => p.infoComment_id).ToList();
            return comments;
        }

        public List<infoReply> InfoReply(int id)//通过用户id获取回复信息
        {
            var replys = (from p in db.infoReply select p).Where(p => p.user_id == id).OrderByDescending(p => p.infoReply_id).ToList();
            return replys;
        }

        public void UpdateUserInfo(UserInfo user)
        {
            //db.Configuration.ValidateOnSaveEnabled = false;
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            //db.Configuration.ValidateOnSaveEnabled = true;
        }
    }
}
