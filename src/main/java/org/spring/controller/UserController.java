package org.spring.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(Model model){
		logger.info("login ##########################"); 
	
		model.addAttribute("content", "login");
		return "index";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{ 
		logger.info("login ########################### dto : " + dto.toString());
		
		UserVO uvo = service.login(dto);
		if(uvo == null){
			return;
		}else{
			model.addAttribute("uvo", uvo);
			if(dto.isUseCookie()){
				int duration = 60 * 60 * 24 * 7;
				Date limit = new Date(System.currentTimeMillis() + (duration * 1000));
				service.rmbLogin(uvo.getU_email(), session.getId(), limit);
			}
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,RedirectAttributes rttr) throws Exception{ 
		logger.info("logout #############################");
		Object status = session.getAttribute("login");
		if(status != null){
			UserVO uvo = (UserVO)status;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie cookie = WebUtils.getCookie(request, "login_id");
			if(cookie != null){
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				service.rmbLogin(uvo.getU_email(), session.getId(), new Date());
			}
		}
		return "redirect:/index";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(UserVO uvo, HttpSession session) throws Exception{ 
		logger.info("register ########################### uvo : " + uvo.toString());
		
		service.register(uvo);
		return "/index";
	}
}
