using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;

namespace DAL
{
    public class sqlCatClass : IVarieties
    {
        CatpuziEntities db = new CatpuziEntities();
        public IEnumerable<catClass> ClassName()
        {
            var data = (from p in db.catClass select p).OrderBy(p=>p.catClass_id);
            return data;
        }
    }
}
