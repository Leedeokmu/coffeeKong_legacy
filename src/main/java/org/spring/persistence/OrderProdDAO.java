package org.spring.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
import org.spring.domain.OrderProdVO;

public interface OrderProdDAO {
	public void insOrdProd(int oid, CartVO vo) throws Exception;
	public void insOrdProdTool(int oid, CartVO vo) throws Exception;
}
