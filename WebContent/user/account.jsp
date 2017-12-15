<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
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

</head>
<body>
	<!--header-->
	<jsp:include page="/header.jsp" />
	<!---->
	<!--container-->
	<div class="container">
		<div class="account">
			<h2>账户信息</h2>
			<form action="${basePath }/updateInfo.action" method="post"
				 enctype="multipart/form-data">
				<div>
					<span class="word">头像：</span> <img src="${basePath }/${U.imgurl }"
						height="150" width="150"> 
					<c:if test="${edit==1 }">
						<input type="file" name="imagefile" style="left: 125px; bottom: 0px; position: relative; width: 350px; height: 35px; left: 100px; font-size: 20px;">
					</c:if>
				</div>
				<div>
					<span class="word">用户名：</span> ${U.username }
				</div>
				<input type="hidden" name="imgurl" value="${U.imgurl }">
				<input type="hidden" name="id" value="${U.id }">
				<div>
					<span class="mail">Email:</span> 
					<c:if test="${edit==null }">
						${U.email }
					</c:if>
					<c:if test="${edit==1 }">
						<input type="text" name="email" value="${U.email }">
					</c:if>
				
				</div>

				<c:if test="${U.address==null }">
					<div>
						<span class="word">收货地址:</span> <span class="word">当前收货地址为空，点击设置<a
							href="${basePath }/getAddresses.action">当前收货地址</a></span>
					</div>
				</c:if>
				<c:if test="${U.address!=null }">
					<div class="register-account">
						<h4 class="title">
							<a href="${basePath }/getAddresses.action">当前收货地址</a>
						</h4>
						<p class="cart">收货人：${U.address.name }</p>
						<p class="cart">联系方式：${U.address.telephone }</p>
						<p class="cart">省市区：${U.address.area }</p>
						<p class="cart">街道：${U.address.street }</p>
						<p class="cart">详细地址：${U.address.fulladdress }</p>
						<h4 class="title">
							<a href="${basePath }/getAddress.action?id=${U.address.id}">编辑地址</a>
						</h4>
					</div>
				</c:if>
				<div>
					<span class="word">注册时间:</span> ${U.time }
				</div>
				<c:if test="${edit==1 }">
					<input type="submit" value="修改">
				</c:if>
			</form>
			<c:if test="${edit==null }">
				<form action="${basePath }/editInfo.action">
					<input type="submit" value="编辑" />
				</form>
			</c:if>
		</div>

	</div>

	<!---->
	<!--footer-->
	<jsp:include page="/footer.jsp" />
	<!---->
</body>
</html>