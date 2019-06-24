using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;

namespace DAL
{
    public class sqlCat : ICat
    {
        CatpuziEntities db = new CatpuziEntities();
        public IEnumerable<Cat> getBuou()//获取布偶猫
        {

            var data = from p in db.Cat select p;
            data = data.Where(u => u.catClass_id == 1).OrderByDescending(u => u.cat_id).Take(8);

            return data;
        }

        public IEnumerable<Cat> getXianLuo()//获取加菲猫
        {
            var data = from p in db.Cat select p;
            data = data.Where(u => u.catClass_id == 2).OrderByDescending(u => u.cat_id).Take(8);

            return data;
        }
        public IEnumerable<Cat> getCat()//获取所有猫
        {
            var data = (from p in db.Cat select p).OrderByDescending(u => u.cat_id);
            return data;
        }


        public IEnumerable<Cat> getRecommend()//获取推荐
        {
            var data = (from p in db.Cat select p).Where(u => u.isRecommend == 1).OrderByDescending(u => u.cat_price).Take(8);
            return data;
        }

        public IEnumerable<Cat> getyd()//获取英国短毛猫
        {
            var data = (from p in db.Cat select p).Where(u => u.catClass_id == 4).OrderByDescending(u => u.cat_price).Take(8);
            return data;
        }

        public IEnumerable<catClass> getName()//获取猫咪类别名称
        {
            var data = (from p in db.catClass select p).OrderByDescending(u => u.catClass_id);
            return data;
        }

        public Cat getCatByID(int id)//通过id来查询猫咪
        {
            var data = (from p in db.Cat select p).Where(p => p.cat_id == id).FirstOrDefault();

            return data;
        }

        public IEnumerable<Cat> getByShopId(int id)//通过店铺ID获取 该店铺的10只猫咪 通过猫咪ID进行降序排序
        {
            var data = (from p in db.Cat select p).Where(p => p.shop_id == id).OrderByDescending(u=>u.cat_id).Take(10);
            return data;
        }

        public IEnumerable<Cat> Cats(int? price, string name = null)//通过价格和猫咪类型名称获取猫咪
        {
            if (name == "不限" && price == 0)
            {
                var data = getCat();
                return data;
            }
            else if (name == "不限" && price != 0)
            {
                var cats = (from p in db.Cat select p).Where(p => p.cat_price >= price);
                return cats;
            }
            else
            {
                var data = (from p in db.Cat select p)
                           .Where(p => p.catClass.catClass_name == name)
                           .Where(p => p.cat_price >= price);
                return data;
            }
        }

        public Shop Shop(int id) //通过猫咪的外键shop_id获取店铺
        {
            var data = (from p in db.Shop
                       join m in db.Cat on p.shop_id equals id
                       select p).FirstOrDefault();

            return data;
        }

        public UserInfo User(int id)//通过店铺id获取店主
        {
            var data = (from p in db.UserInfo
                        join m in db.Shop on p.user_id equals id select p).FirstOrDefault();
            return data;
        }
    }
}
