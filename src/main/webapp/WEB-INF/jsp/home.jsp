<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.5.3/themes/default/easyui.css"></link>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.5.3/themes/icon.css" ></link>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.5.3/themes/iconexp.css" ></link>
   	<link rel="stylesheet" href="<%=basePath %>font/font-awesome.min.css" type="text/css"></link>
   	<link rel="stylesheet" href="<%=basePath %>css/home.css" type="text/css"></link>

  <script type="text/javascript">
  	function addTabs(title,url){
   		/*如果已经存在选项卡，则选择已经存在选项卡，而不新产生一个
   		*/
   		if($("#tabs").tabs('exists',title)){
   			$("#tabs").tabs('select', title);
  			if(title=="重新规划线路"||title=="通勤线路"||title=="订单轨迹"){
  				var tab = $("#tabs").tabs('getSelected');  // 获取选择的面板
  				$("#tabs").tabs('update', {
  					tab: tab,
  					options: {
  						content : '<iframe src="'+ ''+ url
  							+ '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
  					}
  				});
  			}
  		}else{
  			//否则新产生一个新的选项卡
  			$("#tabs").tabs('add',{
  				title:title,
  				closable:true,
  				content:'<iframe src="'+''+url+'" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
  			});
  		}
  	}

  	function closeTabs(title){
  		if($("#tabs").tabs('exists',title)){
  			$("#tabs").tabs('close',title);
  		}
  	}

      //删除Tabs
  	function closeTab(menu, type) {
  		var allTabs = $("#tabs").tabs('tabs');
  		var allTabtitle = [];
  		$.each(allTabs, function (i, n) {
  			var opt = $(n).panel('options');
  			if (opt.closable){
  				allTabtitle.push(opt.title);
  			}
  		});
  		var curTabTitle = $(menu).data("tabTitle");
  		var curTabIndex = $("#tabs").tabs("getTabIndex", $("#tabs").tabs("getTab", curTabTitle));
  		switch (type) {
  			case 1:
  				$("#tabs").tabs("close", curTabIndex);
  				return false;
  				break;
  			case 2:
  				for (var i = 0; i < allTabtitle.length; i++) {
  					$('#tabs').tabs('close', allTabtitle[i]);
  				}
  				break;
  			case 3:
  				for (var i = 0; i < allTabtitle.length; i++) {
  					if (curTabTitle != allTabtitle[i]){
  						$('#tabs').tabs('close', allTabtitle[i]);
  					}
  				}
  				$('#tabs').tabs('select', curTabTitle);
  				break;
  			case 4:
  				for (var i = curTabIndex; i < allTabtitle.length; i++) {
  					$('#tabs').tabs('close', allTabtitle[i]);
  				}
  				$('#tabs').tabs('select', curTabTitle);
  				break;
  			case 5:
  				for (var i = 0; i < curTabIndex-1; i++) {
  					$('#tabs').tabs('close', allTabtitle[i]);
  				}
  				$('#tabs').tabs('select', curTabTitle);
  				break;
  		}
  	}


  	$(function () {
  		document.title='恩次方租车管理平台';
  		//$("#loginImg").attr('src','${sessionScope.user.mode.company.companyRemark}');
  		$('#setting_Dialog').dialog({
  			top:200,
  			closed : true
  		});
  		loadTab(0,"<%= request.getContextPath()%>/userController/indexPage.do");
  		//监听右键事件，创建右键菜单
  		$('#tabs').tabs({
  		    onContextMenu:function(e, title,index){
  		        e.preventDefault();
  		        if(index>0){
  		            $('#mm').menu('show', {
  		                left: e.pageX,
  		                top: e.pageY
  		            }).data("tabTitle", title);
  		        }
  		    }
  		});
  		//右键菜单click
  		$("#mm").menu({
  		    onClick : function (item) {
  		        closeTab(this, item.name);
  		    }
  		});

  		$(".top-menu-panel li").each(function(){
  			$(this).click(function(){
  				var rel=$(this).attr("rel");
  				var title=$(this).attr("title");
  				if(rel!=undefined){
  					addTabs(title,rel);
  				}
  			});
  		});
  	});

  	   /**
  		*退出系统
  		*/
  		/* function exitSys(){
  			$.ajax({
  				url : "logout",
  				dataType : 'json',
  				success : function() {
  					window.location.href="login.jsp";
  				},
  				error:function(){
  					window.location.href="exit";
  				}
  			});
  		} */
  	   
  		function logout(b) {
  			$.post("<%= request.getContextPath()%>/userController.do?logout", function() {
  				if (b) {
  					location.href='<%= request.getContextPath()%>/';
  				} 
  			});
  		}
  	   

  		function setHeight(){

  				var westH=document.getElementById('west').offsetHeight;
  				document.getElementById("fream").setAttribute("height",westH-4+"px");
  			}

  		//fream 调用
  		function freamAddTab(title,url){
  			addTabs(title, url);
  		}

  		//更新面板，index为对应的面板顺序(0开始)
  		function loadTab(index,url){
  			var tab=$('#tabs').tabs('getTab',index);
  			$('#tabs').tabs('update',{
  				tab:tab,
  				options:{
  					content:'<iframe src="'+''+url+'" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
  				}
  			});
  		}
  </script>

  </head>
  <body class="easyui-layout" >
    <div id="mm" class="easyui-menu" style="width:120px;display: none;">
         <div id="mm-tabclose" data-options="name:1">关闭</div>
         <div id="mm-tabcloseall" data-options="name:2">全部关闭</div>
         <div id="mm-tabcloseother" data-options="name:3">除此之外全部关闭</div>
         <div class="menu-sep"></div>
         <div id="mm-tabcloseright" data-options="name:4">当前页右侧全部关闭</div>
         <div id="mm-tabcloseleft" data-options="name:5">当前页左侧全部关闭</div>
     </div>
    <div region="north" split="false" border="false" id="north" style="height: 100px; background: url('<%= request.getContextPath()%>/image/head-bg.jpg'); ">
         <div style="float:right; height: 100px; width:70%;">

             <div class='head-user-btn'>
               <p class='icon' >
                 <a><span class='icon-wifi'  >服务状态</span></a>
                 <a><span class="icon-bullhorn">消息</span></a>
                 <a onclick="updatePassWord()"><span>修改密码</span></a>|
                 <a><span>帮助</span></a>
                 <a id="setIcon" style="visibility:hidden"><span onclick="settingNow()">设置</span></a>
               </p>
             </div>
             <div>
               <ul class="top-menu-panel">
                   <li class='' data-attr=5 onclick="logout(true)"><img src='<%= request.getContextPath()%>/image/out.png' ><span>安全退出</span></li>
                   <li  class='top-menu-hot' data-attr rel='page/alarm/alarmGl.html' title='报警管理' >
                     <img src='<%= request.getContextPath()%>/image/alarm.png' ><span>报警</span></li>
                   <li  id="mainRemind"  class='top-menu-hot' data-attr=0 rel='page/car/maintain/maintain.html' title='维保提醒'>
                     <img src='<%= request.getContextPath()%>/image/repair.png' ><span>维保提醒</span>
                   </li>
                   <li class='top-menu-hot' data-attr=2 rel='page/dispatch/ToFinance.html' title='费用审核'>
                     <img src='<%= request.getContextPath()%>/image/approve.png'  ><span>费用审核</span>
                   </li>
                   <li class='top-menu-hot' data-attr=2 rel='page/dispatch/MissionCenter.html' title='任务中心'>
                     <img src='<%= request.getContextPath()%>/image/re.png' ><span>订单指派</span>
                   </li>
                   <li class='top-menu-hot' data-attr rel='page/map/carMonitoring.html' title='车辆监控'>
                     <img src='<%= request.getContextPath()%>/image/position.png' ><span>多车定位</span>
                   </li>
                 </ul>
             </div>
         <script type="text/javascript">
         !(function() {
             $("ul.top-menu-panel li:nth-child(6)").attr("data-attr", "0");
             $("ul.top-menu-panel li:nth-child(2)").attr("data-attr", "0");
             $("ul.top-menu-panel li:nth-child(5)").attr("data-attr", '0');
             $("ul.top-menu-panel li:nth-child(4)").attr("data-attr", '0');
             $(document.getElementById("mainRemind")).attr("data-attr", 0);
         }());
         </script>
       </div>
         <div style="height:100px;padding-left:22px; width: 400px; ">
             <img id="loginImg" src="<%= request.getContextPath()%>/image/companyLogo.png"  width="65px" height="65px" style="margin-top: 20px;float: left;"/>
             <p style="margin:12px 0 0 70px; padding-top: 25px; float: left;">
               <span style="font-size: 20px;font-weight: bold; ">恩次方租车管理平台</span><br /><br />
             <span style="font-size: 14px; margin-top: 10px; color:#f00 " >欢迎您！</span>
             </p>
         </div>
    </div>


     <div data-options="region:'west',title:'导航菜单',split:true,iconCls:'icon-navigation'"  id='west' style="width:262px;">
       <iframe src="<%= request.getContextPath()%>/userController/tree.do" scrolling="auto" onload="setHeight()" style="border: none;width: 100%;" id='fream'></iframe>
     </div>

     <div data-options="region:'center',title:'主界面'" style="padding:5px;background:#eee;">
        <div class="easyui-tabs" data-options= "fit:true" id="tabs">
         <div id="Tab1" title="首页">

         </div>
        </div>
     </div>
     <div data-options="region:'south',split:false,border:false"
     style="overflow: hidden; height: 30px;
           background:#E7F0FF repeat-x center 100%;
           text-align: center;
           line-height: 20px;color: #000; font-family: 微软雅黑;font-weight:100 ;">

     <span style="font-size: 14px;display: inline-block; line-height: 30px;">
         CopyRight@2015-2019 yxtzc.cn Rights Reserved.　西安恩次方科技有限公司　版权所有　陕ICPXXXXXXXXXX号
     </span>
     </div>
  </body>
</html>
