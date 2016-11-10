package org.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		logger.info("index ############################");
		
		model.addAttribute("content", "");
		return "index";
	}
	
	@RequestMapping(value = "/info/{type}", method = RequestMethod.GET)
	public String information(@PathVariable String type, Model model) {
		logger.info("information ############################ info : " + type);
		
		model.addAttribute("content",type);
		return "index";
	}
	
	@RequestMapping(value = "/learn", method = RequestMethod.GET)
	public String learn() {
		logger.info("learn ############################");
		
		return "/learn/learn";
	}
	
	@RequestMapping(value = "/learn/{type}", method = RequestMethod.GET)
	public String learn(@PathVariable String type, Model model) {
		logger.info("learn ############################ type : " + type);
		
		model.addAttribute("content",type);
		return "/learn/learn";
	}
	
	
}
