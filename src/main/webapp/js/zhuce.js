$(function() {
	/*注册界面*/
	//用户名验证
	$("#ipt_name").blur(function() {
		var username = $(this).val();
		if(username == "") {
			$(".name_error").text("用户名不能为空");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".name_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	//输入密码验证
	$("#ipt_password").blur(function() {
		var reg = /^[a-zA-Z]\w{5,17}$/;
		var password = $(this).val();
		if(!reg.test(password)) {
			$(".password_error").text("必须以字母开头，允许6-16位数字、母数、字下划线");
			$("#btn1 button").attr("disabled","true");
		} else if(password.length > 16 || password.length < 6) {
			$(".password_error").text("请输入6~16位的密码");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".password_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	//重新输入密码验证
	$("#ipt_passwordagain").blur(function() {
		var passwordagain = $(this).val();
		var password = $("#ipt_password").val();
		if(passwordagain != password) {
			$(".passwordagain_error").text("两次密码输入不一样");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".passwordagain_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}

	});
	//年龄验证
	$("#ipt_age").blur(function() {
		var age = $(this).val();
		if(age.length > 3) {
			$(".age_error").text("请输入正确的年龄");
			$("#btn1 button").attr("disabled","true");
			return false;
		} else {
			$(".age_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	//	地址验证
	$("#ipt_address").blur(function() {
		if($(this).val() == "") {
			$(".address_error").text("地址不能为空");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".address_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	//学历验证
	$("#ipt_education").blur(function() {
		if($(this).val() == "") {
			$(".education_error").text("地址不能为空");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".education_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	//身份证验证
	$("#ipt_identity").blur(function(){
		$(".identity_error").html(cidInfo(ipt_identity.value));
		if($(this).val()==""){
			$(".identity_error").html("身份证号码不能为空");
		}else if($(this).val().length<18){
			$(".identity_error").html("身份证号码位数不够");
		}
	});
	var aCity = {
				11: "北京",
				12: "天津",
				13: "河北",
				14: "山西",
				15: "内蒙古",
				21: "辽宁",
				22: "吉林",
				23: "黑龙江",
				31: "上海",
				32: "江苏",
				33: "浙江",
				34: "安徽",
				35: "福建",
				36: "江西",
				37: "山东",
				41: "河南",
				42: "湖北",
				43: "湖南",
				44: "广东",
				45: "广西",
				46: "海南",
				50: "重庆",
				51: "四川",
				52: "贵州",
				53: "云南",
				54: "西藏",
				61: "陕西",
				62: "甘肃",
				63: "青海",
				64: "宁夏",
				65: "新疆",
				71: "台湾",
				81: "香港",
				82: "澳门",
				91: "国外"
			}

			function cidInfo(sId) {
				var iSum = 0
				var info = ""
				if(!/^\d{17}(\d|x)$/i.test(sId)) return false;
				sId = sId.replace(/x$/i, "a");
				if(aCity[parseInt(sId.substr(0, 2))] == null) return "非法的身份证号码";
				sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-" + Number(sId.substr(12, 2));
				var d = new Date(sBirthday.replace(/-/g, "/"))
				if(sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) return "非法的身份证号码";
				for(var i = 17; i >= 0; i--) iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11)
				if(iSum % 11 != 1) {return "非法的身份证号码"}else{return ""}
//				return aCity[parseInt(sId.substr(0, 2))] + "," + sBirthday + "," + (sId.substr(16, 1) % 2 ? "男" : "女")
			}
	//手机号码验证
	$("#ipt_phone").blur(function() {
		var phone = $(this).val();
		var reg= /^0?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$/;
		if(!reg.test(phone)){
			$(".phone_error").text("手机号码格式有误");
			$("#btn1 button").attr("disabled","true");
		}else if(phone.length != 11) {
			$(".phone_error").text("手机号码位数不够");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".phone_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
		
	});
	//单位名称验证
	$("#ipt_unitname").blur(function() {
		var unitname = $(this).val();
		if(unitname == "") {
			$(".unitname_error").text("单位名称不能为空");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".unitname_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	//单位地址验证
	$("#unitaddress").blur(function() {
		var unitaddress = $(this).val();
		if(unitname == "") {
			$(".unitaddress_error").text("单位地址不能为空");
			$("#btn1 button").attr("disabled","true");
		} else {
			$(".unitaddress_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	
	/*登录界面*/
//	用户名
	$("#user>input").blur(function(){
		if($(this).val()==""){
			$(".user_error").text("*用户名不能空");
			$("#btn1 button").attr("disabled","true");
			
		}else{
			$(".user_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");
		}
	});
	//密码
	$("#password>input").blur(function(){
		var reg=/^[a-zA-Z]\w{5,17}$/;
		var passwordValue=$(this).val();
		if(passwordValue==""){
			$(".password_error").text("*密码不能为空");
			$("#btn1 button").attr("disabled","true");
		}else{
			$(".password_error").text("");
			$("#btn1 button").attr("disabled","false");
			$("#btn1 button").removeAttr("disabled");

		}
	});
});