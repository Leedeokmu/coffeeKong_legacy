package org.spring.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.OrderVO;

public interface OrderService {
	public void insOrder(OrderVO vo) throws Exception;
}
