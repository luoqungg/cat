using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAL
{
   public interface IInfo
    {

        List<info> Selectinfo(int infoClassid);//通过用户名查询用户
        List<info> Getinfo(int infoid);//通过id获取用户信息
    }
}
