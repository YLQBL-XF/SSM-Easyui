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
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"  charset="UTF-8"></script>
<link rel="stylesheet" href="<%=basePath %>js/jquery-easyui-1.5.3/themes/default/easyui.css" type="text/css"></link>
<script type="text/javascript"   charset="UTF-8">
	var loginInputForm;
	$(function() {

		loginInputForm = $('#loginInputForm').form({
			url : 'userController/login.do',
			success : function(data) {
				console.info(data);
				var d = $.parseJSON(data);
				if (d.success) {
					location.href="<%= request.getContextPath()%>/userController/home.do";
				} else {
					$("#hiddentip").val("*"+d.msg);
					$("#hiddentip").show();
				}
			}
		});

		loginInputForm.find('input').on('keyup', function(event) {/* 增加回车提交功能 */
			if (event.keyCode == '13') {
				loginInputForm.submit();
			}
		});
	});
</script>

</head>
<body>		
<h1 align="center">Login</h1>
<div align="center" style="overflow: hidden;padding: 5px;">

	<form  id="loginInputForm" method="post">
	
		<input type="text" name="name" id="id_name" class="easyui-validatebox" required="true" placeholder="请输入用户名" ><br/><br/>
		
		<input type="password" id="id_password" name="password"  class="easyui-validatebox"  required="true" placeholder="请输入密码"><br/>
		<input  id="hiddentip" name="hiddentip" value=""  readonly="readonly" style="display:none;border:none;color:red;"/><br/><br/>
		
		<button type="submit">登录</button>
	</form>
</div>
</body>
</html>
