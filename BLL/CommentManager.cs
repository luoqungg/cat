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
  public  class CommentManager
    {
        //int id = Session["info_id"];
        IInfo iinfo = DataAccess.CreateInfo();
        CatpuziEntities db = DbContextFactory.CreateDbContext();
        public IEnumerable<infoComment> Selectinfo(int infoid)
        {
            var list = from n in db.infoComment.Where(n => n.info_id == infoid) select n;
            return list;
        }
    }
}
