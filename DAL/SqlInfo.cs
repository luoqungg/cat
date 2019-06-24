using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;
namespace DAL
{
    public class SqlInfo : IInfo
    {
        CatpuziEntities db = new CatpuziEntities();

        public List<info> Selectinfo(int infoClassid)
        {
            //    var list = db.info.OrderBy(n => n.info_id).Skip(0).Take(13);  //可以实现分页
            //    return list;
            var users = (from u in db.info
                         where u.infoClass.infoClass_id == infoClassid
                         select u).ToList();
            return users;
        }
        public List<info> Getinfo(int infoid)
        {
            var users = (from u in db.info
                         where u.infoClass.infoClass_id == infoid
                         select u).ToList();
            return users;
            //var info1 = (from m in db.info
            //             where m.info_id == infoid
            //             select m);
            //return info1;
        }
    }
}
