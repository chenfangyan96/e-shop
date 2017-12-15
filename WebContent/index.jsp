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
	<div class="header-in">
		<div class="container">
			<div class="logo">
				<h1>
					<a href="${basePath }/index.jsp">Food Shop</a>
				</h1>
			</div>
			<div class="header-top">
				<div class="header-top-in">
					<c:if test="${U== null}">
						<ul class="header-grid">
							<li><a href="${basePath }/register.jsp">注册 </a> <label>/</label></li>
							<li><a href="${basePath }/login.jsp"> 登录 </a></li>
						</ul>
					</c:if>
					<c:if test="${U !=null}">
						<ul class="header-grid">
							<li><a>亲爱的${U.username }，您好！</a></li>
							<li><a href="${basePath }/loginOut.action">注销</a></li>
						</ul>
					</c:if>

					<div class="act">
						<a href="#" class="done">Welcome! </a>
					</div>
					<div class="clearfix"></div>
				</div>
				<ul class="grid-header">
					<li><a href="${basePath }/getUser.action">我的账户</a> <label>/</label></li>
					<li><a href="${basePath }/showMyCart.action">我的购物车</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<!---->
			<div class="header-bottom">
				<div class="top-nav">
					<span class="menu"> </span>
					<ul>
						<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=6">主页 </a><label>-
						</label></li>
						<li><a href="specials.html">特色 </a><label>- </label></li>
						<li class="active1"><a href="${basePath }/getOrders.action"> 我的订单</a><label>- </label></li>
						<li><a href="${basePath }/getAddresses.action"> 我的地址</a><label>- </label></li>
						<li><a href="contact.html">我的评价</a></li>
					</ul>
					<!--script-->
					<script>
						$("span.menu").click(function() {
							$(".top-nav ul").slideToggle(500, function() {
							});
						});
					</script>
				</div>
				<div class="search">
					<form>
						<input type="text" value="Search store here ..."
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '';}"> <input
							type="submit" value="">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
			<!---->
			<div class="banner">
				<div class="banner-in">
					<!---->
					<div class="wmuSlider example1">
						<div class="wmuSliderWrapper">
							<article style="position: absolute; width: 100%; opacity: 0;">
							<div class="banner-wrap">
								<h2>Welcome to our</h2>
								<h5>little shop</h5>
								<p>
									Your choice is <span>our biggest support</span>
								</p>
							</div>
							</article>
							<article style="position: absolute; width: 100%; opacity: 0;">
							<div class="banner-wrap">
								<h2>Our food guarantees</h2>
								<h5>green health</h5>
								<p>
									Your choice is <span>our biggest support</span>
								</p>

							</div>

							</article>
							<article style="position: absolute; width: 100%; opacity: 0;">
							<div class="banner-wrap">
								<h2>Pick your</h2>
								<h5>favorite items</h5>
								<p>
									Your choice is <span>our biggest support</span>
								</p>
							</div>

							</article>
						</div>
					</div>
				</div>
			</div>

			<!---->
			<script src="${basePath }/js/jquery.wmuSlider.js"></script>
			<script>
				$('.example1').wmuSlider({
					pagination : false,
				});
			</script>
			<!---->
		</div>
	</div>
	<!--content-->
	<div class="content">
		<div class="container">
			<div class="content-grid">
				<div class="col-md-4 grid-food">
					<div class="popular">
						<h3 style="margin-top: 25px;">产品分类</h3>
						<p>欢迎光临本店挑选食品，本店商品齐全，物美价廉</p>
						<ul class="popular-in">
							<li><a href="getFoods.action?typeid=1&columnpage=6"><i> </i>商品类型1 </a></li>
							<li><a href="getFoods.action?typeid=2&columnpage=6"><i> </i>商品类型2</a></li>
							<li><a href="getFoods.action?typeid=3&columnpage=6"><i> </i>商品类型3</a></li>
							<li><a href="getFoods.action?typeid=4&columnpage=6"><i> </i>商品类型4</a></li>
						</ul>
					</div>
					<div class="popular phone">
						<h3>在线订购</h3>
						<p>我们的送货速度贼快！</p>
						<ul class="number">
							<li><span><i> </i>(000) 888 88888</span></li>
							<li><a href="mailto:info@sitename.com"><i class="mail">
								</i>food_shop@163.com</a></li>
						</ul>
					</div>
					<div class="popular">
						<h3>意见反馈</h3>
						<p>欢迎您为本店提出您宝贵的意见！</p>
						<form>
							<input type="text" value="Thanks for your advice"
								onFocus="this.value='';"
								onBlur="if (this.value == '') {this.value = 'Thanks for your advice';}">
							<input type="submit" value="提交">
						</form>
					</div>
				</div>
				<!---->
				<div class="col-md-8 food-grid">
					<div class="cup" style="width: 760px; height: 739px;">

						<c:forEach items="${subList }" var="food">
							<div class="col-md-4 cup-in" style="width:228px;height:323.767px;">
								<a href="single.html"><img
									src="${basePath }/${food.imgurl }" class="img-responsive" style="width:186px;height:190.8px;"></a>
								<p>${food.name }</p>
								<span class="dollar">$${food.price }</span>
								<div class="details-in">
									<a href="${basePath }/getFood.action?id=${food.id}" class="details">详情</a>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:forEach>



						<div class="clearfix"></div>
					</div>
					<!---->



					<c:if test="${page != null && page.page_count > 1 }">
						<div class="browse">
							<a class="more"
								href="${basePath }/getFoods.action?current_page=1&typeid=${typeid}&columnpage=6">首页</a>
							<a class="more" style="width: 300px; height: 51px;"> <c:if
									test="${page.current_page != 1 }">上一页</c:if> <c:if
									test="${page.current_page != page.page_count }">下一页</c:if>
							</a>
							<c:if test="${page.current_page != 1 }">
								<a class="wmuSliderNext" style="bottom: 33px; left: 255px;"
									href="${basePath }/getFoods.action?current_page=${page.current_page - 1 }&typeid=${typeid}&columnpage=6"></a>
							</c:if>
							<c:if test="${page.current_page != page.page_count }">
								<a class="wmuSliderPrev" style="bottom: 33px; left: 468px;"
									href="${basePath }/getFoods.action?current_page=${page.current_page + 1 }&typeid=${typeid}&columnpage=6"></a>
							</c:if>

							<a class="more"
								href="${basePath }/getFoods.action?current_page=${page.page_count }&typeid=${typeid}&columnpage=6">尾页</a>
							<div class="clearfix"></div>
						</div>
					</c:if>
					<!---->
					<div class="content-sit">
						<div class="col-md-6 amet">
							<h3>Adpiscing labo</h3>
							<p>Lorem ipsum dolor sit amet</p>
							<div class="egg">
								<a href="single.html"><img src="images/pic.jpg"
									class="img-responsive" alt=""></a>
							</div>
							<p class="para-in">Rem ipsum dolor sit amet consectetur Lorem
								ipsum dolor sit amet, consectetur adipisicing elit sed do
								eiusmod tempor incidi.</p>
						</div>
						<div class="col-md-6 amet-in">
							<h3>Consentur liqua</h3>
							<p>Lorem ipsum dolor sit amet</p>
							<div class="amet-grid">
								<div class="now">
									<span>Nov</span>2017
								</div>
								<p class="sed">
									<span>Lorem ipsum dolor sit amet </span> <span>consecteturLorem
										ipsum dolor sit</span> <span>amet, consectetur adipisicing</span>
								</p>
								<div class="clearfix"></div>
							</div>
							<div class="amet-grid">
								<div class="now">
									<span>Dec</span>2017
								</div>
								<p class="sed">
									<span>Lorem ipsum dolor sit amet </span> <span>consecteturLorem
										ipsum dolor sit</span> <span>amet, consectetur adipisicing</span>
								</p>
								<div class="clearfix"></div>
							</div>
							<div class="amet-grid">
								<div class="now">
									<span>Oct</span>2017
								</div>
								<p class="sed">
									<span>Lorem ipsum dolor sit amet </span> <span>consecteturLorem
										ipsum dolor sit</span> <span>amet, consectetur adipisicing</span>
								</p>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-->
	<jsp:include page="footer.jsp" />
	<!---->
</body>
</html>