using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;

namespace Catpuzi.Models
{
    public class PublishViewModel
    {
        public IEnumerable<catClass> CatClass { get; set; }

        public IEnumerable<Cat> Cat { get; set; }

        public IEnumerable<infoClass> InfoClass { get; set; }


        public IEnumerable<goodClass> GoodsClass { get; set; }
    }
}