//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class VideoReply
    {
        public int VideoReply_id { get; set; }
        public Nullable<int> User_id { get; set; }
        public Nullable<int> Video_id { get; set; }
        public Nullable<int> VideoComment_id { get; set; }
        public string VideoReply_content { get; set; }
        public Nullable<System.DateTime> Addtime { get; set; }
    
        public virtual UserInfo UserInfo { get; set; }
        public virtual Video Video { get; set; }
        public virtual VideoComment VideoComment { get; set; }
    }
}