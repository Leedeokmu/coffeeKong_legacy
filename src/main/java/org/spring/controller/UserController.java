package org.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.service.OrderService;
import org.spring.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService uservice;
	@Inject
	private OrderService oservice;
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGET(HttpSession session, Model model) throws Exception {
		logger.info("User Update############################ session name: " + ((UserVO)session.getAttribute("login")).getU_email());
		
		model.addAttribute("content", "uupdate");
		return "/index";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(@Valid UserVO uvo, BindingResult result, Model model) throws Exception {
		logger.info("User Update############################ uvo: " + uvo.toString());
		
		if(result.hasErrors()){
			return "/user/update";
		}
		uservice.update(uvo);
		model.addAttribute("content", "uucompl");
		
		return "/index";
	}
	
	@RequestMapping(value = "/resign", method = RequestMethod.GET)
	public String resignGET(HttpSession session, Model model) throws Exception {
		logger.info("User Resign############################ session name: " + ((UserVO)session.getAttribute("login")).getU_email());
		
		model.addAttribute("content", "uresign");
		return "/index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/resign", method = RequestMethod.POST)
	public ResponseEntity<String> resignPOST(@RequestBody UserVO uvo) throws Exception {
		logger.info("User Resign############################");
		
		ResponseEntity<String> entity = null;
		
		try {
			String email = uservice.checkUserPw(uvo);
			if(email != null){
				uservice.deleteUser(email);
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("Fail", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/urcompl", method = RequestMethod.GET)
	public String resignCompl(HttpSession session, Model model) throws Exception {
		logger.info("User Resign Complete############################");
		
		model.addAttribute("content", "urcompl");
		return "/index";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderGET(HttpSession session, Model model) throws Exception {
		logger.info("User Order############################ session name: " + ((UserVO)session.getAttribute("login")).getU_email());
		

		
		
		model.addAttribute("content", "uolist");
		return "/index";
	}
	
	
	
}
