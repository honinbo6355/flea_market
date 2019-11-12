package egovframework.market.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.market.login.service.UserVO;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("USER");
	
		if (user == null) { /* 로그인 하지 않았을 경우 */
			response.sendRedirect("/main.do");
			return false;
		} else if (!user.getAuthority().getAuthority().equals("admin")) { /* admin이 아닌 경우 */
			response.sendRedirect("/main.do");
			return false;
		} else { /* admin인 경우 */
			return true;
		}
	}
}