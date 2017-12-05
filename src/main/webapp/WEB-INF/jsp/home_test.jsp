<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>恩次方研发管理平台</title>


<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery-3.2.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery.easyui.min.js"  charset="UTF-8"></script>
<link rel="stylesheet" href="<%=basePath %>js/jquery-easyui-1.5.3/themes/default/easyui.css" type="text/css"  charset="UTF-8"></link>
<link rel="stylesheet" href="<%=basePath %>js/jquery-easyui-1.5.3/themes/icon.css" type="text/css"  charset="UTF-8"></link>
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"  charset="UTF-8"></script>

<script type="text/javascript"   charset="UTF-8">

	
	
</script>


</head>

<body class="easyui-layout">  
    <div data-options="region:'north',title:'${user.name}您好，欢迎访问恩次方研发管理平台'"  href="<%= request.getContextPath()%>/userController.do?north"   border="false"  style="overflow: hidden;"></div>   
    <div data-options="region:'south'"  href="<%= request.getContextPath()%>/userController.do?south"    style="height:20px;overflow: hidden;"></div>   
    <div data-options="region:'west',title:'导航菜单'"   href="<%= request.getContextPath()%>/userController.do?west"   style="width:150px;overflow: hidden;"></div>   
    <%-- <div data-options="region:'center',title:'欢迎使用恩次方研发管理平台' "  href="<%= request.getContextPath()%>/userController.do?center"  style="background:#eee; overflow: hidden;"></div> --%>
    <div region="center">  
        <div class="easyui-tabs" fit="true" border="false" id="tabs">  
           <div title="首页">欢迎来到首页面</div>  
        </div>  
    </div>  
</body>  
</html>
