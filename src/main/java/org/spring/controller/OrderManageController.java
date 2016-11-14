package org.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderVO;
import org.spring.domain.PageMaker;
import org.spring.domain.SearchCriteria;
import org.spring.domain.UserVO;
import org.spring.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manage/order")
public class OrderManageController {
	private static final Logger logger = LoggerFactory.getLogger(OrderManageController.class);
	
	@Inject
	private OrderService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) throws Exception {
		logger.info("Order Manage list############################ cri : " + cri.toString());
		
		model.addAttribute("list", service.list(cri));
		PageMaker pmk = new PageMaker();
		pmk.setCri(cri);
		pmk.setTotalCount(service.listCount(cri));
		model.addAttribute("pmk",pmk);
		
		if(cri.getKeyword() == null || cri.getKeyword() == ""){
			model.addAttribute("search", "off");
		}else{
			model.addAttribute("search", "on");
		}
		
		logger.info("search ######################## : " + cri.getKeyword());
		
		model.addAttribute("content", "omlist");
		return "/admin/adminPage";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@ModelAttribute("cri") SearchCriteria cri, int oid, HttpSession session, Model model) throws Exception {
		logger.info("Order Manage Detail############################ oid: " + oid);
		
		model.addAttribute("ovo", service.getByOid(oid));
		model.addAttribute("content", "omdetail");
		return "/admin/adminPage";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@ModelAttribute("cri") SearchCriteria cri, int oid, HttpSession session, Model model) throws Exception {
		logger.info("Order Manage Update############################ oid : " + oid);
		
		model.addAttribute("ovo", service.getByOid(oid));
		model.addAttribute("content", "omupdate");
		return "/admin/adminPage";
	}
	
	@RequestMapping(value = "/update/save", method = RequestMethod.POST)
	public String updateSave(SearchCriteria cri, OrderVO ovo, HttpSession session, RedirectAttributes rattr) throws Exception {
		logger.info("Order Manage list############################ ovo : " + ovo.toString());
		
		service.update(ovo);
		
		rattr.addAttribute("page", cri.getPage());
	    rattr.addAttribute("perPageNum", cri.getPerPageNum());
	    rattr.addAttribute("searchType", cri.getSearchType());
	    rattr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect: /manage/order/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(SearchCriteria cri, int oid, HttpSession session, RedirectAttributes rattr) throws Exception {
		logger.info("Order Manage delete############################ oid : " + oid);
		
		service.delete(oid);
		
		rattr.addAttribute("page", cri.getPage());
	    rattr.addAttribute("perPageNum", cri.getPerPageNum());
	    rattr.addAttribute("searchType", cri.getSearchType());
	    rattr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect: /manage/order/list";
	}
	
	@RequestMapping(value = "/update/state", method = RequestMethod.POST)
	public String updateState(SearchCriteria cri, int oid, String state, HttpSession session, RedirectAttributes rattr) throws Exception {
		logger.info("Order Manage Update State############################ oid : " + oid + ", state : " + state);
		
		service.updateState(oid, state);
		
		rattr.addAttribute("page", cri.getPage());
	    rattr.addAttribute("perPageNum", cri.getPerPageNum());
	    rattr.addAttribute("searchType", cri.getSearchType());
	    rattr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect: /manage/order/list";
	}

}
