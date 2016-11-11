package org.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
import org.spring.domain.OrderVO;
import org.spring.domain.SearchCriteria;
import org.spring.persistence.OrderDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService{
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

	@Inject
	private OrderDAO dao;
	
	@Transactional
	@Override
	public void insOrder(OrderVO vo, List<CartVO> list) throws Exception {
		ArrayList<String> category = new ArrayList<String>();
		category.add("SingleOrigins");	category.add("Blends");	category.add("Decafs");
		category.add("Light");	category.add("Medium");  category.add("Dark");	category.add("ColdBrew");
		
		for(CartVO cvo : list){
			if(category.contains(cvo.getP_category())){
				dao.insOrdProd(cvo);
			}else{
				dao.insOrdProdTool(cvo);
			}
		}
		dao.insOrd(vo);
	}

	@Override
	public List<OrderVO> listByEmail(SearchCriteria cri) throws Exception {
		return dao.listByEmail(cri);
	}

	@Override
	public int listCountByEmail(SearchCriteria cri) throws Exception {
		return dao.listCountByEmail(cri);
	}
}
