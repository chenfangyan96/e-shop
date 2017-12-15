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

		<div class="register-account" style="height: 260px;">
			<h4 class="title">订单号：${order.id }</h4>
			<h4 class="title">
				订单状态：
				<c:if test="${order.state=='nopay' }">
							待支付
						</c:if>
				<c:if test="${order.state =='pay' }">
							等待商家发货
						</c:if>
				<c:if test="${order.state == 'sending' }">
							商品运送中
						</c:if>
				<c:if test="${order.state == 'senddone' }">
							待收货
						</c:if>
				<c:if test="${order.state == 'done' }">
							此单已完成
						</c:if>
				<c:if test="${order.state == 'norepay' }">
							等待商家退款
						</c:if>
				<c:if test="${order.state == 'fail' }">
							已取消的订单
						</c:if>
			</h4>
			<h4 class="title">收货人：${order.name }</h4>
			<h4 class="title">收货地址：${order.area }&nbsp;${order.street }&nbsp;${order.fulladdress }</h4>
		</div>


		<c:forEach items="${order.orderdetails }" var="oo">
			<div class="single" style="height: 280px;">
				<div class="col-md-9  single-top"
					style="width: 200px; height: 220px; position: relative; bottom: 25px;">
					<div class="text-in">
						<div class="single-men">
							<h4 class="title">${oo.food.name }</h4>
							<p style="height: 20px;"></p>
							<img class="img-responsive" src="${basePath }/${oo.food.imgurl}"
								style="height: 158px;" />
						</div>
					</div>
				</div>
				<div class="col-md-3 single-bottom"
					style="left: 100px; width: 500px;">
					<div class="store-right">
						<div class="container">
							<div class="account" style="height: 200px;">
								<div style="height: 40px;">
									<span>单价：</span> <span>${oo.food.price }</span>
								</div>
								<div style="height: 40px;">
									<span>数量：</span> <span>${oo.count }</span>
								</div>
								<div style="height: 40px;">
									<span>备注：</span> <span>${oo.text }</span>
								</div>
								<div style="height: 40px;">
									<span>总价：</span> <span>${oo.sum } </span>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="register-account" style="height: 210px;">
			<h4 class="title">此单总价：${order.total }</h4>
			<h4 class="title">
				<c:if test="${order.state != 'done'&& order.state !='fail'&& order.state!='norepay' }">
					<a href="${basePath }/updateOrderState.action?id=${order.id}&action=cancel&state=${order.state}">取消订单</a>
				</c:if>
				<c:if test="${order.state=='nopay' }">
					<a href="${basePath }/updateOrderState.action?id=${order.id}&state=${order.state}">确认支付</a>
				</c:if>
				<c:if test="${order.state == 'senddone' }">
					<a href="${basePath }/updateOrderState.action?id=${order.id}&state=${order.state}">确认收货</a>
				</c:if>
				<c:if test="${order.state == 'done' }">
					<a href="#">参与评价</a>
				</c:if>
			</h4>
		</div>


	</div>
	<!---->
	<!--footer-->
	<jsp:include page="/footer.jsp" />
	<!---->
</body>
</html>