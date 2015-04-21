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
    
    public partial class UserLogin
    {
        public UserLogin()
        {
            this.AspNetUsers = new HashSet<AspNetUser>();
            this.FollowStocks = new HashSet<FollowStock>();
            this.FollowUsers = new HashSet<FollowUser>();
            this.FollowUsers1 = new HashSet<FollowUser>();
            this.NotificationMesseges = new HashSet<NotificationMessege>();
            this.NotificationMesseges1 = new HashSet<NotificationMessege>();
            this.StockViewLastests = new HashSet<StockViewLastest>();
            this.UserRelates = new HashSet<UserRelate>();
            this.UserViewLastests = new HashSet<UserViewLastest>();
            this.UserViewLastests1 = new HashSet<UserViewLastest>();
            this.PostComments = new HashSet<PostComment>();
            this.Posts = new HashSet<Post>();
        }
    
        public int Id { get; set; }
        public string KeyLogin { get; set; }
        public string UserNameCopy { get; set; }
        public Nullable<System.DateTime> BirthDate { get; set; }
        public string AvataImage { get; set; }
        public string AvataCover { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int Verify { get; set; }
        public int AccountType { get; set; }
        public int LockAccount { get; set; }
        public string Status { get; set; }
        public string Mobile { get; set; }
        public Nullable<byte> JobTitle { get; set; }
        public string URLFacebook { get; set; }
        public string CVInfo { get; set; }
        public Nullable<byte> NumberExMarketYear { get; set; }
        public Nullable<byte> PhilosophyMarket { get; set; }
        public Nullable<bool> BrokerVIP { get; set; }
        public string CoverPosition { get; set; }
    
        public virtual ICollection<AspNetUser> AspNetUsers { get; set; }
        public virtual ICollection<FollowStock> FollowStocks { get; set; }
        public virtual ICollection<FollowUser> FollowUsers { get; set; }
        public virtual ICollection<FollowUser> FollowUsers1 { get; set; }
        public virtual ICollection<NotificationMessege> NotificationMesseges { get; set; }
        public virtual ICollection<NotificationMessege> NotificationMesseges1 { get; set; }
        public virtual ICollection<StockViewLastest> StockViewLastests { get; set; }
        public virtual ICollection<UserRelate> UserRelates { get; set; }
        public virtual ICollection<UserViewLastest> UserViewLastests { get; set; }
        public virtual ICollection<UserViewLastest> UserViewLastests1 { get; set; }
        public virtual JobTitile JobTitile { get; set; }
        public virtual Philosophy Philosophy { get; set; }
        public virtual ICollection<PostComment> PostComments { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
