<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>登录</title>
		
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery-3.2.1.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery.easyui.min.js"  charset="UTF-8"></script>
		<script type="text/javascript" src="js/zhuce.js"></script>
		
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
						$(".password_error").text("*"+d.msg);
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
		<div id="login">
			<div id="center">
				<div id="center_left">
					<form id="loginInputForm" method="post">
						<div id="center_middle">
							<div id="user">
								<span class="user_title">用户名</span>
								<input type="text" name="name" placeholder="请输入用户名" />
								<p class="error user_error"></p>
							</div>
							<div id="password">
								<span class="password_title">密码</span>
								<input type="password" name="password" placeholder="输入密码">
								<p class="error password_error"></p>
							</div>
						</div>
						<div id="btn1">
							<button>登录</button>
						</div>
						<div id="btn2">
							<a href="zhuce.jsp"></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>

</html>