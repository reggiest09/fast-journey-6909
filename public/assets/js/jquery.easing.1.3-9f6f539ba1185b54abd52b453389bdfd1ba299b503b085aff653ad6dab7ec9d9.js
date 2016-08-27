jQuery.easing.jswing=jQuery.easing.swing,jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(t,e,s,i,n){return jQuery.easing[jQuery.easing.def](t,e,s,i,n)},easeInQuad:function(t,e,s,i,n){return i*(e/=n)*e+s},easeOutQuad:function(t,e,s,i,n){return-i*(e/=n)*(e-2)+s},easeInOutQuad:function(t,e,s,i,n){return(e/=n/2)<1?i/2*e*e+s:-i/2*(--e*(e-2)-1)+s},easeInCubic:function(t,e,s,i,n){return i*(e/=n)*e*e+s},easeOutCubic:function(t,e,s,i,n){return i*((e=e/n-1)*e*e+1)+s},easeInOutCubic:function(t,e,s,i,n){return(e/=n/2)<1?i/2*e*e*e+s:i/2*((e-=2)*e*e+2)+s},easeInQuart:function(t,e,s,i,n){return i*(e/=n)*e*e*e+s},easeOutQuart:function(t,e,s,i,n){return-i*((e=e/n-1)*e*e*e-1)+s},easeInOutQuart:function(t,e,s,i,n){return(e/=n/2)<1?i/2*e*e*e*e+s:-i/2*((e-=2)*e*e*e-2)+s},easeInQuint:function(t,e,s,i,n){return i*(e/=n)*e*e*e*e+s},easeOutQuint:function(t,e,s,i,n){return i*((e=e/n-1)*e*e*e*e+1)+s},easeInOutQuint:function(t,e,s,i,n){return(e/=n/2)<1?i/2*e*e*e*e*e+s:i/2*((e-=2)*e*e*e*e+2)+s},easeInSine:function(t,e,s,i,n){return-i*Math.cos(e/n*(Math.PI/2))+i+s},easeOutSine:function(t,e,s,i,n){return i*Math.sin(e/n*(Math.PI/2))+s},easeInOutSine:function(t,e,s,i,n){return-i/2*(Math.cos(Math.PI*e/n)-1)+s},easeInExpo:function(t,e,s,i,n){return 0==e?s:i*Math.pow(2,10*(e/n-1))+s},easeOutExpo:function(t,e,s,i,n){return e==n?s+i:i*(-Math.pow(2,-10*e/n)+1)+s},easeInOutExpo:function(t,e,s,i,n){return 0==e?s:e==n?s+i:(e/=n/2)<1?i/2*Math.pow(2,10*(e-1))+s:i/2*(-Math.pow(2,-10*--e)+2)+s},easeInCirc:function(t,e,s,i,n){return-i*(Math.sqrt(1-(e/=n)*e)-1)+s},easeOutCirc:function(t,e,s,i,n){return i*Math.sqrt(1-(e=e/n-1)*e)+s},easeInOutCirc:function(t,e,s,i,n){return(e/=n/2)<1?-i/2*(Math.sqrt(1-e*e)-1)+s:i/2*(Math.sqrt(1-(e-=2)*e)+1)+s},easeInElastic:function(t,e,s,i,n){var o=1.70158,r=0,a=i;if(0==e)return s;if(1==(e/=n))return s+i;if(r||(r=.3*n),a<Math.abs(i)){a=i;var o=r/4}else var o=r/(2*Math.PI)*Math.asin(i/a);return-(a*Math.pow(2,10*(e-=1))*Math.sin((e*n-o)*(2*Math.PI)/r))+s},easeOutElastic:function(t,e,s,i,n){var o=1.70158,r=0,a=i;if(0==e)return s;if(1==(e/=n))return s+i;if(r||(r=.3*n),a<Math.abs(i)){a=i;var o=r/4}else var o=r/(2*Math.PI)*Math.asin(i/a);return a*Math.pow(2,-10*e)*Math.sin((e*n-o)*(2*Math.PI)/r)+i+s},easeInOutElastic:function(t,e,s,i,n){var o=1.70158,r=0,a=i;if(0==e)return s;if(2==(e/=n/2))return s+i;if(r||(r=n*(.3*1.5)),a<Math.abs(i)){a=i;var o=r/4}else var o=r/(2*Math.PI)*Math.asin(i/a);return e<1?-.5*(a*Math.pow(2,10*(e-=1))*Math.sin((e*n-o)*(2*Math.PI)/r))+s:a*Math.pow(2,-10*(e-=1))*Math.sin((e*n-o)*(2*Math.PI)/r)*.5+i+s},easeInBack:function(t,e,s,i,n,o){return void 0==o&&(o=1.70158),i*(e/=n)*e*((o+1)*e-o)+s},easeOutBack:function(t,e,s,i,n,o){return void 0==o&&(o=1.70158),i*((e=e/n-1)*e*((o+1)*e+o)+1)+s},easeInOutBack:function(t,e,s,i,n,o){return void 0==o&&(o=1.70158),(e/=n/2)<1?i/2*(e*e*(((o*=1.525)+1)*e-o))+s:i/2*((e-=2)*e*(((o*=1.525)+1)*e+o)+2)+s},easeInBounce:function(t,e,s,i,n){return i-jQuery.easing.easeOutBounce(t,n-e,0,i,n)+s},easeOutBounce:function(t,e,s,i,n){return(e/=n)<1/2.75?i*(7.5625*e*e)+s:e<2/2.75?i*(7.5625*(e-=1.5/2.75)*e+.75)+s:e<2.5/2.75?i*(7.5625*(e-=2.25/2.75)*e+.9375)+s:i*(7.5625*(e-=2.625/2.75)*e+.984375)+s},easeInOutBounce:function(t,e,s,i,n){return e<n/2?.5*jQuery.easing.easeInBounce(t,2*e,0,i,n)+s:.5*jQuery.easing.easeOutBounce(t,2*e-n,0,i,n)+.5*i+s}});