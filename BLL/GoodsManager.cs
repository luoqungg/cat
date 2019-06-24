using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Models;

namespace BLL
{
  public  class GoodsManager
    {
        CatpuziEntities db = DbContextFactory.CreateDbContext();
        public IEnumerable<Goods> Getinfo()
        {
            var list = from n in db.Goods select n;
            return list;
        }
    }
}
