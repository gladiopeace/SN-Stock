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
    
    public partial class PinStock
    {
        public long ID { get; set; }
        public string StockCodePin { get; set; }
        public long PostId { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> WhoPost { get; set; }
    
        public virtual Post Post { get; set; }
    }
}
