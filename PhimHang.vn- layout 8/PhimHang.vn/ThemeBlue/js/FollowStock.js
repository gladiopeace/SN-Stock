﻿$(document).ready(function () {
    $(".button-flow").click(function () {
        var stock = $('#stockHidenPage').val();
        $.ajax({
            cache: false,
            type: "POST",
            url: '/FollowStock/Create',
            data: { stock: stock },
            beforeSend: function (xhr) {
                $(".button-flow").hide();
            },
            success: function (data) {
                if (data == "A") {
                    showNotification('Đã thêm vào danh mục theo dõi');                    
                    $.wait(function () { $(".button-flow").html("<i class='fa fa-minus'></i>Đang theo dõi").fadeIn('slow'); }, 2);                    
                }
                else if (data == "R") {
                    showNotification('Đã loại khỏi danh mục theo dõi');                    
                    $.wait(function () { $(".button-flow").html("<i class='fa fa-plus'></i>Theo dõi").fadeIn('slow'); }, 2);
                } else {
                    alert('Lỗi');
                }
            }
        })
    });
});