package org.spring.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
import org.spring.domain.OrderProdVO;
import org.springframework.stereotype.Repository;

@Repository
public class OrderProdDAOImpl implements OrderProdDAO{
	private static final Logger logger = LoggerFactory.getLogger(OrderProdDAOImpl.class);
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.OrderProdMapper";
	
	@Override
	public void insOrdProd(int oid, CartVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oid", oid);
		map.put("vo", vo);
		sql.insert(namespace+".insOrdProd", map);
	}

	@Override
	public void insOrdProdTool(int oid, CartVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oid", oid);
		map.put("vo", vo);
		sql.insert(namespace+".insOrdProdTool", map);
	}
}
