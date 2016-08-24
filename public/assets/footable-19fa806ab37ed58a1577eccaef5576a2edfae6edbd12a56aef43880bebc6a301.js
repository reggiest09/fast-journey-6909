!function(t,e,i){function n(){var t=this;t.id=null,t.busy=!1,t.start=function(e,i){t.busy||(t.stop(),t.id=setTimeout(function(){e(),t.id=null,t.busy=!1},i),t.busy=!0)},t.stop=function(){null!=t.id&&(clearTimeout(t.id),t.id=null,t.busy=!1)}}function s(i,s,o){var r=this;r.id=o,r.table=i,r.options=s,r.breakpoints=[],r.breakpointNames="",r.columns={};var a=r.options,l=a.classes,c=0;return r.timers={resize:new n,register:function(t){return r.timers[t]=new n,r.timers[t]}},e.footable.plugins.init(r),r.init=function(){var i=t(e),n=t(r.table);if(n.hasClass(l.loaded))return void r.raise("footable_already_initialized");n.addClass(l.loading),n.find(a.columnDataSelector).each(function(){var e=r.getColumnData(this);if(r.columns[e.index]=e,null!=e.className){var i="",s=!0;t.each(e.matches,function(t,e){s||(i+=", "),i+="> tbody > tr:not(.footable-row-detail) > td:nth-child("+(parseInt(e)+1)+")",s=!1}),n.find(i).not(".footable-cell-detail").addClass(e.className)}});for(var s in a.breakpoints)r.breakpoints.push({name:s,width:a.breakpoints[s]}),r.breakpointNames+=s+" ";r.breakpoints.sort(function(t,e){return t.width-e.width}),r.bindToggleSelectors(),r.raise("footable_initializing"),n.bind("footable_initialized",function(){r.resize(),n.removeClass(l.loading),n.find('[data-init="hide"]').hide(),n.find('[data-init="show"]').show(),n.addClass(l.loaded)}),n.bind("footable_resize",function(){r.resize()}),i.bind("resize.footable",function(){r.timers.resize.stop(),r.timers.resize.start(function(){r.resize()},a.delay)}),r.raise("footable_initialized")},r.bindToggleSelectors=function(){var e=t(r.table);e.find(a.toggleSelector).unbind("click.footable").bind("click.footable",function(i){if(e.is(".breakpoint")&&t(i.target).is("td")){var n=t(this).is("tr")?t(this):t(this).parents("tr:first");r.toggleDetail(n.get(0))}})},r.parse=function(t,e){var i=a.parsers[e.type]||a.parsers.alpha;return i(t)},r.getColumnData=function(e){var i=t(e),n=i.data("hide"),s=i.index();n=n||"",n=n.split(",");var o={index:s,hide:{},type:i.data("type")||"alpha",name:t.trim(i.data("name")||i.text()),ignore:i.data("ignore")||!1,className:i.data("class")||null,matches:[],names:{},group:i.data("group")||null,groupName:null};if(null!=o.group){var l=t(r.table).find('> thead > tr.footable-group-row > th[data-group="'+o.group+'"], > thead > tr.footable-group-row > td[data-group="'+o.group+'"]').first();o.groupName=r.parse(l,{type:"alpha"})}var u=parseInt(i.prev().attr("colspan")||0);c+=u>1?u-1:0;var d=parseInt(i.attr("colspan")||0),p=o.index+c;if(d>1){var f=i.data("names");f=f||"",f=f.split(",");for(var h=0;h<d;h++)o.matches.push(h+p),h<f.length&&(o.names[h+p]=f[h])}else o.matches.push(p);o.hide["default"]="all"===i.data("hide")||t.inArray("default",n)>=0;for(var g in a.breakpoints)o.hide[g]="all"===i.data("hide")||t.inArray(g,n)>=0;var m=r.raise("footable_column_data",{column:{data:o,th:e}});return m.column.data},r.getViewportWidth=function(){return window.innerWidth||(document.body?document.body.offsetWidth:0)},r.getViewportHeight=function(){return window.innerHeight||(document.body?document.body.offsetHeight:0)},r.calculateWidthAndHeight=function(t,e){return jQuery.isFunction(a.calculateWidthAndHeightOverride)?a.calculateWidthAndHeightOverride(t,e):(e.viewportWidth<e.width&&(e.width=e.viewportWidth),e.viewportHeight<e.height&&(e.height=e.viewportHeight),e)},r.hasBreakpointColumn=function(t){for(var e in r.columns)if(r.columns[e].hide[t])return!0;return!1},r.resize=function(){var e=t(r.table),i={width:e.width(),height:e.height(),viewportWidth:r.getViewportWidth(),viewportHeight:r.getViewportHeight(),orientation:null};i.orientation=i.viewportWidth>i.viewportHeight?"landscape":"portrait",i=r.calculateWidthAndHeight(e,i);var n=e.data("footable_info");if(e.data("footable_info",i),r.raise("footable_resizing",{old:n,info:i}),!n||n&&n.width&&n.width!=i.width||n&&n.height&&n.height!=i.height){for(var s,o=null,a=0;a<r.breakpoints.length;a++)if(s=r.breakpoints[a],s&&s.width&&i.width<=s.width){o=s;break}var l=null==o?"default":o.name,c=r.hasBreakpointColumn(l);e.removeClass("default breakpoint").removeClass(r.breakpointNames).addClass(l+(c?" breakpoint":"")).find("> thead > tr:last-child > th").each(function(){var i=r.columns[t(this).index()],n="",s=!0;t.each(i.matches,function(t,e){s||(n+=", ");var i=e+1;n+="> tbody > tr:not(.footable-row-detail) > td:nth-child("+i+")",n+=", > tfoot > tr:not(.footable-row-detail) > td:nth-child("+i+")",n+=", > colgroup > col:nth-child("+i+")",s=!1}),n+=', > thead > tr[data-group-row="true"] > th[data-group="'+i.group+'"]';var o=e.find(n).add(this);if(0==i.hide[l]?o.show():o.hide(),1==e.find("> thead > tr.footable-group-row").length){var a=e.find('> thead > tr:last-child > th[data-group="'+i.group+'"]:visible, > thead > tr:last-child > th[data-group="'+i.group+'"]:visible'),c=e.find('> thead > tr.footable-group-row > th[data-group="'+i.group+'"], > thead > tr.footable-group-row > td[data-group="'+i.group+'"]'),u=0;t.each(a,function(){u+=parseInt(t(this).attr("colspan")||1)}),u>0?c.attr("colspan",u).show():c.hide()}}).end().find("> tbody > tr.footable-detail-show").each(function(){r.createOrUpdateDetailRow(this)}),e.find("> tbody > tr.footable-detail-show:visible").each(function(){var e=t(this).next();e.hasClass("footable-row-detail")&&(c?e.show():e.hide())}),e.find("> thead > tr > th.footable-last-column, > tbody > tr > td.footable-last-column").removeClass("footable-last-column"),e.find("> thead > tr > th.footable-first-column, > tbody > tr > td.footable-first-column").removeClass("footable-first-column"),e.find("> thead > tr, > tbody > tr").find("> th:visible:last, > td:visible:last").addClass("footable-last-column").end().find("> th:visible:first, > td:visible:first").addClass("footable-first-column"),r.raise("footable_breakpoint_"+l,{info:i})}r.raise("footable_resized",{old:n,info:i})},r.toggleDetail=function(e){var i=t(e),n=r.createOrUpdateDetailRow(i.get(0)),s=i.next();!n&&s.is(":visible")?(i.removeClass("footable-detail-show"),s.hasClass("footable-row-detail")&&s.hide()):(i.addClass("footable-detail-show"),s.show())},r.getColumnFromTdIndex=function(e){var i=null;for(var n in r.columns)if(t.inArray(e,r.columns[n].matches)>=0){i=r.columns[n];break}return i},r.createOrUpdateDetailRow=function(e){var i,n=t(e),s=n.next(),o=[];if(n.is(":hidden"))return!1;if(r.raise("footable_rowdetailupdated",{row:n,detail:s}),n.find("> td:hidden").each(function(){var e=t(this).index(),i=r.getColumnFromTdIndex(e),n=i.name;return 1==i.ignore||(e in i.names&&(n=i.names[e]),o.push({name:n,value:r.parse(this,i),display:t.trim(t(this).html()),group:i.group,groupName:i.groupName}),!0)}),0==o.length)return!1;var l=n.find("> td:visible").length,c=s.hasClass("footable-row-detail");return c||(s=t('<tr class="footable-row-detail"><td class="footable-cell-detail"><div class="footable-row-detail-inner"></div></td></tr>'),n.after(s)),s.find("> td:first").attr("colspan",l),i=s.find(".footable-row-detail-inner").empty(),a.createDetail(i,o),!c},r.raise=function(e,i){i=i||{};var n={ft:r};t.extend(!0,n,i);var s=t.Event(e,n);return s.ft||t.extend(!0,s,n),t(r.table).trigger(s),s},r.init(),r}e.footable={options:{delay:100,breakpoints:{phone:480,tablet:1024},parsers:{alpha:function(e){return t(e).data("value")||t.trim(t(e).text())}},calculateWidthAndHeightOverride:null,toggleSelector:" > tbody > tr:not(.footable-row-detail)",columnDataSelector:"> thead > tr:last-child > th, > thead > tr:last-child > td",createDetail:function(t,e){for(var i={_none:{name:null,data:[]}},n=0;n<e.length;n++){var s=e[n].group;null!=s?(s in i||(i[s]={name:e[n].groupName,data:[]}),i[s].data.push(e[n])):i._none.data.push(e[n])}for(var o in i)if(0!=i[o].data.length){"_none"!=o&&t.append("<h4>"+i[o].name+"</h4>");for(var r=0;r<i[o].data.length;r++){var a=i[o].data[r].name?":":"";t.append("<div><strong>"+i[o].data[r].name+"</strong> "+a+" "+i[o].data[r].display+"</div>")}}},classes:{loading:"footable-loading",loaded:"footable-loaded",sorted:"footable-sorted",descending:"footable-sorted-desc",indicator:"footable-sort-indicator"},debug:!1},version:{major:0,minor:5,toString:function(){return e.footable.version.major+"."+e.footable.version.minor},parse:function(t){return version=/(\d+)\.?(\d+)?\.?(\d+)?/.exec(t),{major:parseInt(version[1])||0,minor:parseInt(version[2])||0,patch:parseInt(version[3])||0}}},plugins:{_validate:function(i){return"string"!=typeof i.name?(1==e.footable.options.debug&&console.error('Validation failed, plugin does not implement a string property called "name".',i),!1):t.isFunction(i.init)?(1==e.footable.options.debug&&console.log('Validation succeeded for plugin "'+i.name+'".',i),!0):(1==e.footable.options.debug&&console.error('Validation failed, plugin "'+i.name+'" does not implement a function called "init".',i),!1)},registered:[],register:function(n,s){e.footable.plugins._validate(n)&&(e.footable.plugins.registered.push(n),s!=i&&"object"==typeof s&&t.extend(!0,e.footable.options,s),1==e.footable.options.debug&&console.log('Plugin "'+n.name+'" has been registered with the Foobox.',n))},init:function(t){for(var i=0;i<e.footable.plugins.registered.length;i++)try{e.footable.plugins.registered[i].init(t)}catch(t){1==e.footable.options.debug&&console.error(t)}}}};var o=0;t.fn.footable=function(i){i=i||{};var n=t.extend(!0,{},e.footable.options,i);return this.each(function(){o++,this.footable=new s(this,n,o)})}}(jQuery,window);