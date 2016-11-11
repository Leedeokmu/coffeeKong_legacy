package org.spring.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderVO;
import org.spring.persistence.OrderDAO;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

	@Inject
	private OrderDAO dao;
	
	@Override
	public void insOrder(OrderVO vo) throws Exception {
		dao.insOrd(vo);
	}

	@Override
	public int getNextVal() throws Exception {
		return dao.getNextVal();
	}
	
	
}
