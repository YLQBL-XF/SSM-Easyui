<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="css/zhuce.css"/>
		<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery-3.2.1.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery.easyui.min.js"  charset="UTF-8"></script>
		<script type="text/javascript" src="js/zhuce.js"></script>
		<script type="text/javascript"   charset="UTF-8">

		var zhuceForm;
		$(function() {
	
			zhuceForm = $('#zhuceForm').form({
				url : 'userController/addUser.do',
				success : function(data) {
					//alert(data);
					console.info(data);
					var d = $.parseJSON(data);
					if (d.success) {
						location.href="<%= request.getContextPath()%>";
					}
				}
			});
	
			zhuceForm.find('input').on('keyup', function(event) {/* 增加回车提交功能 */
				if (event.keyCode == '13') {
					zhuceForm.submit();
				}
			});
		});
		//-----------验证用户名是否存在-----------------
		$(document).ready(function(){
	        check();
	    });
		
        function check(){
            $('#ipt_name').blur(function(){
                var a=$(this).val();
                var vu=document.getElementById("ipt_name").value;
                var changUrl='<%= request.getContextPath()%>/userController/checkUserName.do?name='+vu;
                $.get(changUrl,function(str){
                    var x = $.parseJSON(str);
                    if(x.obj=='1'){
                        $('#tishi').html("您输入的用户名已存在，请重新输入");
                    }
                });
            });
        }
		
	</script>
	</head>
	<body>
		<div class="zhuce">
			<form id="zhuceForm" method="post">
				<div class="ipt">
					<span class="hint">请输入用户名</span>
					<input type="text" name="name" id="ipt_name" value="" placeholder="用户名"/>
					<p id="tishi" class="error name_error"></p>
					
				</div>
				<div class="ipt">
					<span class="hint">请输入密码</span>
					<input type="password" name="password" maxlength="16" id="ipt_password" value="" placeholder="请输入密码"/>
					<p class="error password_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">请再输入密码</span>
					<input type="password" name="passwordagain" maxlength="16" id="ipt_passwordagain" value="" placeholder="请再输入密码"/>
					<p class="error passwordagain_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">年龄</span>
					<input type="number" maxlength="3" name="age" min="0" maxlength="3" id="ipt_age" value="" placeholder="年龄"/>
					<p class="error age_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">地址</span>
					<input type="text" name="address" id="ipt_address" value="" placeholder="地址"/>
					<p class="error address_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">学历</span>
					<select name="education" class="ipt_education">
						<option> ==请选择学历== </option>
						<option value="小学"> 小学 </option>
						<option value="初中"> 初中 </option>
						<option value="高中"> 高中 </option>
						<option value="中专"> 中专 </option>
						<option value="大专"> 大专 </option>
						<option value="本科"> 本科 </option>
						<option value="研究生"> 研究生 </option>
						<option value="博士"> 博士 </option>
					</select>
					<p class="error education_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">身份证号</span>
					<input type="text" name="identity" maxlength="18" size="20" id="ipt_identity" value="" placeholder="身份证号"/>
					<p class="error identity_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">手机号</span>
					<input type="text" name="phon" maxlength="11" id="ipt_phone" value="" placeholder="手机号"/>
					<p class="error phone_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">单位名称</span>
					<input type="text" name="unitname" id="ipt_unitname" value="" placeholder="单位名称"/>
					<p class="error unitname_error"> </p>
				</div>
				<div class="ipt">
					<span class="hint">单位地址</span>
					<input type="text" name="unitaddress" id="ipt_unitaddress" value="" placeholder="单位地址"/>
					<p class="error unitaddress_error"> </p>
				</div>
				<button class="btn">立即注册</button>
				<div class="directlogin">
					<a href="index.jsp">直接登录</a>
				</div>
			</form>			
		</div>
		
		<script>
 
		</script>
	</body>
</html>
