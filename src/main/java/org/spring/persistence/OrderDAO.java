package org.spring.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderProdVO;
import org.spring.domain.OrderVO;

public interface OrderDAO {
	public void insOrd(OrderVO vo) throws Exception;
	public int getNextVal() throws Exception;
	
}

