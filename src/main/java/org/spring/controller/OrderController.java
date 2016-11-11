package org.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
import org.spring.domain.OrderVO;
import org.spring.domain.UserVO;
import org.spring.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private OrderService service;
	
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public String orderGET(Model model){
		logger.info("order get################################################");
		
		model.addAttribute("content", "order");
		return "/index";
	}
	
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public String orderPOST(OrderVO ovo, HttpSession session, Model model){
		logger.info("order post ################################### OrderVO : "+ovo.toString());
		List<CartVO> list = (List<CartVO>) session.getAttribute("cart");
		
		try {
			String email = ((UserVO)session.getAttribute("login")).getU_email();
			
			ovo.setU_email(email);
			service.insOrder(ovo, list);
			
			
			
			session.removeAttribute("cart");
			model.addAttribute("content", "ocompl");
			return "/index";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("content","order");
		return "/index";
		
	}
}
