package org.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
import org.spring.domain.OrderProdVO;
import org.spring.domain.OrderVO;
import org.spring.domain.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO{
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.OrderMapper";

	@Override
	public void insOrd(OrderVO vo) throws Exception {
		sql.insert(namespace+".insOrd", vo);
	}
	@Override
	public void insOrdProd(CartVO vo) throws Exception {
		sql.insert(namespace+".insOrdProd", vo);
	}

	@Override
	public void insOrdProdTool(CartVO vo) throws Exception {
		sql.insert(namespace+".insOrdProdTool", vo);
	}
	@Override
	public List<OrderVO> listByEmail(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".listByEmail", cri);
	}
	@Override
	public int listCountByEmail(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listCountByEmail", cri);
	}

}
