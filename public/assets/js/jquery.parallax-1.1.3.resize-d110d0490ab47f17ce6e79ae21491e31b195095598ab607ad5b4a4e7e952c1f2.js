!function(t){var e=t(window),i=e.height();e.resize(function(){i=e.height()}),t.fn.parallax=function(s,n,o){function r(){l.each(function(){c=l.offset().top}),a=o?function(t){return t.outerHeight(!0)}:function(t){return t.height()},(arguments.length<1||null===s)&&(s="50%"),(arguments.length<2||null===n)&&(n=.5),(arguments.length<3||null===o)&&(o=!0);var r=e.scrollTop();l.each(function(){var e=t(this),o=e.offset().top,u=a(e);o+u<r||o>r+i||l.css("backgroundPosition",s+" "+Math.round((c-r)*n)+"px")})}var a,c,l=t(this);e.bind("scroll",r).resize(r),r()}}(jQuery);