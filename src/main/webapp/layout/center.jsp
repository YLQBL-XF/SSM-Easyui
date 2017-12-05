<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.5.3/jquery-3.2.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.5.3/jquery.easyui.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>
<link rel="stylesheet" href="<%=basePath%>js/jquery-easyui-1.5.3/themes/default/easyui.css" type="text/css" charset="UTF-8"></link>
<link rel="stylesheet" href="<%=basePath%>js/jquery-easyui-1.5.3/themes/icon.css" type="text/css" charset="UTF-8"></link>
<link rel="stylesheet" href="<%=basePath%>css/baseCss.css"type="text/css"></link>
<link rel="stylesheet" type="text/css"href="<%=basePath%>css/zhuce.css" />
<script type="text/javascript" src="<%=basePath%>js/zhuce.js"></script>

<script type="text/javascript" charset="UTF-8">

	//-------------------------------全局变量区域---------------------------------------
	var datagrid;
	var userDialog;
	var userForm;
	//------------------------------------------------------------------------------
	
	//-------------------------------页面初始化，相当于activity的oncreate  start------------------
	$(function(){
		userForm = $('#userForm').form();
		
		userDialog = $('#userDialog').show().dialog({
			modal : true,
			maximizable:true,
			resizable:true,
			width: 400,    
			title : '用户信息',
			buttons : [ {
				text : '确定',
				handler : function() {
				if (userForm.find('[name=id]').val() != '') {
					userForm.form('submit', {
						url : 'updateUser.do',
						success : function(data) {
							var d = $.parseJSON(data);
							if (d.success) {
								alert(d.success);
								alert(typeof(d.success));
								userDialog.dialog('close');
								$.messager.show({
									msg : '用户编辑成功！',
									title : '提示'
								});
								datagrid.datagrid('reload');
							}
						}
					});
				} else { 
					userForm.form('submit', {
						url : 'addUser.do',
						success : function(data) {
							var d = $.parseJSON(data);
							if (d.success) {
									alert(d.success);
									alert(typeof(d.success));
									userDialog.dialog('close');
									$.messager.show({
										msg : '用户创建成功！',
										title : '提示'
									});
									datagrid.datagrid('reload');
								}
							}
						});
					} 
				}
			} ]
		}).dialog('close');
		
		//---------------------------------------datagrid  start------------------------------
		datagrid = $('#datagrid').datagrid({
			url : '<%=request.getContextPath()%>/userController/list.do',
			toolbar : '#toolbar',
			title : '用户列表',
			iconCls : '',
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ],
			fit : true,
			fitColumns : true,
			nowrap : false,
			border : false,
			idField : 'id',
			columns:[[
			          {
			        	  title:'编号',
			        	  field:'id',
			        	  width:100,
			        	  checkbox : true,
			        	  sortable:true
					  },
					  
			          {
						  title:'姓名',
			        	  field:'name',
			        	  width:100,
			        	  sortable:true
					  },
					  
			          {
						  title:'密码',
			        	  field:'password',
			        	  width:100,
					  },
					  
			          {
						  title:'年龄',
			        	  field:'age',
			        	  width:100,
			        	  sortable:true
					  },
					  
			          {
						  title:'地址',
			        	  field:'address',
			        	  width:100,
					  },
					  
			          {
						  title:'学历',
			        	  field:'education',
			        	  width:100,
					  },
					  
			          {
						  title:'身份证号',
			        	  field:'identity',
			        	  width:100,
					  },
			          {
						  title:'手机',
			        	  field:'phon',
			        	  width:100,
					  },
					  
			          {
						  title:'单位名称',
			        	  field:'unitname',
			        	  width:100,
					  },
					  
			          {
						  title:'单位地址',
			        	  field:'unitaddress',
			        	  width:100,
					  },
					  
			          {
						  title:'注册时间',
			        	  field:'createDate',
			        	  width:100,
					  },
					  
			          {
						  title:'状态',
			        	  field:'status',
			        	  width:100,
					  },
					  
			          {
						  title:'上次修改时间',
			        	  field:'modificationTime',
			        	  width:100,
					  },
					  
			          {
						  title:'上传文件',
			        	  field:'uploadFile',
			        	  width:100,
					  },
					  
			          {
						  title:'ip',
			        	  field:'ip',
			        	  width:100,
					  }
		          ]]
		});
	//---------------------------------------datagrid  start------------------------------
	
	});
	//-------------------------------页面初始化，相当于activity的oncreate  end-------------------	
	
	
//-------------------------------function 区域  start---------------------------
	function searchFun() {//查找
		datagrid.datagrid('load', {
			name : $('#toolbar input[name=name]').val(),
			identity : $('#toolbar input[name=identity]').val(),
			phon : $('#toolbar input[name=phon]').val(),
		});
	}
	function clearFun() {//清空的
		$('#toolbar input').val('');
		datagrid.datagrid('load', {});
	}

	
	function append() {//打开增加用户的dialog的方法
		userDialog.dialog('open');
		userForm.form('clear');
	}
	
	
	
	//---------------------------------打开编辑用户的dialog的方法--------------------
	function edit() {
		var rows = datagrid.datagrid('getSelections');
		if (rows.length != 1 && rows.length != 0) {
			var names = [];
			for ( var i = 0; i < rows.length; i++) {
				names.push(rows[i].name);
			}
			$.messager.show({
				msg : '只能择一个用户进行编辑！您已经选择了【' + names.join(',') + '】' + rows.length + '个用户',
				title : '提示'
			});
		} else if (rows.length == 1) {
			alert(111);
			userForm.find('[name=name]').attr('readonly', 'readonly');
			userDialog.dialog('open');
			userForm.form('clear');
			userForm.form('load', {
				id : rows[0].id,
				name : rows[0].name,
				password : rows[0].password,
				passwordagain : rows[0].passwordagain,
				age : rows[0].age,
				address : rows[0].address,
				education : rows[0].education,
				identity : rows[0].identity,
				phon : rows[0].phon,
				unitname : rows[0].unitname,
				unitaddress : rows[0].unitaddress,
			});
		}
	}

	//-------------------------------------delUser  start-------------------------------
	function remove() {
		var ids = [];
		var rows = datagrid.datagrid('getSelections');
		if (rows.length > 0) {
			$.messager.confirm('请确认', '您要删除当前所选项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
					}
					$.ajax({
						url : 'delUsersBatch.do',
						data : {
							ids : ids.join(',')
						},
						cache : false,
						dataType : "json",
						success : function(response) {
							datagrid.datagrid('unselectAll');
							datagrid.datagrid('reload');
							$.messager.show({
								title : '提示',
								msg : '删除成功！'
							});
						}
					});
				}
			});
		} else {
			$.messager.alert('提示', '请选择要删除的记录！', 'error');
		}
	}
	//----------------------------------delUser  end----------------------------------
	
	
	
	$(document).ready(function(){
        check();//验证用户名是否存在
    });
    function check(){
        $('#ipt_name').blur(function(){
            var a=$(this).val();
            var vu=document.getElementById("ipt_name").value;
            var changUrl='<%=request.getContextPath()%>/userController/checkUserName.do?name='+ vu;
			$.get(changUrl, function(str) { 
				var x = $.parseJSON(str);
				if (x.obj == '1') {
					$('#tishi').html("您输入的用户名已存在，请重新输入");
				}
			});
		});
	}
//-----------------------------------function 区域   end-------------------------------------
</script>

<div class="easyui-layout" fit="true" border="false" id="centerTabs">
	<div region="center" title="" border="false" style="overflow: hidden;">

		<!-- shixiaohui add for search_User start at 20171109 start -->
		<div id="toolbar" class="datagrid-toolbar"
			style="height: auto; display: none;">
			<fieldset>
				<legend>筛选</legend>
				<table class="tableForm">
					<tr>
						<th>用户名称:</th>
						<td><input name="name" style="width: 150px;" /></td>

						<th>身份证号:</th>
						<td><input name="identity" style="width: 260px;" /></td>
					</tr>

					<tr>
						<th>手机号码:</th>
						<td><input name="phon" style="width: 150px;" /></td>
					</tr>

					<tr>
						<td colspan="2"><a class="easyui-linkbutton"
							iconCls="icon-search" plain="true" onclick="searchFun();"
							href="javascript:void(0);">查找</a> <a class="easyui-linkbutton"
							iconCls="icon-search" plain="true" onclick="clearFun();"
							href="javascript:void(0);">清空</a>
						<td>
					</tr>
				</table>


			</fieldset>
			<div>
				<a class="easyui-linkbutton" iconCls="icon-add" onclick="append();"
					plain="true" href="javascript:void(0);">增加</a> <a
					class="easyui-linkbutton" iconCls="icon-remove" onclick="remove();"
					plain="true" href="javascript:void(0);">删除</a> <a
					class="easyui-linkbutton" iconCls="icon-edit" onclick="edit();"
					plain="true" href="javascript:void(0);">编辑</a> <a
					class="easyui-linkbutton" iconCls="icon-edit" onclick="editRole();"
					plain="true" href="javascript:void(0);">批量更改角色</a> <a
					class="easyui-linkbutton" iconCls="icon-undo"
					onclick="datagrid.datagrid('unselectAll');" plain="true"
					href="javascript:void(0);">取消选中</a>
			</div>
		</div>
		<!-- shixiaohui add for search_User  at 20171109 start -->

		<!-- shixiaohui add for display UserData start -->
		<table id="datagrid"></table>
		<!-- shixiaohui add for display UserData end -->



		<!-- shixiaohui add for UserData start -->
		<div id="userDialog" style="display: none; overflow: hidden;">
			<form id="userForm" method="post">
				<div class="ipt">
					<span class="hint">用户ID</span> <input name="id" readonly="readonly"
						placeholder="用户ID,无需手动输入" />
				</div>
				<div class="ipt">
					<span class="hint">请输入用户名</span> <input type="text" name="name"
						id="ipt_name" value="" placeholder="用户名" />
					<p id="tishi" class="error name_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">请输入密码</span> <input type="password"
						name="password" maxlength="16" id="ipt_password" value=""
						placeholder="请输入密码" />
					<p class="error password_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">请再输入密码</span> <input type="password"
						name="passwordagain" maxlength="16" id="ipt_passwordagain"
						value="" placeholder="请再输入密码" />
					<p class="error passwordagain_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">年龄</span> <input type="number" maxlength="3"
						name="age" min="0" maxlength="3" id="ipt_age" value=""
						placeholder="年龄" />
					<p class="error age_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">地址</span> <input type="text" name="address"
						id="ipt_address" value="" placeholder="地址" />
					<p class="error address_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">学历</span> <select name="education"
						class="ipt_education">
						<option>==请选择学历==</option>
						<option value="小学">小学</option>
						<option value="初中">初中</option>
						<option value="高中">高中</option>
						<option value="中专">中专</option>
						<option value="大专">大专</option>
						<option value="本科">本科</option>
						<option value="研究生">研究生</option>
						<option value="博士">博士</option>
					</select>
					<p class="error education_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">身份证号</span> <input type="text" name="identity"
						maxlength="18" size="20" id="ipt_identity" value=""
						placeholder="身份证号" />
					<p class="error identity_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">手机号</span> <input type="text" name="phon"
						maxlength="11" id="ipt_phone" value="" placeholder="手机号" />
					<p class="error phone_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">单位名称</span> <input type="text" name="unitname"
						id="ipt_unitname" value="" placeholder="单位名称" />
					<p class="error unitname_error"></p>
				</div>
				<div class="ipt">
					<span class="hint">单位地址</span> <input type="text"
						name="unitaddress" id="ipt_unitaddress" value=""
						placeholder="单位地址" />
					<p class="error unitaddress_error"></p>
				</div>
			</form>
		</div>
		<!-- shixiaohui add for UserData end -->

	</div>

</div>
