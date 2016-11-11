package org.spring.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
import org.spring.domain.OrderProdVO;
import org.spring.domain.OrderVO;
import org.spring.domain.SearchCriteria;

public interface OrderDAO {
	public void insOrd(OrderVO vo) throws Exception;
	public void insOrdProd(CartVO vo) throws Exception;
	public void insOrdProdTool(CartVO vo) throws Exception;
	public List<OrderVO> listByEmail(SearchCriteria cri) throws Exception;
	public int listCountByEmail(SearchCriteria cri) throws Exception;
}

