using DALFactory;
using IDAL;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UserManager
    {
        IUser iuser = DataAccess.CreateUser();

        public int Login(UserInfo user)
        {
            return iuser.Login(user);
        }

        public UserInfo GetUserByName(string userName)//通过用户名获取用户
        {
            return iuser.GetUserByName(userName);
        }

        public UserInfo GetUserByID(int userID)//通过id获取用户
        {
            return iuser.GetUserByID(userID);
        }

        public List<UserInfo> SelectUser(string userName)//通过用户名查询用户并返回一个列表
        {
            return iuser.SelectUser(userName);
        }

        public void InsertUser(UserInfo user)
        {
            iuser.InsertUser(user);
        }


        public Shop Shop(int id)//通过用户id获取该用户的店铺
        {
            return iuser.Shop(id);
        }

        public List<Cat> Cat(int id)//通过店铺id获取的猫咪
        {
            return iuser.Cat(id);
        }

        public List<info> Infos(int id)//通过用户id获取用户发表的资讯
        {
            return iuser.Info(id);
        }

        public List<infoComment> InfoComments(int id)//通过用户id获取用户的评论
        {
            return iuser.InfoComment(id);
        }

        public List<infoReply> InfoReply(int id)//通过用户id获取用户的回复
        {
            return iuser.InfoReply(id);
        }

        public void UpdateUserInfo(UserInfo user)
        {
            iuser.UpdateUserInfo(user);
        }
    }
}
