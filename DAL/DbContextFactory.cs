using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Runtime.Remoting.Messaging;

namespace DAL
{
    public class DbContextFactory
    {
        //CallContext 是类似于方法调用的线程本地存储区的专用集合对象，并提供对每个逻辑执行线程都唯一的数据槽。
        //数据槽不在其他逻辑线程上的调用上下文之间共享。当 CallContext 沿执行代码路径往返传播并且由该路径中的各个对象检查时，
        //可将对象添加到其中。
        //不能每次使用EF上下文都通过new来创建对象，因为在不同层中使用EF上下文时就不在是同一个上下文对象了。
        //我们可能会考虑使用单例模式，但是不能通过单例模式来解决EF上下文对象的问题，因为如果使用单例模式，那么大家都共用一个EF上下文对象一直不能释放，一旦释放，其他正在使用的用户用不了了。
        //可以考虑一次请求中使用一个EF上下文对象。这样既不影响其他用户的操作，也减少了数据库连接，即线程内唯一对象，因为一个请求就是一个线程。
        public static CatpuziEntities CreateDbContext()
        {
            CatpuziEntities dbContext = (CatpuziEntities)CallContext.GetData("dbContext");
            if (dbContext == null)
            {
                dbContext = new CatpuziEntities();
                CallContext.SetData("dbContext", dbContext);
            }
            return dbContext;
        }
    }
}
