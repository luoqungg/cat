using DAL;
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
    public class InfoManager
    {
        IInfo iinfo = DataAccess.CreateInfo();
        CatpuziEntities db = DbContextFactory.CreateDbContext();
        public IEnumerable<info> SelectInfo()//Select方法搜索一个列表
        {
            //var info = iinfo.SelectInfo();
            //return info;

            var list = db.info.OrderBy(n => n.info_id).Skip(0).Take(15);  //可以实现分页
            return list;
            //return iinfo.Selectinfo(info);
        }
        public IEnumerable<info> SelectInfo1()//Select方法搜索一个列表
        {
            //var info = iinfo.SelectInfo();
            //return info;

            var list = db.info.OrderBy(n => n.info_id).Skip(15).Take(30);  //可以实现分页
            return list;
            //return iinfo.Selectinfo(info);
        }
        public IEnumerable<info> GetInfo(int infoid)
        {
            var list = from n in db.info.Where(n => n.info_id == infoid) select n;
            return list;
        }
    }
}
