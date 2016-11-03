package org.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		logger.info("index ############################");
		return "index";
	}
	@RequestMapping(value = "/learn/learn", method = RequestMethod.GET)
	public String learn() {
		logger.info("learn ############################");
		return "/learn/learn";
	}
	
	
}
