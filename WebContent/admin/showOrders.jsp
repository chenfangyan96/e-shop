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
						<ul class="am-icon-flag on">订单列表
						</ul>
					</div>
					<form class="am-form am-g">
						<table width="100%"
							class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
							<thead>
								<tr class="am-success">
									<th class="table-id">ID</th>
									<th class="table-title">收货人</th>
									<th class="table-author am-hide-sm-only">联系方式</th>
									<th class="table-title">收货省市县</th>
									<th class="table-type">街道</th>
									<th class="table-date am-hide-sm-only">详细地址</th>
									<th class="table-title">下单时间</th>
									<th class="table-title">订单状态</th>
									<th class="table-title">订单总额</th>
									<th width="130px" class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orders }" var="o">
									<tr>
										<td>${o.id }</td>
										<td>${o.telephone }</td>
										<td>${o.name }</td>
										<td>${o.area }</td>
										<td class="am-hide-sm-only">${o.street }</td>
										<td class="am-hide-sm-only">${o.fulladdress }</td>
										<td class="am-hide-sm-only">${o.time }</td>
										<td><c:if test="${o.state=='nopay' }">
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
											</c:if></td>
										<td>${o.total }</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button"   class="am-btn am-btn-default am-btn-xs am-text-success am-round"
														title="查看订单详情" onclick="window.location.href('${basePath }/getOrderDetail.action?id=${o.id }&action=back')">
														<span class="am-icon-search"></span>
													</button>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
														data-am-modal="{target: '#my-popups'}" title="修改订单">
														<span class="am-icon-pencil-square-o"></span>
													</button>
													<button
														class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
														title="删除订单">
														<span class="am-icon-trash-o"></span>
													</button>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<ul class="am-pagination am-fr">
							<c:if test="${page != null && page.page_count > 1 }">
								<li><a
									href="${basePath }/showOrders.action?action=${action }&current_page=1">|«</a></li>
								<c:if test="${page.page_count <= 5}">
									<c:forEach begin="1" end="${page.page_count }"
										varStatus="status">
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${status.index }">${status.index }</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${page.page_count > 5}">
									<c:if test="${page.current_page <= 3 && page.current_page >0 }">
										<c:forEach begin="1" end="5" varStatus="status">
											<li><a
												href="${basePath }/showOrders.action?action=${action }&current_page=${status.index }">${status.index }</a></li>
										</c:forEach>
									</c:if>
									<c:if
										test="${page.current_page > 3 && page.current_page < (page.page_count - 1) }">
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.current_page - 2 }">${page.current_page - 2 }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.current_page - 1 }">${page.current_page - 1 }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.current_page }">${page.current_page }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.current_page + 1 }">${page.current_page + 1 }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.current_page + 2 }">${page.current_page + 2 }</a></li>
									</c:if>
									<c:if
										test="${page.current_page >= (page.page_count - 1) && page.current_page <= page.page_count}">
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.page_count - 4 }">${page.page_count - 4 }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.page_count - 3 }">${page.page_count - 3 }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.page_count - 2 }">${page.page_count - 2 }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.page_count - 1 }">${page.page_count - 1 }</a></li>
										<li><a
											href="${basePath }/showOrders.action?action=${action }&current_page=${page.page_count }">${page.page_count }</a></li>
									</c:if>
								</c:if>
								<li><a
									href="${basePath }/showOrders.action?action=${action }&current_page=${page.page_count }">»|</a></li>
							</c:if>
						</ul>
						<hr />
						<p>注：.....</p>
					</form>

				</div>
				<%@ include file="/admin/footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
</html>
</html>