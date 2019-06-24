using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;

namespace Catpuzi.Models
{
    public class UserCenterViewModel
    {
        public UserInfo User { get; set; }//通过用户id获取的用户

        public Shop Shop { get; set; }//通过用户id获取该用户的店铺

        public List<Cat> Cats { get; set; }//通过店铺id获取该店的猫咪

        public List<info> Infos { get; set; }//通过用户id获取用户发表的信息

        public List<infoComment> Comments { get; set; }//通过用户id获取用户发表的评论

        public List<infoReply> Replys { get; set; }//通过用户id获取用户发表的回复

    }
}