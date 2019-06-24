using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;
namespace Catpuzi.Models
{
    public class GoodsModel
    {
        public IEnumerable<Goods> GOODS { get; set; }
        public IQueryable<CartModel> CART { get; set; }
        public IEnumerable<UserCommentModel> USERCOMMENT { get; set; }
        public IEnumerable<UserReplyModel> FOODSHAREREPLY { get; set; }
    }
}