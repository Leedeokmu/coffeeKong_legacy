package org.spring.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderProdVO;

public class OrderProdDAOImpl implements OrderProdDAO{
	private static final Logger logger = LoggerFactory.getLogger(OrderProdDAOImpl.class);
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.OrderProdMapper";
	
	@Override
	public void insOrdProd(OrderProdVO vo) throws Exception {
		sql.insert(namespace+".insOrdProd", vo);
	}
}
