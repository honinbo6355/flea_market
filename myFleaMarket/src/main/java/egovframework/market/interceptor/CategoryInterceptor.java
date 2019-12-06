package egovframework.market.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CategoryInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (request.getParameter("perPageNum") == null) {
			String uri = request.getRequestURI();
			String query = request.getQueryString();
			query = "?" + query + "&perPageNum=6";
			response.sendRedirect(uri + query);
		}
		
		return true;
	}
}
