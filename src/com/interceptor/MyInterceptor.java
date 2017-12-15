package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODOif (!"".equals(imagefile.getOriginalFilename())) { Auto-generated method stub
	    MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
	    MultipartFile a = multipartRequest.getFile("imagefile");
	    if ("".equals(a.getOriginalFilename())) {
	    	String msg = "<script>alert(\"请上传您的头像!\")</script>";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("register.jsp").forward(request, response);
	    	return false;
	    }else {
	    	return true;
	    }
	}

}
