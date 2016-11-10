package org.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping("/order")
	public String order(Model model){
		logger.info("order ################################################");
		
		model.addAttribute("content", "order");
		return "/index";
	}
	
			
	
}
