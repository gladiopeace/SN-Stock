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
    
    public partial class Group_User_Messege
    {
        public long Id { get; set; }
        public int GroupId { get; set; }
        public string WhoChat { get; set; }
        public string ConentMesseger { get; set; }
        public System.DateTime CreatedDate { get; set; }
    
        public virtual Group Group { get; set; }
    }
}
