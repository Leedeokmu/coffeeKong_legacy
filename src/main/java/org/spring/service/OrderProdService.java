package org.spring.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderProdVO;

public interface OrderProdService {
	public void insOrdProd(OrderProdVO vo) throws Exception;
}
