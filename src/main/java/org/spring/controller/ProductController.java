package org.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/list/{category}", method = RequestMethod.GET)
	public String list(@PathVariable String category,  Model model) throws Exception {
		logger.info("product list############################ category: " + category);
		
		model.addAttribute("list", service.getProdList(category));
		model.addAttribute("content", "list");
		return "/product/product";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String deatil(int pid,  Model model) throws Exception {
		logger.info("product detail############################ pid: " + pid);
		
		model.addAttribute("pvo", service.getProdDetail(pid));
		model.addAttribute("content", "detail");
		return "/product/product";
	}
	
	
}
