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
		<c:if test="${cart==null }">
			<div class="register-account" style="height: 400px;">
				<h4 class="title">您的购物车现在还是空的哦！</h4>
				<p class="cart">
					请点击<a href="${basePath }/getFoods.action?typeid=0&columnpage=6">挑选商品</a>
					为您的购物车添点东西吧！
				</p>
			</div>
		</c:if>
		<c:if test="${cart!=null }">
			<form action="${basePath }/deleteSomeFoodCart.action" id="fs">
				<input type="hidden" name="current_page" value="${page.current_page }">
				<c:forEach items="${cart }" var="foodcart">
					<div class="single" style="height: 260px;">
						<div class="col-md-9  single-top"
							style="width: 200px; height: 220px; position: relative; bottom: 25px;">
							<div class="text-in">
								<div class="single-men">
									<h4 class="title"><input type="checkbox" name="choose" value="${foodcart.food.id }">${foodcart.food.name }</h4>
									<p style="height: 20px;"></p>
									<img class="img-responsive"
										src="${basePath }/${foodcart.food.imgurl}"
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
											<span>单价：</span> <span>${foodcart.food.price }</span>
										</div>
										<div style="height: 40px;">
											<span>数量：</span> <a
												href="${basePath }/cutFoodCount.action?id=${foodcart.food.id}">-&nbsp;</a>
											【&nbsp;${foodcart.foodCount }&nbsp;&nbsp;】 <a
												href="${basePath }/addFoodCount.action?id=${foodcart.food.id}">&nbsp;+</a>
										</div>
										<div style="height: 40px;">
											<span>备注：</span> <span>${foodcart.text }</span>
										</div>
										<div style="height: 40px;">
											<span>总价：</span> <span>${foodcart.sum } </span>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>

					</div>
					<div class="single">
						<h4 class="title">
							<a href="${basePath }/deleteFoodCart.action?id=${foodcart.food.id}&current_page=${page.current_page}">删除此商品</a>
							<a href="${basePath }/getFood.action?id=${foodcart.food.id}">查看此商品</a>
						</h4>
					</div>
				</c:forEach>

				<c:if test="${page != null && page.page_count > 1 }">
					<div class="browse">
						<a class="more"
							href="${basePath }/showMyCart.action?current_page=1"
							style="width: 160px;">首页</a> <a class="more"
							style="width: 300px; height: 51px;"> <c:if
								test="${page.current_page != 1 }">上一页</c:if> <c:if
								test="${page.current_page != page.page_count }">下一页</c:if>
						</a>
						<c:if test="${page.current_page != 1 }">
							<a class="wmuSliderNext" style="bottom: 33px; left: 175px;"
								href="${basePath }/showMyCart.action?current_page=${page.current_page - 1 }"></a>
						</c:if>
						<c:if test="${page.current_page != page.page_count }">
							<a class="wmuSliderPrev" style="bottom: 33px; left: 415px;"
								href="${basePath }/showMyCart.action?current_page=${page.current_page + 1 }"></a>
						</c:if>

						<a class="more"
							href="${basePath }/showMyCart.action?current_page=${page.page_count }"
							style="width: 160px;">尾页</a>
						<div class="clearfix"></div>
					</div>
				</c:if>
				<div class="single">
					<h4 class="title" style="position: relative; bottom: 80px;">
						<a href="${basePath }/checkAddress.action">提交订单</a> 
						<a href="${basePath }/emptyCart.action">清空购物车 </a>
						<a onclick="document:fs.submit();">批量删除 </a>
					</h4>
				</div>
			</form>
		</c:if>




	</div>

	<!---->
	<!--footer-->
	<jsp:include page="/footer.jsp" />
	<!---->
</body>
</html>