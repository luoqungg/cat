using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace IDAL
{
    public interface ICat
    {

        IEnumerable<Cat> getCat();//获取所有猫
        IEnumerable<Cat> getBuou();//获取布偶猫（首页展示）

        IEnumerable<Cat> getXianLuo();//获取加菲猫（首页展示）

        IEnumerable<Cat> getyd();//获取英国短毛猫（首页展示）

        IEnumerable<Cat> getRecommend();//获取推荐（首页展示）

        IEnumerable<catClass> getName();//获取所有类别名称

        Cat getCatByID(int id);//通过猫咪ID获取猫咪

        IEnumerable<Cat> getByShopId(int id); //通过店铺ID获取 该店铺的10只猫咪 通过猫咪ID进行降序排序


        IEnumerable<Cat> Cats(int? price, string name = null);//通过价格和猫咪类型名称获取猫咪


        Shop Shop(int id); //通过猫咪的外键shop_id获取店铺

        UserInfo User(int id);//通过店铺id获取店主（用户）
    }
}
