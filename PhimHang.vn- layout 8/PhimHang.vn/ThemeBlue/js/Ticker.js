﻿// khi sua link hinh image can chu y sua : self.Message , self.Char, controller, click vao detail, 

function removeFileChart() {
        if (confirm("Bạn muốn xóa file hình này?")) {
            $('.chartImage').hide();
            $('.mb3-chart-thumb').removeAttr("src");
        }
}

function CreateDropListBoxMore(postid) {
    checkStatusDeleteButton(postid, function (d) {
        var dropboxHtml = '<div id="jq-dropdown-2" class="dropdown dropdown-tip dropdown-anchor-left dropdown-relative" style="left: -5px; z-index:999">'
                               + '<ul class="dropdown-menu">';
        if (d === true) {
            dropboxHtml = dropboxHtml + '<li><a href="javascript:;" data-bind=" click: function(data, event) { deletePost(' + postid + ', event);} "  title="Xóa bài viết">Xóa bài viết</a></li>';//
        }
        dropboxHtml = dropboxHtml + '<li><a href="javascript:;" onclick="LoadBaoCaoViPham(' + postid + ');" title="Báo cáo Vi phạm">Báo cáo vi phạm</a></li>'
                               + '</ul>'
                               + '</div>';
        $("#loadToolMoreId" + postid).append(dropboxHtml);
        ko.applyBindings(vmPost, document.getElementById("jq-dropdown-2")); // phải binding lại vì nằm ngoài binding chính
        $("#jq-dropdown-2").show(); // hiện nut delete ra. 
    });
}
function LoadBaoCaoViPham(postid) {
    $("#dialog-confirm").data('postid', postid).dialog("open");
}

function checkStatusDeleteButton(postid, callback) {
    $.ajax({
        url: '/Post/CheckButtonDelete',
        type: 'POST',
        data: { postid: postid, userid: $('#HiddentShortUserId').val() },
        cache: false,
    }).success(function (data) {
        if (data === 'True') {
            callback(true);
        }
        else {
            callback(false);
        }
    }).error(function () {
        callback(false);
    })
}

function uploadPreview(files) {
    file = files[0];

    if (file.size > 3000000) {
        showNotification('File hình quá lớn, xin vui lòng chọn hình khác?');
        return;
    }
    var ext = file.name.split('.').pop().toLowerCase();
    if ($.inArray(ext, ['png', 'jpg', 'jpeg']) == -1) {
        showNotification('File hình không đúng định dạng!. Chỉ hỗ trợ file hình png, jpg, jpeg');
        return;
    }
    // Add the uploaded image content to the form data collection
    if (files.length > 0) {
        var formData = new FormData();
        formData.append("UploadedImage", file);

        //upload via ajax
        $.ajax({
            url: '/Post/UploadFileChart',
            type: 'POST',
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        }).done(function (data) {
            if (data === "error") {

                showNotification('Có lỗi khi upload ảnh, vui lòng thử lại');
                return
            }
            else {
                $('.chartImage').show();
                $('.mb3-chart-thumb').attr("src", data);
            }
        }).fail(function () {
            showNotification('Có lỗi khi upload ảnh, vui lòng thử lại');
        })
    }


}
function selectMe(e, data) {        // khi nguoi dung click vao link trong knockout js click event
    e.stopPropagation();
}

function setDefaultAfterPost() {
    $('.divBull, .divBear').parent().children('.switch3button-select').removeClass('switch3button-select'); // remove style of all radio button
    $('input[type=radio]').prop('checked', false); // remove checked of radio button
    //$("#status").css('height', '25'); // set size default of textarea
    //$('#status').parent().next('.status-control').hide(); // set hide button
    $('.chartImage').hide();
    $('.mb3-chart-thumb').removeAttr("src");
}

function Reply(data) {
    var self = this;
    data = data || {};
    self.ReplyId = data.ReplyId;
    self.ReplyMessage = data.ReplyMessage || "";
    self.ReplyByName = data.ReplyByName || "";
    self.ReplyByAvatar = data.ReplyByAvatar + '?width=46&height=46&mode=crop' || "";
    self.ReplyDate = getTimeAgo(data.ReplyDate);
    self.PostCommentsId = data.PostCommentsId;
    self.ReplyBrkVip = (data.BrkVip == 1 ? '<i title="Đã xác thực - dân phím chuyên nghiệp" class="fa  fa-check-circle"></i>' : "") || "";
}
function Post(data) {
    var self = this;
    data = data || {};
    self.PostId = data.PostId;
    self.Message = data.Message || "";
    self.PostedByName = data.PostedByName || "";
    self.PostedByAvatar = data.PostedByAvatar + '?width=50&height=50&mode=crop' || "";
    self.PostedDate = getTimeAgo(data.PostedDate);
    self.PostedDateOri = convertDateFormat(data.PostedDate);    
    self.Stm = (data.Stm === 1 ? "<span class='divBear-cm'>Giảm</span>" : data.Stm === 2 ? "<span class='divBull-cm'>Tăng</span>" : "") || "";
    self.ChartYN = data.ChartYN || 0;
    self.SumLike = ko.observable(data.SumLike);
    self.DiableLike = ko.observable(true);
    self.Chart = data.ChartYN == 1 ? data.Chart : '';
    self.SumReply = ko.observable(data.SumReply);
    self.BrkVip = (data.BrkVip == 1 ? '<i title="Đã xác thực - dân phím chuyên nghiệp" class="fa  fa-check-circle"></i>' : "") || "";
    self.LoadTextNext = '';
}
var commenthub = $.connection.CommentHub;
function viewModel() {
    var self = this;
    self.posts = ko.observableArray(); // danh muc post
    self.replys = ko.observableArray(); // danh mục reply
    self.postPins = ko.observableArray(); // danh muc cac bai post dc pin len dau
    self.newMessage = ko.observable('$' + $('#stockHidenPage').val() + ' '); // noi dung tin post $('#stockHidenPage').val()
    self.newReply = ko.observable(''); // noi dung tin reply
    self.error = ko.observable();
    self.newPosts = ko.observableArray(); // biến tạm để luu post moi, sau khi click thi moi bung ra
    self.postDetail = ko.observableArray();
    self.messageCount = ko.observable(0);
    self.replyCount = ko.observable(0);
    // SignalR related

    var checkpost = '';
    var checkreply = '';
    var postidCurrent = 0;
    var checkLoadFirst = 0;
    var filterhere = "";
    var postPinIdArray = [];
    self.init = function () {
        
        self.error(null);
        commenthub.server.joinRoom($('#stockHidenPage').val());
        // lay danh muc pin bai viet
        $.ajax({
            cache: false,
            type: "GET",
            url: '/Post/GetPostsByStockPin',
            data: { stockCurrent: $('#stockHidenPage').val() },
            beforeSend: function (xhr) {
                //Add your image loader here
                //$('.ajaxLoadingImage').html('<img src="/images/ajax-loader_cungphim.gif" />');
            },
            success: function (data) {
                //$('.ajaxLoadingImage').html('');
                var mappedPosts = $.map(ko.utils.parseJson(data), function (item) { return new Post(item); });
                $(mappedPosts).each(function (index, element) {
                    self.postPins.push(element);
                    postPinIdArray.push(element.PostId);
                });
            }
        });
        // lay danh muc thuong
        $.ajax({
            cache: false,
            type: "GET",
            url: '/Post/GetMorePostsByStock',
            data: { stockCurrent: $('#stockHidenPage').val(), skipposition: 0, filter: "ALL" },
            beforeSend: function (xhr) {
                //Add your image loader here
                //$('.ajaxLoadingImage').html('<img src="/images/ajax-loader_cungphim.gif" />');
            },
            success: function (data) {
                //$('.ajaxLoadingImage').html('');
                var mappedPosts = $.map(ko.utils.parseJson(data), function (item) { return new Post(item); });
                $(mappedPosts).each(function (index, element) {
                    debugger;
                    if (postPinIdArray.indexOf(element.PostId) == -1) {
                        self.posts.push(element);
                    }
                });
                checkLoadFirst = 1;
            }
        });
    }
    loadCSSless = function (heightDiv, data) {
        if (heightDiv > 200) {
            data.LoadTextNext = "<a onclick='clickloadNextText(" + data.PostId + ", this)'>Xem thêm</a>";
            return "list-item-status-content less";
        }
        else {
            return "list-item-status-content";
        }
    }
    /////////////////////////////////////////////////////
    self.addPost = function () { // them post
        self.error(null);
        $('#btAddPost').attr("disabled", true); // disble ngay khong de click them
        var nhanDinh = $("input:radio[name='BullBear']:checked").val();
        if (nhanDinh == null) {
            nhanDinh = 0;
        }
        var charImage = $('.mb3-chart-thumb').attr("src");
        if (charImage == null || charImage == '') {
            charImage = "";
        }

        commenthub.server.addPost({ "Message": self.newMessage() }, nhanDinh, charImage, $('#HiddentShortUserId').val())
            .done(function (status) {
                if (status == "L") {
                    showNotification("<b style='color:red'>User tạm thời đang bị khóa</b>");
                }
                else if (status == "O") {
                    showNotification('Bạn chưa thêm $MãCổPhiếu, bài viết này chỉ nằm ở trang cá nhân.');
                }
                else {
                    showNotification('Bạn đã đăng bài thành công!');
                }
                $('#status').css('height', '75');
            })
            .fail(function (err) {
                self.error(err);
            });
        checkpost = 'Y';
        self.newMessage('$' + $('#stockHidenPage').val() + ' ');//
        setDefaultAfterPost();
    }

    self.addReply = function () { // them tra loi
        $('#btAddReply').attr("disabled", true); // disble ngay khong de click them

        commenthub.server.addReply({ "Message": self.newReply(), "PostedBy": postidCurrent })
            .done(function (status) {
                if (status == "L") {
                    showNotification("<b style='color:red'>User tạm thời đang bị khóa</b>");
                }
                else {
                    showNotification('Trả lời bài viết thành công!');
                }
            })
            .fail(function (err) {
                self.error(err);
            });
        checkreply = 'Y';
        self.newReply('');
    }
    // nhan dc notification tu user khac
    commenthub.client.MessegeOfUserPost = function (number) {
        var num = $(".MessegeNofity").html();
        if (num != null) {
            $(".MessegeNofity").html(parseInt(num) + number);
        }
        else {
            $("#CreateMesseger").html("<span class='MessegeNofity'>1</span>");
        }
    }

    //////////////// load lại filter nè
    var filterhere = "";
    self.FilterAll = function (stringFilter) {
        if (checkLoadFirst == 1) {
            filterhere = stringFilter;
            self.posts([]);
            self.newPosts([]);
            document.title = $('#titleHidenPage').val();
            $.ajax({
                cache: false,
                type: "GET",

                url: '/Post/GetMorePostsByStock',
                data: { stockCurrent: $('#stockHidenPage').val(), skipposition: 0 + postPinIdArray.length, filter: filterhere },
                beforeSend: function (xhr) {
                    //Add your image loader here
                    //$('.ajaxLoadingImage').html('<img src="/images/ajax-loader_cungphim.gif" />');
                },
                success: function (data) {
                    //$('.ajaxLoadingImage').html('');
                    var mappedPosts = $.map(ko.utils.parseJson(data), function (item) { return new Post(item); });
                    $(mappedPosts).each(function (index, element) {
                        self.posts.push(element);
                    });
                    checkLoadFirst = 1;
                }
            });
        }


    }

    /////////////////////////////////////////////////////////////
    // recieve the post from server
    commenthub.client.addPost = function (post) {
        if (checkpost == 'Y') {
            //filter here
            if (filterhere == "" || filterhere == "ALL") {
                self.posts.splice(0, 0, new Post(post));
            }
            if (filterhere == "CHA") {
                if (post.ChartYN) {
                    self.posts.splice(0, 0, new Post(post));
                }
            }
            if (filterhere == "STM") {
                if (post.Stm > 0) {
                    self.posts.splice(0, 0, new Post(post));
                }
            }

        }
        else {
            //filter here
            if (filterhere == "" || filterhere == "ALL") {
                self.newPosts.splice(0, 0, new Post(post));
                document.title = '(' + self.newPosts().length + ') ' + $('#titleHidenPage').val();
            }
            if (filterhere == "CHA") {
                if (post.ChartYN) {
                    self.newPosts.splice(0, 0, new Post(post));
                    document.title = '(' + self.newPosts().length + ') ' + $('#titleHidenPage').val();
                }
            }
            if (filterhere == "STM") {
                if (post.Stm > 0) {
                    self.newPosts.splice(0, 0, new Post(post));
                    document.title = '(' + self.newPosts().length + ') ' + $('#titleHidenPage').val();
                }
            }

        }
        checkpost = 'N';
    }

    commenthub.client.addReply = function (reply) {
        self.replys.unshift(new Reply(reply));
        //self.replys.splice(0, 0, new Reply(reply));
    }

    /////////////////////

    self.loadNewPosts = function () {
        self.posts(self.newPosts().concat(self.posts()));
        self.newPosts([]);
        document.title = $('#titleHidenPage').val();
    }

    self.afterAdd = function (elem) {
        if (checkLoadFirst == 1) {
            //$(elem).hide().slideDown('slow');
            $(elem).hide().slideDown('slow')
        }
    };

    self.AddLike = function (data, e) {
        // ajax update  like with 

        data.DiableLike(false);
        e.stopPropagation(); // stop popup
        commenthub.server.addNewLike(data.PostId)
            .fail(function (err) {
                self.error(err);
            });

    };
    commenthub.client.addNewLike = function (postid) {
        var Postfind = ko.utils.arrayFirst(self.posts(), function (item) {
            return item.PostId === postid;
        });
        if (Postfind != null) {
            Postfind.SumLike(Postfind.SumLike() + 1);
            return;
        }

        // post pin
        var PostPin = ko.utils.arrayFirst(self.postPins(), function (item) {
            return item.PostId === postid;
        });
        if (PostPin != null) {
            PostPin.SumLike(PostPin.SumLike() + 1);
            return;
        }
        // post nam tren local chua dc load
        var PostNewPost = ko.utils.arrayFirst(self.newPosts(), function (item) {
            return item.PostId === postid;
        });
        if (PostNewPost != null) {
            PostNewPost.SumLike(PostNewPost.SumLike() + 1);
            return;
        }

    }
    var tempcheck = 0;
    self.loadToolMore = function (data, e) {
        var resulttemp = false;
        if (tempcheck != data.PostId) {
            tempcheck = data.PostId;
            resulttemp = true; // true la cllick sang artical khác
        }
        if (resulttemp == false) { // truong hop click lai action 
            if ($("#jq-dropdown-2").length > 0) { // neu ton tai thi hien len 
                if ($("#jq-dropdown-2").is(':visible')) {
                    $("#jq-dropdown-2").hide();
                }
                else {
                    $("#jq-dropdown-2").show();
                }
            }
            else {
                CreateDropListBoxMore(data.PostId);
            }
        }
        else {
            $("#jq-dropdown-2").remove();
            CreateDropListBoxMore(data.PostId);
        }
    }
    ///////////////////////////////////////////// delete post
    self.deletePost = function (postid, e) {
        $('<div></div>').appendTo('body')
        .html('<div><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Bạn có chắc chắn muốn xóa toàn bộ bài viết này?</div>')
        .dialog({
            modal: true,
            title: 'Xóa bài viết',
            zIndex: 10000,
            autoOpen: true,
            width: 'auto',
            resizable: false,
            draggable: false,
            create: function (event) { $(event.target).parent().css('position', 'fixed'); },
            buttons: {
                Yes: function () {
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url: '/Post/DeletePostFromClientRequest',
                        data: { postid: postid },
                        beforeSend: function (xhr) {
                            //Add your image loader here
                            //showNotification('Loading');                        
                        },
                        success: function (data) {
                            showNotification('Xóa bài viết thành công');
                            if (data === "True") {
                                // remove UI
                                var postfind = ko.utils.arrayFirst(self.posts(), function (item) {
                                    return item.PostId === postid;
                                });
                                if (postfind != null) {
                                    self.posts.remove(postfind);
                                }
                                // 
                                return;
                            }
                            else {
                                showNotification('Xóa thất bại');
                            }

                        }
                    });

                    $(this).dialog("close");
                },
                No: function () {
                    $(this).dialog("close");
                }
            },
            open: function (event, ui) {
                $('body').css('overflow', 'hidden');
            },
            close: function (event, ui) {
                $('body').css('overflow', 'auto');
                $(this).remove();
            }
        });
    }

    ////////////////////////
    self.detailPost = function (data, e) { // chi tiet post bao gom tra loi
        if (document.documentElement.clientWidth < 640) { // kiem tra do phan giai man hinh de ko nhay popup khi man hinh qua nho
            window.location.href = "/PostDetail?postid=" + data.PostId;
            return;
        }
        else {
            self.newReply('');
            self.replys([]);
            $("#idPostedDateDetail").html(data.PostedDate);
            $("#idPostNameDetail").html('<a style="cursor:pointer" href="/' + data.PostedByName + '">' + data.PostedByName + '</a>' + '<span class="itemVerify">' + data.BrkVip + '</span>');
            $("#idImgPostDetail").attr('src', data.PostedByAvatar);
            // relace hình bỏ. bỏ hình to vào
            $("#idPostMessenge").html(data.Message);
            $("#idPostImage").html(data.ChartYN == 1 ? '<a target="_blank" href=' + data.Chart + '><img class="imageChartDetail" src=' + data.Chart + '?maxwidth=475></a>' : '');
            $("#idStmDetail").html(data.Stm);
            postidCurrent = data.PostId;
            if (data.SumReply() > 10) {
                $("#IdLoadMoreConversation").html('Còn (' + (data.SumReply() - 10) + ') trả lời').attr('href', '/PostDetail?postid=' + postidCurrent);
            }
            else {
                $("#IdLoadMoreConversation").html('Xem thêm').attr('href', '/PostDetail?postid=' + postidCurrent);
            }
            $("#facebookLikeAndShare").html("<script>$(document).ready(function() {try {FB.XFBML.parse();} catch (ex) { }});<\/script><div style='overflow: hidden;float:right' class='fb-like' data-href='/PostDetail?postid=" + postidCurrent + "' data-layout='button_count' data-action='like' data-show-faces='true' data-share='true'></div>");
            //data.notification(0);
            // load 10 reply gan nhat
            $.ajax({
                cache: false,
                type: "GET",
                url: '/Post/GetReplyByPostId',
                data: { replyid: data.PostId },
                beforeSend: function (xhr) {
                    //Add your image loader here

                },
                success: function (data) {
                    var mappedPosts = $.map(ko.utils.parseJson(data), function (item) { return new Reply(item); });
                    $(mappedPosts).each(function (index, element) {
                        self.replys.push(element);
                    });
                }

            });

            if (!$(e.target).hasClass('btnMore')) {
                $('#bg_dialog').show();
                $('#close_dialog').show();
                dialog.dialog("open");
                $(".ui-widget-overlay, #bg_dialog, #close_dialog").click(function (e) {
                    if ($(e.target).parents('#bg_dialog').length == 0) {
                        dialog.dialog('close');
                    }
                })
                window.history.pushState("", "", '/PostDetail?postid=' + postidCurrent);
            }
        }
    }
    /////////////////////////////////////////
    var limitedChar = $("#HiddentCharacterLimit").val();
    self.enablePhimHang = ko.computed(function () {
        return limitedChar - self.messageCount() <= limitedChar && limitedChar - self.messageCount() > 6 && self.newMessage().indexOf('<', 0) == -1;
    });


    self.count = ko.computed(function () {
        var countNum = limitedChar;
        var arrayMessage = self.newMessage().split(' ');
        arrayMessage.forEach(function (item) {
            if (item.indexOf('http') != -1) { // tim thay http link
                countNum = countNum - 12;
            }
            else { // khong thay http link
                countNum = countNum - item.length - 1;
            }
        });
        self.messageCount(countNum);
        return countNum;
    });
    var limitedCharReply = 200;
    self.enablePhimHangReply = ko.computed(function () {
        return limitedCharReply - self.replyCount() <= limitedCharReply && limitedCharReply - self.replyCount() > 6 && self.newReply().indexOf('<', 0) == -1;
    });
    self.countReply = ko.computed(function () {
        var countNum = limitedCharReply;
        var arrayMessage = self.newReply().split(' ');
        arrayMessage.forEach(function (item) {
            if (item.indexOf('http') != -1) { // tim thay http link
                countNum = countNum - 12;
            }
            else { // khong thay http link
                countNum = countNum - item.length - 1;
            }
        });
        self.replyCount(countNum);
        return countNum;


    });

    // notification of reply

    commenthub.client.newReplyNoti = function (postid) {
        // post chinh
        var replysfind = ko.utils.arrayFirst(self.posts(), function (item) {
            return item.PostId === postid;
        });
        if (replysfind != null) {
            replysfind.SumReply(replysfind.SumReply() + 1);
            return;
        }
        // post pin
        var replysfindPin = ko.utils.arrayFirst(self.postPins(), function (item) {
            return item.PostId === postid;
        });
        if (replysfindPin != null) {
            replysfindPin.SumReply(replysfindPin.SumReply() + 1);
            return;
        }
        // post nam tren local chua dc load
        var replysfindNewPost = ko.utils.arrayFirst(self.newPosts(), function (item) {
            return item.PostId === postid;
        });
        if (replysfindNewPost != null) {
            replysfindNewPost.SumReply(replysfindNewPost.SumReply() + 1);
            return;
        }


        //alert(self.notification());
    }
    // end
    var loadSlow = 'Y';
    $(window).scroll(function () { // scroll endpage load more
        if (document.documentElement.clientHeight + $(document).scrollTop() >= document.body.offsetHeight && checkLoadFirst == 1 && loadSlow == 'Y') {
            loadSlow = 'N';
            $('.ajaxLoadingImage').html('<img src="/images/ajax-loader_cungphim.gif" />');
            $.ajax({
                cache: false,
                type: "GET",
                url: '/Post/GetMorePostsByStock',
                data: { stockCurrent: $('#stockHidenPage').val(), skipposition: self.posts().length + postPinIdArray.length + self.newPosts().length, filter: filterhere },
                beforeSend: function (xhr) {
                    //Add your image loader here

                },
                success: function (data) {
                    $('.ajaxLoadingImage').html('');
                    var mappedPosts = $.map(ko.utils.parseJson(data), function (item) { return new Post(item); });
                    $(mappedPosts).each(function (index, element) {
                        self.posts.push(element);
                    });
                    loadSlow = 'Y';
                }
            })
        }
    });
    //@*self.loadMores = function () { // when end page
    //    $.get('@Url.Action("GetCommentBySymbol", "FollowStock")',
    //    {
    //        stockCurrent: '@ViewBag.StockCode',
    //        skipposition: self.posts().length
    //    }, function (data) {

    //        var mappedPosts = $.map(ko.utils.parseJson(data), function (item) { return new Post(item); });
    //        $(mappedPosts).each(function (index, element) {
    //            self.posts.push(element);
    //        });
    //    })
    //};*@
}

//var chromeframe = Request.UserAgent != null && Request.UserAgent.Contains("chromeframe");
//var transports = chromeframe ? "{ transport: 'longPolling' }" : "";
var vmPost = new viewModel();
ko.applyBindings(vmPost, document.getElementById("CommentForKoLoad"));
$.connection.hub.start({ transport: ['webSockets', 'serverSentEvents', 'longPolling'] })
                        .done(function () {
                            vmPost.init();
                            $('.ajaxLoadingInit').html('');

                        }).fail(function (fail) {
                            console.log('Không thể mở kết nối đến server' + fail);
                        });

$.connection.hub.disconnected(function () {
    setTimeout(function () {
        $.connection.hub.start().done(function () {
            commenthub.server.joinRoom($('#stockHidenPage').val());
        });
    }, 10000); // Restart connection after 10 seconds.
});
$.connection.hub.connectionSlow(function () {
    console.log('Kết nối đến server chậm do đường truyền')
});
window.onbeforeunload = function (e) {
    //$.connection.hub.stop
    //commenthub.server.stop = function () {
    //    $.connection.hub.stop();

    //    console.log('window.onbeforeunload');
    //};
};


//$.connection.hub.logging = true;

