<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/path.jsp"%>
<!--header-->
<div class="header-in">
	<div class="container">
		<div class="logo">
			<h1>
				<a href="index.html">Food Shop</a>
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

	</div>
</div>