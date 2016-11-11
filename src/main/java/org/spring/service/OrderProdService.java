package org.spring.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.CartVO;
import org.spring.domain.OrderProdVO;

public interface OrderProdService {
	public void insOrdProd(int oid, CartVO vo) throws Exception;
	public void insOrdProdTool(int oid, CartVO vo) throws Exception;
}
