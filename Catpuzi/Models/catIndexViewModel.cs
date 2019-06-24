using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;

namespace Catpuzi.Models
{
    public class catIndexViewModel
    {
        public PagedList.IPagedList<Cat> Page { get; set; }

        //public PagedList.IPagedList<Cat> AllCats { get; set; }
        public IEnumerable<Cat> AllCats { get; set; }//所有猫咪

        public IEnumerable<catClass> CatName { get; set; }//所有猫咪类型的名称

        public IEnumerable<Cat> BySId { get; set; }//通过店铺ID获取该店中的10只猫咪

        public Shop ByCatID { get; set; }//通过ID获取猫咪 
        public UserInfo ByShopID { get; set; }//通过猫咪id获取所在店铺
        public Cat ByID { get; set; }//通过店铺id获取店主（用户）
    }
}