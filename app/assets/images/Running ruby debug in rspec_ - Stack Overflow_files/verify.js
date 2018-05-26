setTimeout(function(){
    'use strict';
    try{
        var stringifyFunc = null;
		if(window.JSON){
			stringifyFunc = window.JSON.stringify;
		} else {
			if(window.parent && window.parent.JSON){
				stringifyFunc = window.parent.JSON.stringify;
			}
		}
		if(!stringifyFunc){
			return;
		}
        var msg = {
            action: 'notifyBrandShieldAdEntityInformation',
            bsAdEntityInformation: {
                brandShieldId:'c0bdede37a5d4e738e2c1726c03617fb',
                comparisonItems:[{name : 'cmp', value : 12102076},{name : 'plmt', value : 12126367}]
            }
        };
        var msgString = stringifyFunc(msg);
        var bst2tWin = null;

        var findAndSendMessage = function() {
            if (!bst2tWin) {
                var frame = document.getElementById('bst2t_76421736066');
                if (frame) {
                    bst2tWin = frame.contentWindow;
                }
            }

            if (bst2tWin) {
                bst2tWin.postMessage(msgString, '*');
            }
        };

        findAndSendMessage();
        setTimeout(findAndSendMessage, 50);
        setTimeout(findAndSendMessage, 500);
    } catch(err){}
}, 10);
(function() {var dvObj = $dvbs;var impId = 'c0bdede37a5d4e738e2c1726c03617fb';var dvParams = {'useDvp': 'false','logRate': '100'};dvObj.pubSub.subscribe(dvObj==window.$dv?"ImpressionServed":"BeforeDecisionRender",impId,"BHL", function() {function f(){var c="true"===dvParams.useDvp?"dvp_":"",d="";this.exec=function(){var a={},b;a:{try{b=history.length;break a}catch(e){d+="|"+e.message}b=void 0}b&&(a[c+"brh"]=b);c&&d&&(a.dvp_brherr=d);try{a&&dvObj.registerEventCall(impId,a)}catch(e){}}}try{(new f).exec()}catch(c){};});})();(function() {var dvObj = $dvbs;var impId = 'c0bdede37a5d4e738e2c1726c03617fb';dvObj.pubSub.subscribe(dvObj==window.$dv?"ImpressionServed":"BeforeDecisionRender",impId,"CTITS",function(){var a=-1;try{top.frames&&(a=top.frames.length),dvObj.registerEventCall(impId,{fcifrms:a})}catch(b){}});})();var dvObj = $dvbs;function np764531(g,i){function d(){function d(){function f(b,a){b=(i?"dvp_":"")+b;e[b]=a}var e={},a=function(b){for(var a=[],c=0;c<b.length;c+=2)a.push(String.fromCharCode(parseInt(b.charAt(c)+b.charAt(c+1),32)));return a.join("")},h=window[a("3e313m3937313k3f3i")];h&&(a=h[a("3g3c313k363f3i3d")],f("pltfrm",a));(function(){var a=e;e={};dvObj.registerEventCall(g,a,2E3,true)})()}try{d()}catch(f){}}try{dvObj.pubSub.subscribe(dvObj==window.$dv?"ImpressionServed":"BeforeDecisionRender",g,"np764531",d)}catch(f){}}
;np764531("c0bdede37a5d4e738e2c1726c03617fb",false);var dvObj=$dvbs;var impId='c0bdede37a5d4e738e2c1726c03617fb';var htmlRate=20;var runTag=-1;var lab=0;var sources=33554432;var adid='2745819506393591915';var urlTypeId=1033;var ddt=1;var date='20180319';dvObj.pubSub.subscribe('BeforeDecisionRender',impId,'AttributeCollection',function(){
try{try{(function(){var e=window;var t=0;try{while(e.parent&&e!=e.parent&&e.parent.document){e=e.parent;if(t++>10)break}}catch(r){}var n=0;function o(e,t){if(t)n=(n|1<<e)>>>0}var i=e.document;o(0,e==window.top);o(1,e.playerInstance&&i.querySelector('script[src*="ads-player.com"]'));o(2,e.xy_checksum&&e.place_player&&e.jwplayer);o(3,i.title=="");o(4,e.xy_checksum&&e.place_player);o(5,e.xy_checksum&&e.place_player&&e.logjwonready&&e.logContentPauseRequested);o(6,i.querySelector('script[src*="/coinhive"]')||e.Miner||e.CoinHive||function(){try{return e.localStorage.getItem("coinhive")}catch(t){return false}}());o(7,e.vdApp&&e.vdApp.createPlayer);o(8,i.querySelector("body>div[id=px1]")&&i.querySelector("body>div[id=px4]")&&i.querySelector("body>span[id=px2]")&&i.querySelector(i,"body>span[id=px3]"));o(9,function(){return i.title==""?(a=i.getElementById("player"),a&&a.data&&a.data.indexOf("jwplayer")>-1&&a.getAttribute("style")=="visibility: visible;"):false}());o(10,i.documentElement.hasAttribute("webdriver")||(null!=e.domAutomation||(null!=e.domAutomationController||null!=e._WEBDRIVER_ELEM_CACHE)));o(11,null!=e._phantom||null!=e.callPhantom);o(12,i.querySelector('script[src*="sitewebvideo.com"]'));o(13,e.CustomWLAdServer&&e.CustomWLAdServer.passbackCallbacks);o(14,function(){return i.title==""?(a=i.querySelector("head>meta"),b=i.styleSheets,a&&a.outerHTML=='<meta http-equiv="refresh" content="45" ;="">'&&b&&b.length&&b[0].rules.length==7&&b[0].rules[6].selectorText=="div.cc"):false}());o(15,e.InitPage&&e.cef&&e.InitAd);o(16,i.querySelector('body>div[class="z-z-z"]'));o(17,e.clickplayer!=null&&e.checkRdy2!=null);o(18,function(){return e==e.top&&i.title==""?(a=i.querySelector("body>#player"),a!=null&&(a.querySelector('div[id*="opti-ad"]')!=null||a.querySelector('iframe[src="about:blank"]'))!=null):false}());o(19,function(){return e==e.top&&i.title==""&&e.InitAdPlayer?(a=i.querySelector('body>div[id="kt_player"]'),a!=null&&a.querySelector('div[class="flash-blocker"]')!=null):false}());o(20,i.querySelector('script[src*="videoadtest.com"]'));o(21,e.navigator&&e.navigator.geolocation&&e.navigator.geolocation.getCurrentPosition_&&e.navigator.geolocation.watchPosition_&&e.navigator.geolocation.clearWatch_);o(22,e.instance&&e.inject&&i.querySelector('path[id="cp-search-0"]'));o(23,function(){return a=i.querySelector('p[class="footerCopyright"]'),a&&a.textContent.match(/ MangaLife 2016/)}());o(24,e.DbcbdConfig);o(25,e.innerWidth>e.screen.width);var c={dvp_acv:n,dvp_acifd:t};var l=new Date;if(e==window.top){c.dvp_accl=function(){try{return i.cookie.length}catch(e){return null}}();c.dvp_acso=(e.FB?1:0)+(e.twttr?2:0)+(e.outbrain?4:0)+(e._taboola?8:0);c.dvp_mref=function(){return refm=i.referrer.match(/https?:\/\/(www\.)?([^\/]*)/),refm!=null&&refm.length==3?refm[2]:""}();c.dvp_dnsl=e.performance&&e.performance.timing&&e.performance.timing.domainLookupEnd>0?e.performance.timing.domainLookupEnd-e.performance.timing.domainLookupStart:-1;var d=i.head;if(d){if(d.children)c.dvp_acc=d.children.length;if(d.outerHTML)c.dvp_acl=d.outerHTML.length}if(i.querySelectorAll){c.dvp_acd=i.querySelectorAll("*").length}if(e.external){c.dvp_acwe=Object.keys(e.external).length}var s=e.innerWidth>e.innerHeight;var u=e.screen[s?"height":"width"];if(i.body.offsetWidth>u){c.dvp_vpos=i.body.offsetWidth+"-"+u+"-"+(s?1:0)}if((navigator.maxTouchPoints||0)==0&&"ontouchstart"in window==false){if(i.visibilityState=="prerender"){c.dvp_acmns=2}else if(e.outerWidth*e.outerHeight<25e3){c.dvp_acmns=3}else{var p=adid%100<10;var v;var m={};var f=[];var h=24;var y=0;var g=0;var w=0;var _=[];var S={width:e.outerWidth,height:e.outerHeight,maxX:0,maxY:0,overflow:0};var x=false;var q=i.hasFocus?typeof i.hasFocus.prototype=="object":false;e.addEventListener&&e.addEventListener("mousemove",function(t){y++;if(!q&&i.hasFocus()==false&&i.hidden)g++;var r=t.screenX-e.screenX;var a=t.screenY-e.screenY;if(x==false){if(S.width!=e.outerWidth||S.height!=e.outerHeight){x=true;k()}else if(f.length<50){S.maxX=r>S.maxX?r:S.maxX;S.maxY=a>S.maxY?a:S.maxY;if(r<0||r>e.outerWidth||a<0||a>e.outerHeight){S.overflow=1}else{var n=Math.floor(r/(S.width/h));var o=Math.floor(a/(S.height/h));var c=o*h+n+1;if(p){if(!m[c]){m[c]=true;f.push(c)}}else{if(c!=v){f.push(c);v=c}}}}}});e.addEventListener&&e.addEventListener("click",function(t){w++;var r=t.screenX-e.screenX;var a=t.screenY-e.screenY;var n=Math.floor(r/(S.width/h));var o=Math.floor(a/(S.height/h));var i=o*h+n+1;_.push(i)});e.addEventListener&&e.addEventListener("beforeunload",k);var E=e.setTimeout(k,5e4);function k(){dvObj.registerEventCall(impId,{dvp_mslots:f.join(","),dvp_acmmt:new Date-l,dvp_acmec:y,dvp_mvpw:S.width,dvp_mvph:S.height,dvp_mmx:S.maxX,dvp_mmy:S.maxY,dvp_movr:S.overflow,dvp_mecnf:g,dvp_uslot:p,dvp_mclk:w,dvp_mclkl:_.join(","),dvp_mfoco:q?1:0,dvp_mvpsc:x?1:0});e.removeEventListener&&e.removeEventListener("beforeunload",k);e.clearTimeout(E)}}}else{c.dvp_acmns=1}}var L=Object.prototype.toString;var C=Function.prototype.toString;var j=/^\[object .+?Constructor\]$/;var H=RegExp("^"+String(L).replace(/[.*+?^${}()|[\]\/\\]/g,"\\$&").replace(/toString|(function).*?(?=\\\()| for .+?(?=\\\])/g,"$1.*?")+"$");function T(e){var t=typeof e;return t=="function"?H.test(C.call(e)):e&&t=="object"&&j.test(L.call(e))||false}var A=window;var I=0;var M=false;var W=false;try{while(A.parent&&A!=A.parent&&A.parent.document){W|=!T(e.document.hasFocus);A=A.parent;M|=T(window.document.hasFocus)!=T(A.document.hasFocus);if(I++>10)break}}catch(r){}var F=e==window.top?!T(A.document.hasFocus):false;var X=0;function P(e,t){if(t)X=(X|1<<e)>>>0}o(26,M);P(0,F);P(1,W);P(2,M);c.dvp_inv=X;dvObj.registerEventCall(impId,c);if((new Date).getTime()%100<htmlRate&&(lab==1||runTag==1&&(urlTypeId&2)==0&&(sources==0||(sources&n)>0))){function R(t,r){var a=new XMLHttpRequest;a.open("PUT","https://d23xwq4myz19mk.cloudfront.net/htmldata/20180315/"+n+"/"+date+"/"+e.location.hostname+"/"+adid+"_"+impId+"_"+r+".html",true);a.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");a.setRequestHeader("x-amz-acl","public-read");a.send(t.document.documentElement.outerHTML)}R(e,"top");if(e!=window){R(window,"iframe_tag")}if(e!=window.parent){R(window.parent,"iframe_tag_parent")}if(e!=window.parent.parent){R(window.parent.parent,"iframe_tag_parent_parent")}}})()}catch(e){dvObj.registerEventCall(impId,{dvp_ace:String(e).substring(0,150)})}}catch(e){}
});


try{__tagObject_callback_76421736066({ImpressionID:"c0bdede37a5d4e738e2c1726c03617fb", ServerPublicDns:"tps604.doubleverify.com"});}catch(e){}
try{$dvbs.pubSub.publish('BeforeDecisionRender', "c0bdede37a5d4e738e2c1726c03617fb");}catch(e){}
try{__verify_callback_76421736066({
ResultID:2,
Passback:"",
AdWidth:300,
AdHeight:250});}catch(e){}
try{$dvbs.pubSub.publish('AfterDecisionRender', "c0bdede37a5d4e738e2c1726c03617fb");}catch(e){}
