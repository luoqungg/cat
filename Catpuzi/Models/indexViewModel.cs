using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;

namespace Catpuzi.Models
{
    public class indexViewModel
    {
        public IEnumerable<Cat> Cat { get; set; }
        public IEnumerable<Cat> Buou { get; set; }

        public IEnumerable<Cat> XianLuo { get; set; }

        public IEnumerable<Cat> Yd { get; set; }

        public IEnumerable<Cat> Recommend { get; set; }

        public IEnumerable<info> Post { get; set; }
    }
}