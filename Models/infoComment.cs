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
    
    public partial class infoComment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public infoComment()
        {
            this.infoReply = new HashSet<infoReply>();
        }
    
        public int infoComment_id { get; set; }
        public Nullable<int> info_id { get; set; }
        public Nullable<int> user_id { get; set; }
        public string comment { get; set; }
        public Nullable<System.DateTime> addtime { get; set; }
    
        public virtual info info { get; set; }
        public virtual UserInfo UserInfo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<infoReply> infoReply { get; set; }
    }
}
