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
		<div class="single">
			<div class="col-md-9  single-top" style="width: 500px;">
				<div class="text-in">
					<div class="single-men" style="height: 800px;">
						<img class="img-responsive" src="${basePath }/${food.imgurl}"
							style="height: 370px;" />
						<h5>${food.name }</h5>
						<p>${food.detail }</p>
					</div>

				</div>


			</div>
			<div class="col-md-3 single-bottom"
				style="left: 100px; width: 500px;">
				<div class="store-right"
					style="height: 800px; position: relative; top: 0px">

					<div class="container">
						<div class="account" style="width: 500px;">

							<form action="${basePath }/addMyCart.action">
								 <input type="hidden" name="id" value=${food.id }>	
								<div style="height:105px;">
									<span>单价：</span> <span>$${food.price }</span>
								</div>
								<div style="height:105px;">
									<span>数量：</span> <input type="text" style="width: 100px;" value="1" name="count">
								</div>
								<div style="height:145px;">
									<span>备注：</span>
									<textarea name="text" placeholder="请备注必要信息..."></textarea>
								</div>
								<div style="height:105px;">
									<span>承诺：</span> <span>正品保证&nbsp;&nbsp;&nbsp;快速退款&nbsp;&nbsp;&nbsp;七天无理由退换</span>
								</div>
								<input type="submit" value="加入购物车"
									style="position: relative; top: 30px;">
							</form>
						</div>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>

	<!---->
	<!--footer-->
	<jsp:include page="/footer.jsp" />
	<!---->
</body>
</html>