!function(t){t.fn.UItoTop=function(e){var i={text:"",min:200,inDelay:600,outDelay:400,containerID:"toTop",containerHoverID:"toTopHover",scrollSpeed:1200,easingType:"linear"},s=t.extend(i,e),n="#"+s.containerID,o="#"+s.containerHoverID;t("body").append('<a href="#" id="'+s.containerID+'">'+s.text+"</a>"),t(n).hide().on("click.UItoTop",function(){return t("html, body").animate({scrollTop:0},s.scrollSpeed,s.easingType),t("#"+s.containerHoverID,this).stop().animate({opacity:0},s.inDelay,s.easingType),!1}).prepend('<span id="'+s.containerHoverID+'"></span>').hover(function(){t(o,this).stop().animate({opacity:1},600,"linear")},function(){t(o,this).stop().animate({opacity:0},700,"linear")}),t(window).scroll(function(){var e=t(window).scrollTop();"undefined"==typeof document.body.style.maxHeight&&t(n).css({position:"absolute",top:e+t(window).height()-50}),e>s.min?t(n).fadeIn(s.inDelay):t(n).fadeOut(s.Outdelay)})}}(jQuery),$(document).ready(function(){$().UItoTop({easingType:"easeOutQuart"})});