using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAL
{
   public interface IComment
    {
        List<infoComment> Selectinfo(int infoClassid);//通过用户名查询用户
    }
}
