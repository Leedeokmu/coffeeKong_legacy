package org.spring.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderProdVO;

public interface OrderProdDAO {
	public void insOrdProd(OrderProdVO vo) throws Exception;
}
