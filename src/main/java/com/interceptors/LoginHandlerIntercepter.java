package com.interceptors;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.httpModel.SessionInfo;
import com.model.User;
import com.utils.ResourceUtil;

/**
 * 登录验证拦截器
 */
public class LoginHandlerIntercepter implements HandlerInterceptor {

	
	/**
	 * 执行时机：视图已经被解析完毕,类似try catch 后的finally
	 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {
		System.out.println("afterCompletion01.........");
	}

	/**
	 * 执行时机：controller执行完，视图解析器没有把视图解析成页面,
	 * 对视图做统一的修改，主要体现在Model上
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle01.........");
	}

	/**
	 * 执行时机：在执行controller之前来执行
	 * 返回值类型：boolean：true代表放行可以访问controller，false不可以访问controller
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		System.out.println("preHandle01.........");
		String url = request.getRequestURI();  
        //URL:login.do是公开的;可以公开访问的，不对其进行拦截，其它的URL都进行拦截控制 
		//如果访问login.do，那么则放行，让其访问到usercontroller，并进行后面的东西 
        if(url.indexOf("login.do")>=0||url.indexOf("addUser.do")>=0||url.indexOf("checkUserName.do")>=0){  
        	System.out.println("sxh====访问登录/注册/检查用户名是否存在放行，不拦截");
            return true;  
        }  
		
        //获取存到
		SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(ResourceUtil.getSessionInfoName());
		System.out.println("sessionInfo="+sessionInfo);
		if (sessionInfo == null) {// 没有登录系统，或登录超时
			request.getRequestDispatcher("/WEB-INF/jsp/loginfail.jsp").forward(request, response); 
			System.out.println("sxh====防止未登录就直接进入后台");
			return false;
		}

		//查找到用户，放行
		if (null!=sessionInfo.getUser()) {
			System.out.println("sxh====若验证属于管理员或用户就让其进入后台管理界面，不拦截");
			return true;
		}
		System.out.println("sxh====以上if验证均没有进入,不明原因，跳转到提示界面！");
		request.getRequestDispatcher("/WEB-INF/jsp/loginfail.jsp").forward(request, response); 
		return false;
		
		
	}
}
