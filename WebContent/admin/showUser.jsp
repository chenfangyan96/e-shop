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
				<div class="admin-biaogelist" style="height:500px;">

					<div class="listbiaoti am-cf">
						<ul class="am-icon-users">会员管理
						</ul>
					</div>
					<form class="am-form am-g">
						<table width="100%"
							class="am-table am-table-bordered am-table-radius am-table-striped" >
							<thead>
								<tr class="am-success">
									<th class="table-id">ID</th>
									<th class="table-title">会员名称</th>
									<th class="table-type">会员密码</th>
									<th class="table-author am-hide-sm-only">账号状态</th>
									<th class="table-author am-hide-sm-only">注册日期</th>
									<th class="table-date am-hide-sm-only">会员邮箱</th>
									<th width="130px" class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${userList }" var="user">
								<tr>
									<td>${user.id }</td>
									<td>${user.username }</td>
									<td>${user.password }</td>
									<td class="am-hide-sm-only">
										<c:if test="${user.status ==0}">
											未激活状态
											<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
													data-am-modal="{target: '#my-popups'}" title="激活该用户" >
													<span class="am-icon-pencil-square-o"></span>
											</button>
										</c:if>
										<c:if test="${user.status ==1}">
											已激活状态
											<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
													data-am-modal="{target: '#my-popups'}" title="拉黑该用户" >
													<span class="am-icon-pencil-square-o"></span>
											</button>
										</c:if>
										<c:if test="${user.status ==2}">
											被拉黑状态
											<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
													data-am-modal="{target: '#my-popups'}" title="取消拉黑该用户" >
													<span class="am-icon-pencil-square-o"></span>
											</button>
										</c:if>
									</td>
									<td class="am-hide-sm-only">${user.time }</td>
									<td class="am-hide-sm-only">${user.email }</td>
									<td>

										<div class="am-btn-toolbar">
											<div class="am-btn-group am-btn-group-xs">
												<button class="am-btn am-btn-default am-btn-xs am-text-success am-round" title="查询此用户订单">
													<span class="am-icon-search" ></span>
												</button>
												
												<button
													class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除会员">
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
							<li class="am-disabled"><a href="#">«</a></li>
							<li class="am-active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">»</a></li>
						</ul>
					</form>

				</div>



				<%@ include file="/admin/footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
</html>