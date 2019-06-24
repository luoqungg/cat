using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;
namespace Catpuzi.Models
{
    public class CartModel
    {
        public int NUM { get;set; }
        public string GOOD_INTRODUCE{ get; set; }
        public int GOOD_PRICE { get; set; }
        public string GOOD_IMG { get; set; }
        public int cart_id { get; set; }
    }
}
