using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;
namespace Catpuzi.Models
{
    public class CommentDetail
    {
        public IEnumerable<info> INFO { get; set; }
        public IEnumerable<infoComment> INFO1 { get; set; }
        public IEnumerable<UserInfo> USERINFO { get; set; }
    }
}