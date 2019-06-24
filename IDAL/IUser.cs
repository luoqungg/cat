using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace IDAL
{
     public interface IUser
    {
        int Login(UserInfo user);//登录
        UserInfo GetUserByName(string userName);//通过用户名获取用户信息
        void InsertUser(UserInfo user);//插入用户
        UserInfo GetUserByID(int userID);//通过id获取用户信息
        List<UserInfo> SelectUser(string userName);//通过用户名查询用户

        Shop Shop(int id);//通过用户id查询该用户拥有的店铺

        List<Cat> Cat(int id);//通过店铺id获取 该店铺的6只猫咪


        List<info> Info(int id);//通过用户id获取该用户发表的资讯

        List<infoComment> InfoComment(int id);//通过用户id获取用户发表的评论

        List<infoReply> InfoReply(int id);//通过用户id获取用户发表的回复

        void UpdateUserInfo(UserInfo user);//修改用户资料
    }
}
