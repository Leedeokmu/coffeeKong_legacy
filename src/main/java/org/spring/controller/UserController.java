package org.spring.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.service.UserService;
import org.spring.utils.ValidationDTOBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
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
	
	
	@ResponseBody
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ResponseEntity<Object> loginPOST (@Valid @RequestBody LoginDTO dto, BindingResult error, HttpSession session ){ 
		logger.info("login ########################### dto : " + dto.toString());
		
		ResponseEntity<Object> entity = null;
		
		if(error.hasErrors()){
            entity = new ResponseEntity<Object>("Fail", HttpStatus.OK);
		}else{
			try {
				UserVO uvo = service.login(dto);
				if(uvo == null){
					entity = new ResponseEntity<Object>("Fail", HttpStatus.OK);
				}else{
					session.setAttribute("login", uvo);
					if(dto.isUseCookie()){
						int duration = 60 * 60 * 24 * 7;
						Date limit = new Date(System.currentTimeMillis() + (duration * 1000));
						service.rmbLogin(uvo.getU_email(), session.getId(), limit);
					}
					entity = new ResponseEntity<Object>("Success", HttpStatus.OK);
				}
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
		}
		logger.info("entity ############ : "+ entity);
		return entity;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request,HttpServletResponse response,
			HttpSession session, RedirectAttributes rttr) throws Exception{ 
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
		rttr.addAttribute("content", "");
		return "redirect:/index";
	}
	
	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody @Valid UserVO uvo, BindingResult result) throws Exception{ 
		logger.info("register ########################### uvo : " + uvo.toString());
		
		ResponseEntity<String> entity = null;
		
		if(result.hasErrors()){
			entity = new ResponseEntity<String>("Fail", HttpStatus.OK);
			
		}else{
			service.register(uvo);
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/registerSuccess", method=RequestMethod.GET)
	public String registerCompl(Model model){
		logger.info("registerSuccess ##########################"); 
	
		model.addAttribute("content", "regCompl");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="/register/chkId", method=RequestMethod.POST)
	public ResponseEntity<String> chkId( String u_email){
		logger.info("chkId ########################### email : " + u_email);
		ResponseEntity<String> entity = null;
		
		try {
			String email = service.checkDuplicate(u_email);
			if(email != null){
				entity = new ResponseEntity<String>("false", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("true", HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
