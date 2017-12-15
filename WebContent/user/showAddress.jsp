<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/common/path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<link href="${basePath }/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${basePath }/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="${basePath }/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
				<div class="contact">
				<div class="contact-in">
				<h2>收货地址修改</h2>
				<div class=" col-md-9 contact-left">
				  
					    <form action="${basePath}/updateAddress.action">
					    	<input name="id" type="hidden" class="textbox" value="${address.id }">
					    	<div>
						    	<span>收货人：</span>
						    	<input name="name" type="text" class="textbox" value="${address.name }">
						    </div>
						    <div>
						    	<span>联系方式：</span>
						    	<input name="telephone" type="text" class="textbox" value="${address.telephone }">
						    </div>
						    <div>
						    	<span>省市区：</span>
						    	<input name="area" type="text" class="textbox" value="${address.area }">
						    </div>
						     <div>
						    	<span>街道：</span>
						    	<input name="street" type="text" class="textbox" value="${address.street }">
						    </div>
						      <div>
						    	<span>详细信息：</span>
						    	<input name="fulladdress" type="text" class="textbox" value="${address.fulladdress }">
						    </div>
						   <div>
						   		<span><input type="submit" value="修改"></span>
						  </div>
					    </form>
				  </div>

				<div class=" col-md-3 contact-right" style="top:72px;">
				     	<h5>Company Information</h5>
						    	<p>500 Lorem Ipsum Dolor Sit,</p>
						   		<p>22-56-2-9 Sit Amet, Lorem,</p>
						   		<p>USA</p>
				   		<p>Phone:(00) 222 666 444</p>
				   		<p>Fax: (000) 000 00 00 0</p>
				 	 	<p>Email: <a href="mailto:info@mycompany.com">info@mycompany.com</a></p>
				   		<p>Follow on: <a href="#">Facebook</a>, <a href="#">Twitter</a></p>
				    </div>
					  <div class="clearfix"></div>
				 </div>
			
      		</div>
		    </div>
	
	
	<!---->
	<!--footer-->
	<jsp:include page="/footer.jsp" />
	<!---->
</body>
</html>