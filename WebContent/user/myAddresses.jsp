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
		<c:if test="${addresses!=null }">
			<c:forEach items="${addresses }" var="a">

				<div class="register-account" style="height:300px;">
					<h4 class="title">收货人：${a.name }</h4>
					<p class="cart">联系方式：${a.telephone }</p>
					<p class="cart">省市区：${a.area }</p>
					<p class="cart">街道：${a.street }</p>
					<p class="cart">详细地址：${a.fulladdress }</p>
					<c:if test="${U.address.id==a.id }">
						<p class="cart">------------此为当前收货地址----------</p>
					</c:if>
					<c:if test="${U.address.id!=a.id }">
					<p class="cart">请点击设置为<a href="${basePath }/setCurrentAddress.action?id=${a.id}"> 当前收货地址</a></p>
					</c:if>
					<h4 class="title"><a href="${basePath }/getAddress.action?id=${a.id}">编辑</a>
									  <a href="${basePath }/deleteAddress.action?id=${a.id}&uid=${U.id}">删除</a></h4>
				</div>

			</c:forEach>
			<div class="register-account" style="height:210px;">
					<h4 class="title"><a href="${path }/addAddress.jsp">新增收货地址</a></h4>
			</div>
			
		</c:if>

		<c:if test="${addresses==null }">

			<div class="register-account" style="height:400px;">
				<h4 class="title">您还没有添加收货地址呢！</h4>
				<p class="cart">
					请点击<a href="${path }/addAddress.jsp"> 添加收货地址</a> 为您增加收货地址吧！
				</p>
			</div>			
		</c:if>
	</div>
	<!---->
	<!--footer-->
	<jsp:include page="/footer.jsp" />
	<!---->
</body>
</html>