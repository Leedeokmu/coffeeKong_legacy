package org.spring.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
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
		logger.info("User Update############################ session name: "
				+ ((UserVO) session.getAttribute("login")).getU_email());

		model.addAttribute("content", "uupdate");
		return "/index";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(@Valid UserVO uvo, BindingResult result, Model model) throws Exception {
		logger.info("User Update############################ uvo: " + uvo.toString());

		if (result.hasErrors()) {
			return "/user/update";
		}
		uservice.update(uvo);
		model.addAttribute("content", "uucompl");

		return "/index";
	}

	@RequestMapping(value = "/resign", method = RequestMethod.GET)
	public String resignGET(HttpSession session, Model model) throws Exception {
		logger.info("User Resign############################ session name: "
				+ ((UserVO) session.getAttribute("login")).getU_email());

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
			if (email != null) {
				uservice.deleteUser(email);
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);
			} else {
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
		logger.info("User Order############################ session name: "
				+ ((UserVO) session.getAttribute("login")).getU_email());

		model.addAttribute("content", "uolist");
		return "/index";
	}

	@ResponseBody
	@RequestMapping(value = "/tocart", method = RequestMethod.POST)
	public ResponseEntity<String> tocart(@RequestBody CartVO cvo, HttpSession session) throws Exception {
		logger.info("User cart############################ cvo : " + cvo.toString());

		ResponseEntity<String> entity = null;

		try {
			List<CartVO> list = (ArrayList<CartVO>) session.getAttribute("cart");

			if (list != null) {
				logger.info("session.cart############################");
				logger.info("list############################");
				for (CartVO vo : list) {
					logger.info(vo.toString());
				}

				for (Iterator<CartVO> it = list.iterator(); it.hasNext();) {
					CartVO vo = it.next();
					if (vo.getP_id() == cvo.getP_id() && vo.getType().equals(cvo.getType()) && vo.getSz().equals(cvo.getSz())) {
						it.remove();
					}
				}
			} else {
				list = new ArrayList<CartVO>();
			}
			UUID c_num  = UUID.randomUUID();
			cvo.setC_num(c_num.toString());
			
			list.add(cvo);
			session.setAttribute("cart", list);

			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("tocart", e.getStackTrace());
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) throws Exception {
		logger.info("User cart list############################");

		model.addAttribute("content", "cart");
		return "/index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart/update", method = RequestMethod.POST)
	public ResponseEntity<String> cartUpdate(@RequestBody CartVO cvo, HttpSession session) throws Exception {
		logger.info("User cart update############################ cvo : " + cvo.toString());

		ResponseEntity<String> entity = null;

		try {
			List<CartVO> list = (ArrayList<CartVO>) session.getAttribute("cart");

			if (list != null) {
				logger.info("list############################");
				for (CartVO vo : list) {
					logger.info(vo.toString());
				}
				for (ListIterator<CartVO> it = list.listIterator(); it.hasNext();) {
					
					CartVO vo = list.get(it.nextIndex());
					if (vo.getC_num().equals(cvo.getC_num())) {
						list.get(it.nextIndex()).setQty(cvo.getQty());
						list.get(it.nextIndex()).setType(cvo.getType());
						list.get(it.nextIndex()).setSz(cvo.getSz());
						list.get(it.nextIndex()).setSub_price(cvo.getSub_price());
						
						break;
					}
					it.next();
				}
			}
			
			session.setAttribute("cart", list);

			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("tocart", e.getStackTrace());
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
