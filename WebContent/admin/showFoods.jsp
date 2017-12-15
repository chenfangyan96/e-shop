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
						<ul class="am-icon-flag on">栏目名称 </ul>
					</div>

					<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
						<ul>
							<li>
								<div class="am-btn-group am-btn-group-xs">
									<select data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}" onchange="window.location=this.value;">
										<c:if test="${typeid!=0 }">
											<option >${type.name }</option>
										</c:if>
										<option value="${basePath }/getFoods.action?typeid=0&columnpage=12">所有商品</option>
										<c:forEach items="${typeList }" var="type">
											<option value="${basePath }/getFoods.action?typeid=${type.id }&columnpage=12">${type.name }</option>
										</c:forEach>
									</select>
								</div>
							</li>
							<li>
								<div class="am-btn-group am-btn-group-xs">
									<select
										data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
										<option value="b">产品分类</option>
										<option value="o">下架</option>
									</select>
								</div>
							</li>
							<form action="${basePath }/getFoodByLikeName.action">
								<input type="hidden" name="current_page" value="${page.current_page }">
								<li><input type="text"
									class="am-form-field am-input-sm am-input-xm" placeholder="关键词搜索" name="lname"/></li>
								<li><button type="submit" class="am-btn am-radius am-btn-xs am-btn-success"
										style="margin-top: -1px;">搜索</button></li>
							</form>
						</ul>
					</div>


					<form class="am-form am-g" action="${basePath }/deleteFoods.action">
						<table width="100%" 
							class="am-table am-table-bordered am-table-radius am-table-striped">
							<thead>
								<tr class="am-success">
									<th class="table-check"></th>
									<th class="table-id">ID</th>
									<th class="table-title">标题</th>
									<th class="table-type">类别</th>
									<th class="table-type">库存</th>
									<th class="table-author am-hide-sm-only">上架/下架 <i
										class="am-icon-check am-text-warning"></i> <i
										class="am-icon-close am-text-primary"></i></th>
									<th class="table-date am-hide-sm-only">修改日期</th>
									<th width="163px" class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>							
							<input type="hidden" name="current_page" value="${page.current_page}">
							<c:forEach items="${subList }" var="food">
								<tr>
									<td><input type="checkbox" name="choose" value="${food.id}"></td>
									<td>${food.id }</td>
									<td>${food.name }</td>
									<td>${food.type.name }</td>
									<td>3000000</td>
									<td class="am-hide-sm-only"><i class="am-icon-check am-text-warning"></i>
									<i class="am-icon-close am-text-primary"></i></td>
									<td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
									<td><div class="am-btn-toolbar">
											<div class="am-btn-group am-btn-group-xs">
												<button type="button" class="am-btn am-btn-default am-btn-xs am-text-success am-round" 
													title="查询该商品" onclick="window.location.href('${basePath }/getFood.action?id=${food.id}&action=1&current_page=${page.current_page }')">
													<span class="am-icon-search"></span>
												</button>
												<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
												title="修改商品信息" onclick="window.location.href('${basePath }/getFood.action?id=${food.id}&action=2')">
													<span class="am-icon-pencil-square-o"></span>
												</button>
												<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
												title="删除该商品" onclick="window.location.href('${basePath }/deleteFood.action?id=${food.id}&current_page=${page.current_page }')">
													<span class="am-icon-trash-o"></span>
												</button>
											</div>
										</div></td>
								</tr>
							</c:forEach>
								
							</tbody>
						</table>

						<div class="am-btn-group am-btn-group-xs">
							<button type="submit" class="am-btn am-btn-default">
								<span class="am-icon-plus"></span> 删除
							</button>
							<button type="button" class="am-btn am-btn-default" onclick="javascript:window.location.href='a.jsp';">
								<span class="am-icon-save"></span> 上架
							</button>
							<button type="button" class="am-btn am-btn-default">
								<span class="am-icon-save"></span> 下架
							</button>
							<button type="button" class="am-btn am-btn-default" onclick="window.location.href('${path2}/addFood.jsp')">
								<span class="am-icon-plus"></span> 新增
							</button>
						</div>
			
						<c:if test="${page != null && page.page_count > 1 }">
							<ul class="am-pagination am-fr">
								<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=1">|«</a></li>
								<c:if test="${page.page_count <= 5}">				
									<c:forEach begin="1" end="${page.page_count }" varStatus="status">
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${status.index }">${status.index }</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${page.page_count > 5}">
									<c:if test="${page.current_page <= 3 && page.current_page >0 }">	
										<c:forEach begin="1" end="5" varStatus="status">
											<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${status.index }">${status.index }</a></li>
										</c:forEach>	
									</c:if>
									<c:if test="${page.current_page > 3 && page.current_page < (page.page_count - 1) }">	
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.current_page - 2 }">${page.current_page - 2 }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.current_page - 1 }">${page.current_page - 1 }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.current_page }">${page.current_page }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.current_page + 1 }">${page.current_page + 1 }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.current_page + 2 }">${page.current_page + 2 }</a></li>			
									</c:if>
									<c:if test="${page.current_page >= (page.page_count - 1) && page.current_page <= page.page_count}">									
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.page_count - 4 }">${page.page_count - 4 }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.page_count - 3 }">${page.page_count - 3 }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.page_count - 2 }">${page.page_count - 2 }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.page_count - 1 }">${page.page_count - 1 }</a></li>
										<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.page_count }">${page.page_count }</a></li>
									</c:if>
								</c:if>					
								<li><a href="${basePath }/getFoods.action?typeid=0&columnpage=12&current_page=${page.page_count }">»|</a></li>
							</ul>
						</c:if>
						




						<hr />
						<p>注：.....</p>
					</form>
				</div>



				<%@ include file="/admin/footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
${msg }
</html>
</html>