(function($) {
	$.fn.Sonline = function(options) {
		var opts = $.extend({}, $.fn.Sonline.defualts, options);
		$.fn.setList(opts); //调用列表设置
		if (opts.DefaultsOpen == false) {
			$.fn.Sonline.close(opts.Position, 0);
		}
		//展开
		$("#SonlineBox > .openTrigger").live("click", function() {
			$.fn.Sonline.open(opts.Position);
		});
		//关闭
		$("#SonlineBox > .contentBox > .closeTrigger").live("click", function() {
			$.fn.Sonline.close(opts.Position, "fast");
		});

		//Ie6兼容或滚动方式显示
		if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style || opts.Effect == true) {
			$.fn.Sonline.scrollType();
		} else if (opts.Effect == false) {
			$("#SonlineBox").css({
				position: "fixed"
			});
		}
	}
	//plugin defaults
	$.fn.Sonline.defualts = {
		Position: "left",
		//left或right
		Top: 200,
		//顶部距离，默认250px
		Effect: true,
		//滚动或者固定两种方式，布尔值：true或
		DefaultsOpen: true,
		//默认展开：true,默认收缩：false
		Qqlist: "" //多个QQ用','隔开，QQ和客服名用'|'隔开
	}

	//展开
	$.fn.Sonline.open = function(positionType) {
		var widthValue = $("#SonlineBox > .contentBox").width();
		if (positionType == "left") {
			$("#SonlineBox > .contentBox").animate({
				left: 0
			}, "fast");
		} else if (positionType == "right") {
			$("#SonlineBox > .contentBox").animate({
				right: 0
			}, "fast");
		}
		$("#SonlineBox").css({
			width: widthValue + 4
		});
		$("#SonlineBox > .openTrigger").hide();
	}
	//关闭
	$.fn.Sonline.close = function(positionType, speed) {
		$("#SonlineBox > .openTrigger").show();
		var widthValue = $("#SonlineBox > .openTrigger").width();
		var allWidth = (-($("#SonlineBox > .contentBox").width()) - 6);
		if (positionType == "left") {
			$("#SonlineBox > .contentBox").animate({
				left: allWidth
			}, speed);
		} else if (positionType == "right") {
			$("#SonlineBox > .contentBox").animate({
				right: allWidth
			}, speed);
		}
		$("#SonlineBox").animate({
			width: widthValue
		}, speed);

	}

	//子插件：设置列表参数
	$.fn.setList = function(opts) {
		$("body").append("<div class='SonlineBox' id='SonlineBox' style='top:-600px;width:250px'><div class='openTrigger' style='display:none' title='展开'></div><div class='contentBox' style='width:250px'><div class='closeTrigger'><img src='/images/closeBtnImg.gif' title='关闭' /></div><div class='titleBox' style='width:250px;background: #177cb0;color: white;text-align: center;font-size: 15px'> 在线好友</span> </div><div class='listBox'></div></div></div>");
		if (opts.Qqlist == "") {
			$("#SonlineBox > .contentBox > .listBox").append("<p style='padding:15px'>您暂时还没有一个好友哦。</p>")
		} else {
			var qqListHtml = $.fn.Sonline.splitStr(opts);
			$("#SonlineBox > .contentBox > .listBox").append(qqListHtml);
			var yjfk="d<form class='form-inline' role='form'><div class='form-group'><label class='sr-only' for='name'>名称</label><input style='width:150px' type='text' class='form-control' style='width:180px; height:15px' id='name' placeholder='请输要发送的消息'></div><button type='submit' style='display: inline-block;width:30px;background: #1685a9;color: white' class='btn btn-sm'>发送</button></form>";
			$("#SonlineBox > .contentBox > .listBox").append(yjfk);
		}
		if (opts.Position == "left") {
			$("#SonlineBox").css({
				left: 0
			});
		} else if (opts.Position == "right") {
			$("#SonlineBox").css({
				right: 0
			})
		}
		$("#SonlineBox").css({
			top: opts.Top
		});
		var allHeights = 0;
		if ($("#SonlineBox > .contentBox").height() < $("#SonlineBox > .openTrigger").height()) {
			allHeights = $("#SonlineBox > .openTrigger").height() + 4;
		} else {
			allHeights = $("#SonlineBox > .contentBox").height() + 4;
		}
		$("#SonlineBox").height(allHeights);
		if (opts.Position == "left") {
			$("#SonlineBox > .openTrigger").css({
				left: 0
			});
		} else if (opts.Position == "right") {
			$("#SonlineBox > .openTrigger").css({
				right: 0
			});
		}
	}

	//滑动式效果
	$.fn.Sonline.scrollType = function() {
		$("#SonlineBox").css({
			position: "absolute"
		});
		var topNum = parseInt($("#SonlineBox").css("top") + "");
		$(window).scroll(function() {
			var scrollTopNum = $(window).scrollTop(); //获取网页被卷去的高
			var bodyheight=$('body').height() / 2;
			if (scrollTopNum>bodyheight) {
				$("#SonlineBox").stop(true, true).delay(0).animate({
					top: scrollTopNum + topNum - 200
				}, "slow");
			}else {
				$("#SonlineBox").stop(true, true).delay(0).animate({
					top: scrollTopNum + topNum
				}, "slow");
			}
		});
	}
	//分割QQ
	$.fn.Sonline.splitStr = function(opts) {
		var strs = new Array(); //定义一数
		var QqlistText = opts.Qqlist;
		strs = QqlistText.split(","); //字符分割
		var QqHtml = ""
		for (var i = 0; i < strs.length; i++) {
			var subStrs = new Array(); //定义一数组
			var subQqlist = strs[i];
			subStrs = subQqlist.split("|"); //字符分割
			QqHtml = QqHtml + "<div class='QQList' style='margin-bottom:20px'><img class='pull-left' src='/images/onlineuser.png' />   <span class='pull-left'>" + subStrs[1]+"：</span> <img style='margin-left:20px' class='pull-right' src='/images/message.png'><button   class='pull-right' style='border-radius:5px;margin-left:20px;background:#3596D3; color:white'>邀请</button> </div>"
		}
		return QqHtml;
	}
})(jQuery);