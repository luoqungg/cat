using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;
namespace Catpuzi.Models
{
    public class UserCommentModel
    {
        public int GOOD_COMMENTID { get; set; }
        public string COMMENT { get; set; }
        public string GOOD_ID { get; set; }
        public string ADDTIME { get; set; }
        public int USER_ID { get; set; }
        public string USER_NAME { set; get; }
        public string USER_IMG { set; get; }

        public string REPLY { get; set; }
    }
}