package org.spring.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderProdVO;
import org.spring.persistence.OrderDAO;
import org.spring.persistence.OrderProdDAO;
import org.springframework.stereotype.Service;

@Service
public class OrderProdServiceImpl implements OrderProdService{
	private static final Logger logger = LoggerFactory.getLogger(OrderProdServiceImpl.class);
	
	@Inject
	private OrderProdDAO dao;

	@Override
	public void insOrdProd(OrderProdVO vo) throws Exception {
		dao.insOrdProd(vo);
	}
	
	
}
