package cn.it.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.it.shop.model.User;

public class UserLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			// 保存当前客户要去的地址
			String goURL = request.getServletPath();
			String param = request.getQueryString();
			
			if(param != null){
				goURL +="?"+param;
			}
			
			request.getSession().setAttribute("goURL", goURL);
			//非法访问，跳转到登录页面
			request.getSession().setAttribute("error", "您还没登录！请登录再来！！");
			
			response.sendRedirect(request.getContextPath()+"/ulogin.jsp");
		}else{
			chain.doFilter(request, response);
		}
			
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
