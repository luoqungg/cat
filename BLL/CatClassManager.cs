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
    public class CatClassManager
    {
        IVarieties ivarieties = DataAccess.CreateCatClass();

        public IEnumerable<catClass> ClassName()
        {
            return ivarieties.ClassName();
        }
    }
}
