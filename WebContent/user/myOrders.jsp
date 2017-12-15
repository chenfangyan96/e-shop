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
		<c:if test="${orders!=null }">
			<c:forEach items="${orders }" var="o">
				<div class="register-account" style="height: 330px;">
					<h4 class="title">订单号：${o.id }</h4>
					<h4 class="title">
						订单状态：
						<c:if test="${o.state=='nopay' }">
							待支付
						</c:if>
						<c:if test="${o.state =='pay' }">
							等待商家发货
						</c:if>
						<c:if test="${o.state == 'sending' }">
							商品运送中
						</c:if>
						<c:if test="${o.state == 'senddone' }">
							待收货
						</c:if>
						<c:if test="${o.state == 'done' }">
							此单已完成
						</c:if>
						<c:if test="${o.state == 'norepay' }">
							待退款
						</c:if>
						<c:if test="${o.state == 'fail' }">
							已取消的订单
						</c:if>
					</h4>
					<p class="cart">收货人：${o.name }</p>
					<p class="cart">收货地址：${o.area }&nbsp;${o.street }&nbsp;${o.fulladdress }</p>
					<p class="cart">订单总价：${o.total }</p>
					<p class="cart">
						<a href="${basePath }/getOrderDetail.action?id=${o.id}"> 订单详情</a>
					</p>
				</div>

			</c:forEach>

		</c:if>

		<c:if test="${orders==null }">

			<div class="register-account" style="height: 400px;">
				<h4 class="title">您还没有任何订单！</h4>
				<p class="cart">
					请点击<a href="${basePath }/getFoods.action?typeid=0&columnpage=6">挑选商品</a>
					为您挑选东西吧！
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