package org.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderVO;
import org.spring.domain.PageMaker;
import org.spring.domain.ProductVO;
import org.spring.domain.SearchCriteria;
import org.spring.service.OrderService;
import org.spring.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manage/product")
public class ProdManageController {
	private static final Logger logger = LoggerFactory.getLogger(ProdManageController.class);
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGET(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) throws Exception {
		logger.info("Product Manage Insert############################");
		
		model.addAttribute("content", "pminsert");
		return "/admin/adminPage";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(SearchCriteria cri,ProductVO pvo, HttpSession session, RedirectAttributes rattr) throws Exception {
		logger.info("Product Manage Insert############################ pvo : " + pvo.toString());
		
		
		
		
		
		
		rattr.addAttribute("pid", pvo.getP_id());
		rattr.addAttribute("page", cri.getPage());
	    rattr.addAttribute("perPageNum", cri.getPerPageNum());
	    rattr.addAttribute("searchType", cri.getSearchType());
	    rattr.addAttribute("keyword", cri.getKeyword());
		
		rattr.addAttribute("content", "pmdetail");
		return "redirect: /manage/product/detail";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) throws Exception {
		logger.info("Product Manage list############################ cri : " + cri.toString());
		
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
		
		model.addAttribute("content", "pmlist"); 
		return "/admin/adminPage";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@ModelAttribute("cri") SearchCriteria cri, int pid, HttpSession session, Model model) throws Exception {
		logger.info("Produt Manage Detail############################ pid: " + pid);
		
		model.addAttribute("pvo", service.getByPid(pid));
		model.addAttribute("content", "pmdetail");
		return "/admin/adminPage";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@ModelAttribute("cri") SearchCriteria cri, int pid, HttpSession session, Model model) throws Exception {
		logger.info("Product Manage Update############################ pid : " + pid);
		
		model.addAttribute("pvo", service.getByPid(pid));
		model.addAttribute("content", "pmupdate");
		return "/admin/adminPage";
	}
	
	
	@RequestMapping(value = "/update/save", method = RequestMethod.POST)
	public String updateSave(SearchCriteria cri, ProductVO pvo, HttpSession session, RedirectAttributes rattr) throws Exception {
		logger.info("Product Manage Update Save############################ pvo : " + pvo.toString());
		
		service.update(pvo);
		
		rattr.addAttribute("pid", pvo.getP_id());
		rattr.addAttribute("page", cri.getPage());
	    rattr.addAttribute("perPageNum", cri.getPerPageNum());
	    rattr.addAttribute("searchType", cri.getSearchType());
	    rattr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect: /manage/product/detail";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(SearchCriteria cri, int pid, HttpSession session, RedirectAttributes rattr) throws Exception {
		logger.info("Product Manage delete############################ pid : " + pid);
		
		service.delete(pid);
		
		rattr.addAttribute("page", cri.getPage());
	    rattr.addAttribute("perPageNum", cri.getPerPageNum());
	    rattr.addAttribute("searchType", cri.getSearchType());
	    rattr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect: /manage/product/list";
	}
}