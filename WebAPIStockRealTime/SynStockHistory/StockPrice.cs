//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SynStockHistory
{
    using System;
    using System.Collections.Generic;
    
    public partial class StockPrice
    {
        public long Id { get; set; }
        public string Code { get; set; }
        public Nullable<decimal> CeilingPrice { get; set; }
        public Nullable<decimal> FloorPrice { get; set; }
        public Nullable<decimal> DiffPrice { get; set; }
        public Nullable<decimal> OpenPrice { get; set; }
        public Nullable<decimal> HighPrice { get; set; }
        public Nullable<decimal> LowPrice { get; set; }
        public Nullable<decimal> ClosePrice { get; set; }
        public Nullable<System.DateTime> TradingDate { get; set; }
    }
}
