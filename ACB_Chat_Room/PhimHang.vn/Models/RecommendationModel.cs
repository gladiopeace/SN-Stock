﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PhimHang.Models
{
    public class RecommendationModel
    {
    }

    public class BuyRecommendModel
    {
        [Required(ErrorMessage= "Chọn 1 mã cổ phiếu")]
        [Display(Name = "Mã cổ phiếu")]
        [MaxLength(10)]
        public string StockCode { get; set; }

        [Required(ErrorMessage = "Yêu cầu chọn loại MUA hoặc BÁN")]
        [Display(Name = "Loại khuyến nghị")]        
        
        public string TYPERecommend { get; set; }

        [Required(ErrorMessage = "Vùng giá mua, ví dụ: 20.3")]
        [Display(Name = "Vùng giá mua")]        
        [DataType(DataType.Currency)]
        public decimal BuyPrice { get; set; }

        [Required(ErrorMessage = "Nhập thời gian nắm giữ (ngày), ví dụ: 3")]
        [Display(Name = "Thời gian nắm giữ (ngày)")]        
        public int StockHoldingTime { get; set; }

        [Required(ErrorMessage = "Vùng giá bán ")]
        [Display(Name = "Vùng giá bán Required")]
        [DataType(DataType.Currency, ErrorMessage ="Bạn phải nhập số, ví dụ: 12.5")]        
        public decimal TargetSell { get; set; }

        [Required(ErrorMessage= "Nhập chi tiết khuyến nghị")]
        [StringLength(512, ErrorMessage = "Nhập ít nhất 10 từ, nhiều nhất 512 ký tự", MinimumLength = 10) ]
        [Display(Name = "Chi tiết khuyến nghị")]
        public string Description { get; set; }
                

    }
    public class SellRecommendModel
    {

    }
}