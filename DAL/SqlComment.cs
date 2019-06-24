using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;
namespace DAL
{
    class SqlComment
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
    }
}
