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
    
    public partial class UserLogExtent
    {
        public long ID { get; set; }
        public string Username { get; set; }
        public string TokenResetPass { get; set; }
        public System.DateTime TimeResetExpire { get; set; }
        public bool IsReset { get; set; }
        public string EmailReset { get; set; }
        public string UserId { get; set; }
    }
}
