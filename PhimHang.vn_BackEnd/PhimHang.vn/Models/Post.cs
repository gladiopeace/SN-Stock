//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PhimHang.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Post
    {
        public Post()
        {
            this.NotificationMesseges = new HashSet<NotificationMessege>();
            this.PinStocks = new HashSet<PinStock>();
            this.PostComments = new HashSet<PostComment>();
            this.StockRelates = new HashSet<StockRelate>();
            this.UserRelates = new HashSet<UserRelate>();
        }
    
        public long PostId { get; set; }
        public string Message { get; set; }
        public int PostedBy { get; set; }
        public System.DateTime PostedDate { get; set; }
        public string ChartImageURL { get; set; }
        public Nullable<byte> NhanDinh { get; set; }
        public Nullable<bool> Vir { get; set; }
        public string StockPrimary { get; set; }
        public Nullable<bool> ChartYN { get; set; }
        public Nullable<int> SumLike { get; set; }
        public int SumReply { get; set; }
        public Nullable<byte> Priority { get; set; }
    
        public virtual ICollection<NotificationMessege> NotificationMesseges { get; set; }
        public virtual ICollection<PinStock> PinStocks { get; set; }
        public virtual ICollection<PostComment> PostComments { get; set; }
        public virtual UserLogin UserLogin { get; set; }
        public virtual ICollection<StockRelate> StockRelates { get; set; }
        public virtual ICollection<UserRelate> UserRelates { get; set; }
    }
}
