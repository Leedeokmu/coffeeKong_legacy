package org.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		UserVO uvo = (UserVO) modelMap.get("uvo");

		if (uvo != null) {
			logger.info("login success ####################");
			session.setAttribute("login", uvo);

			if (request.getParameter("useCookie") != null) {
				Cookie loginCookie = new Cookie("login_id", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 3);
				response.addCookie(loginCookie);
			}
			String dest = (String) session.getAttribute("dest");

			response.sendRedirect(dest != null ? (String) dest : "/index");
		}
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			logger.info("clear login session attr #######################");
			session.removeAttribute("login");
		}
		return true;
	}
}
