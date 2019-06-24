using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;
using DALFactory;

namespace BLL
{
    public class CatManager
    {
        ICat icat = DataAccess.CreateCat();

        public IEnumerable<Cat> getCat()//获取所有猫
        {
            return icat.getCat();
        }

        public IEnumerable<Cat> getBuou()//获取布偶猫
        {
            return icat.getBuou();
        }

        public IEnumerable<Cat> getXianLuo()//获取暹罗猫
        {
            return icat.getXianLuo();
        }

        public IEnumerable<Cat> getRecommend()//获取推荐
        {
            return icat.getRecommend();
        }

        public IEnumerable<Cat> getYd()//获取英国短毛猫
        {
            return icat.getyd();
        }

        public IEnumerable<catClass> getName()//获取所有类型名称
        {
            return icat.getName();
        }

        public Cat getCatByID(int id)//根据id获取猫咪
        {
            return icat.getCatByID(id);
        }

        public IEnumerable<Cat> getByShopId(int id)//通过店铺ID获取 该店铺的10只猫咪 通过猫咪ID进行降序排序
        {
            return icat.getByShopId(id);
        }


        public IEnumerable<Cat> Cats(int? price,string name=null)//通过价格和猫咪类型名称获取猫咪
        {
            return icat.Cats(price, name);
        }

        public Shop Shop(int id)//通过猫咪id获取该猫咪所在的店铺
        {
            return icat.Shop(id);
        }


        public UserInfo User(int id)//通过店铺id获取店主信息（用户信息）
        {
            return icat.User(id);
        }
    }
}
