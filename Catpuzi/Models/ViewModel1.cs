using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Catpuzi.Models;
using Models;

namespace Catpuzi.Models
{
    public class ViewModel1
    {
        public PagedList.IPagedList<info> INFO { get; set; }

        public IEnumerable<info> INFO1 { get; set; }

    }
}