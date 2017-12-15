<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>A Book Apart后台管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${path2 }/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${path2 }/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${path2 }/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${path2 }/assets/css/admin.css">
<script src="${path2 }/assets/js/jquery.min.js"></script>
<script src="${path2 }/assets/js/app.js"></script>
<style type="text/css">
#table-0 {
	align: center;
	margin-left: 260px;
}

#last {
	position: fixed;
	bottom: 0;
}
</style>
</head>
<body>
	<%@ include file="/admin/top_index.jsp"%>
	<div class="am-cf admin-main">
		<%@ include file="/admin/left_index.jsp"%>
		<div class=" admin-content">
			<div class="daohang"></div>
			<div class="admin">
				<div class="admin-biaogelist">

					<div class="listbiaoti am-cf">
						<ul class="am-icon-flag on">商品展示
						</ul> 
					</div>

					<div class="fbneirong">
							<div class="am-form-group am-cf">
								<div class="zuo">商品名：</div>
								<div class="you">
									${food.name }
								</div>
							</div>
							<div class="am-form-group am-cf" style="height:20px;">
							</div>
							<div class="am-form-group am-cf">
								<div class="zuo">类型：</div>
								<div class="you">
									${food.type.name }
								</div>
							</div>
							<div class="am-form-group am-cf" style="height:20px;">
							</div>
							<div class="am-form-group am-cf">
								<div class="zuo">商品价格：</div>
								<div class="you">
									${food.price }
								</div>
							</div>
							
							<div class="am-form-group am-cf" style="height:20px;">
							</div>
							
							<div class="am-form-group am-cf">
								<div class="zuo">商品详情：</div>
								<div class="you">
									${food.detail }
								</div>
							</div>
							
							<div class="am-form-group am-cf" style="height:20px;">
							</div>
							
							<div class="am-form-group am-cf"style="height:323.767px;">
								<div class="zuo">产品图片：</div>
								<div class="you" style="height: 45px;">
									 <img src="${basePath }/${food.imgurl }" class="img-responsive" style="width:186px;height:190.8px;">
								</div>
							</div>
							
							<div class="am-form-group am-cf" style="height:20px;">
							</div>			
							<div class="am-form-group am-cf">
								<div class="you" style="margin-left: 11%;">
									<button type="button" class="am-btn am-btn-success am-radius"
									onclick="window.location.href('${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${current_page}')">返回商品列表</button>
									&nbsp;  &raquo; &nbsp; 
									<button type="button" class="am-btn am-btn-secondary am-radius"
									onclick="window.location.href('${basePath }/getFood.action?id=${food.id}&action=2&current_page=${current_page}')">修改商品信息</button>
								</div>
							</div>
					</div>
				</div>
				<%@ include file="/admin/footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
</html>