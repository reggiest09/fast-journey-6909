!function(t,e,i){"$:nomunge";function n(){s=e[a](function(){o.each(function(){var e=t(this),i=e.width(),n=e.height(),s=t.data(this,c);i===s.w&&n===s.h||e.trigger(l,[s.w=i,s.h=n])}),n()},r[h])}var s,o=t([]),r=t.resize=t.extend(t.resize,{}),a="setTimeout",l="resize",c=l+"-special-event",h="delay",p="throttleWindow";r[h]=250,r[p]=!0,t.event.special[l]={setup:function(){if(!r[p]&&this[a])return!1;var e=t(this);o=o.add(e),t.data(this,c,{w:e.width(),h:e.height()}),1===o.length&&n()},teardown:function(){if(!r[p]&&this[a])return!1;var e=t(this);o=o.not(e),e.removeData(c),o.length||clearTimeout(s)},add:function(e){function n(e,n,o){var r=t(this),a=t.data(this,c);a.w=n!==i?n:r.width(),a.h=o!==i?o:r.height(),s.apply(this,arguments)}if(!r[p]&&this[a])return!1;var s;return t.isFunction(e)?(s=e,n):(s=e.handler,void(e.handler=n))}}}(jQuery,this);