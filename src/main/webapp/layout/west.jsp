<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8">
var tree;
$(function() {

	var treeData=[{
                id: "dispatchingManagement",
                text: "调度管理",
                state: "closed",
                children: [{
                    id: "taskcenter",
                    text: "任务中心",
                    attributes : {  
                    	url:""  
                    }
                }, {
                    id: "programmeApproval",
                    text: "方案审批",
                    attributes : {  
                        url:""  
                    }
                }]
            }, {
            	 id: "carManager",
                 text: "车辆管理",
                 state: "closed",
                 children:[{
	                 id: "carManagerChildren",
	                 text: "车辆管理",
	                 attributes : {  
	                     url:""  
	                 }
                }]
            }, {
            	id: "customerManager",
                text: "客户管理",
                state: "closed",
                children: [{
                	 id: "customerManagerChildren",
	                 text: "客户管理",
	                 attributes : {  
	                     url:""  
	                 }
                }]
            }, {
				id:"expenseSettlement",
                text: "费用结算",
                state: "closed",
                children: [{
                    id: "expenseSettlementChildren",
                    text: "费用结算",
                    attributes : {  
                        url:""  
                    }  
                }]
            }, {
                text: "用户管理",
                state: "closed",
                children: [{
                    id: "yhgl",
                    text: "用户管理",
                    attributes: {  
                    	url : '<iframe width="100%" height="100%" frameborder="0"  src="<%= request.getContextPath()%>/userController.do?center" style="width:100%;height:100%;margin:0px 0px;"></iframe>'  
                    }  
                }]
            }];

	
	//实例化树形菜单  
    $("#tt").tree({  
        data : treeData,  
        lines : true,  
        onClick : function (node) {  
            if (node.attributes) {  
                Open(node.text, node.attributes.url);  
            }  
        },
        onDbClick:function(node){
        	if(node.state=='closed'){
        		$(this).tree('expand',node.target);
        	}else{
        		$(this).tree('collapse',node.target);
        	}
        }
    });  

    //在右边center区域打开菜单，新增tab  
    function Open(text, url) {  
        if ($("#tabs").tabs('exists', text)) {  
            $('#tabs').tabs('select', text);  
        } else {  
            $('#tabs').tabs('add', {  
                title : text,  
                closable : true,  
                content : url  
            });  
        }  
    }  
      
    //绑定tabs的右键菜单  
    $("#tabs").tabs({  
        onContextMenu : function (e, title) {  
            e.preventDefault();  
            $('#tabsMenu').menu('show', {  
                left : e.pageX,  
                top : e.pageY  
            }).data("tabTitle", title);  
        }  
    });  
      
    //实例化menu的onClick事件  
    $("#tabsMenu").menu({  
        onClick : function (item) {  
            CloseTab(this, item.name);  
        }  
    });  
      
    //几个关闭事件的实现  
    function CloseTab(menu, type) {  
        var curTabTitle = $(menu).data("tabTitle");  
        var tabs = $("#tabs");  
          
        if (type === "close") {  
            tabs.tabs("close", curTabTitle);  
            return;  
        }  
          
        var allTabs = tabs.tabs("tabs");  
        var closeTabsTitle = [];  
          
        $.each(allTabs, function () {  
            var opt = $(this).panel("options");  
            if (opt.closable && opt.title != curTabTitle && type === "Other") {  
                closeTabsTitle.push(opt.title);  
            } else if (opt.closable && type === "All") {  
                closeTabsTitle.push(opt.title);  
            }  
        });  
          
        for (var i = 0; i < closeTabsTitle.length; i++) {  
            tabs.tabs("close", closeTabsTitle[i]);  
        }  
    }  
	
}); 

</script>
<div class="easyui-panel" fit="true" border="false">
	<div>
		<ul id="tt"></ul>	
	</div>
</div>


<%-- <script type="text/javascript" charset="UTF-8">
	var tree;
	$(function() {
		tree = $('#tree').tree({     
			url : '<%=basePath %>'+'myMenuController/gettree.do',
			animate : false,
			lines : true
		});

	});

</script>
<div class="easyui-panel" fit="true" border="false">
	<div class="easyui-accordion" fit="true" border="false">
		<div title="系统菜单" iconCls="icon-tip">
			<div class="easyui-layout" fit="true">
				<div region="north" border="false" style="overflow: hidden;">
					<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-redo" onclick="expandAll();">展开</a><a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-undo" onclick="collapseAll();">折叠</a><a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-reload" onclick="tree.tree('reload');">刷新</a>
					<hr style="border-color: #fff;" />
				</div>
				<div region="center" border="false">
					<ul id="tree" style="margin-top: 5px;"></ul>
				</div>
			</div>
		</div>
	</div>
</div> --%>