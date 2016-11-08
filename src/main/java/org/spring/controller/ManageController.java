package org.spring.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.MgrVO;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.service.MgrService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/manage")
public class ManageController {
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Inject
	private MgrService service;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String index(Model model, HttpSession session){
		logger.info("manage index ##############################");
		
		if(session.getAttribute("mgr") == null){
			model.addAttribute("content", "login");
			return "/admin/adminPage";
		}
		model.addAttribute("content", "");
		return "/admin/adminPage";
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(Model model){
		logger.info("manage login##############################");
		
		model.addAttribute("content", "login");
		return "/admin/adminPage";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST (@Valid LoginDTO dto, BindingResult error, HttpSession session, RedirectAttributes rttr ){ 
		logger.info("manage login ########################### dto : " + dto.toString());
		
		if(error.hasErrors()){
			rttr.addAttribute("errmsg", "CHECK THE FORM");
            return "redirect:/admin/login";
		}else{
			try {
				MgrVO mvo = service.login(dto);
				if(mvo == null){
					rttr.addAttribute("errmsg", "EMAIL & PASSWORD NOT MATCHED");
					return "redirect:/manage/login";
				}else{
					session.setMaxInactiveInterval(60*60*24);
					session.setAttribute("mgr", mvo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/manage";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request,HttpServletResponse response,
			HttpSession session, RedirectAttributes rttr) throws Exception{ 
		logger.info("mgr logout #############################");
		Object status = session.getAttribute("mgr");
		if(status != null){
			session.removeAttribute("mgr");
			session.invalidate();
		}
		
		rttr.addAttribute("content", "");
		return "redirect:/index";
	}
}
