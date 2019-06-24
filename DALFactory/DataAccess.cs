using IDAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DALFactory
{
    public class DataAccess
    {
        //反射
        private readonly static string assemblyName = ConfigurationManager.AppSettings["Path"].ToString();
        //创建User
        public static IUser CreateUser()
        {
            string className = "DAL.SqlUser";
            return (IUser)Assembly.Load(assemblyName).CreateInstance(className);
        }

        //创建cat
        public static ICat CreateCat()
        {
            string className = "DAL.sqlCat";
            return (ICat)Assembly.Load(assemblyName).CreateInstance(className);
        }

        public static IVarieties CreateCatClass()
        {
            string className = "DAL.sqlCatClass";
            return (IVarieties)Assembly.Load(assemblyName).CreateInstance(className);
        }

        public static IInfo CreateInfo()
        {
            string className = "DAL.SqlInfo";
            return (IInfo)Assembly.Load(assemblyName).CreateInstance(className);
        }
        public static IInfo CreateComment()
        {
            string className = "DAL.SqlComment";
            return (IInfo)Assembly.Load(assemblyName).CreateInstance(className);
        }
        public static IGoods CreateGood()
        {
            string className = "DAL.SqlGood";
            return (IGoods)Assembly.Load(assemblyName).CreateInstance(className);
        }
    }
}
