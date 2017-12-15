<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<link href="${basePath }/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${basePath }/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="${basePath }/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Food shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>

<script type="text/javascript" src="${basePath }/js/move-top.js"></script>
<script type="text/javascript" src="${basePath }/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>

<script type="text/javascript">
	function checkForm() {
		//判断登陆名
		var userName_ = /^[a-zA-Z_0-9]{3,10}$/;
		//判断密码
		var password_ = /^[a-zA-Z_0-9]{6,20}$/;
		//判断邮箱
		var email_ = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;

		//获得input对象
		var username = document.getElementById("username");
		var password = document.getElementById("password");
		var rePassword = document.getElementById("repassword");
		var email = document.getElementById("email");

		if (username == null || username.value == "") {
			alert("用户名不能为空");
			return false;
		} else if (username.value.match(userName_) == null) {
			alert("您输入的用户名与规定类型不匹配");
			return false;
		} else if (password == null || password.value == "") {
			alert("密码不能为空");
			return false;
		} else if (password.value.match(password_) == null) {
			alert("您输入的密码与规定类型不匹配");
			return false;
		} else if (password.value != rePassword.value) {
			alert("两次密码不一致");
			return false;
		} else if (email == null || email.value == "") {
			alert("email不能为空");
			return false;
		} else if (email.value.match(email_) == null) {
			alert("您输入的邮箱格式不正确");
			return false;
		} else {
			return true;
		}

	}

	function getXHR() {
		var xmlHttp;
		try {
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					alert("你的浏览器不支持ajax");
					return false;
				}
			}

		}
		return xmlHttp;
	}

	window.onload = function() {
		document.getElementById("username").onblur = function() {
			//发出已补请求  
			//1/得到xhr对象  
			var xhr = getXHR();
			//2.注册状态变化监听器  

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						document.getElementById("erreo").innerHTML = xhr.responseText;
					}
				}

			}
			//3.建立与服务器的连接  
			xhr.open("POST", "ajaxValidate.action" + "?time=" + new Date().getTime());
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			//4.向服务器发出请求  
			xhr.send("username=" + this.value);

		}

	}
</script>

</head>
<body>
	<!--header-->
	<jsp:include page="header.jsp" />
	<!---->
	<!--container-->
	<div class="container">
		<div class="account">
			<h2>Register</h2>
			<form action="register.action" method="post"
				 enctype="multipart/form-data" onsubmit="return checkForm()">
				<div>
					<span class="name-in">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</span> <input type="text" name="username"
						id="username" /> <span id="erreo"></span>

				</div>
				<div>
					<span class="name-in">输入密码：</span> <input type="password"
						name="password" id="password">
				</div>
				<div>
					<span class="name-in">确认密码：</span> <input type="password"
						name="repassword" id="repassword">
				</div>
				<div>
					<span class="mail">邮箱：</span> <input type="text" name="email"
						id="email">
				</div>
				<div>
					<span class="mail">头像：</span><input type="file" name="imagefile"
						id="imagefile" style="left:125px; bottom:31px; position:relative; width:689px; height:43px; font-size:20px;"/>
				</div>
				<input type="submit" value="register">
			</form>
		</div>
	</div>
	<!---->
	<!--footer-->
	<jsp:include page="footer.jsp" />
	<!---->
</body>
</html>
${msg }
