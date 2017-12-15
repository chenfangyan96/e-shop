<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="footer">
	<div class="container">
		<div class="col-md-8 footer-bottom ">
			<h4>Welcome to food shop</h4>
			<p>Thank you for your support,look forward to seeing you next time!</p>
			<p class="footer-grid">
				Copyright &copy; 2017.Company name All rights reserved.
			</p>

		</div>
		<div class="col-md-4 footer-bottom ">
			<ul class="social-icons">
				<li><a href="#"><span> </span> </a></li>
				<li class="tin"><a href="#"><span> </span></a></li>
				<li class="linked"><a href="#"><span> </span> </a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
<a href="#" id="toTop" style="display: block;"> <span
	id="toTopHover" style="opacity: 1;"> </span></a>